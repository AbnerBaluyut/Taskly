import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../errors/network_exception.dart';
import '../errors/not_found_exception.dart';
import '../errors/server_exception.dart';
import '../errors/time_out_exception.dart';
import '../errors/unauthorized_exception.dart';
import '../errors/unknown_exception.dart';

class DioClient {

  final Dio _dio;

  DioClient({
    required String baseUrl,
  }) : _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
    ),
  ) {

    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          request: true,
          responseBody: true,
          requestBody: true,
          error: true,
        ),
      );
    }

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add any custom headers or authentication tokens here
          // options.headers['Authorization'] = 'Bearer YOUR_TOKEN';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Handle the response here if needed
          return handler.next(response);
        },
        onError: (e, handler) {
          
          if (e.type == DioExceptionType.cancel) {
            return;
          }
          
          return handler.reject(_mapError(e));
        },
      ),
    );
  }

  Dio get instance => _dio;

  DioException _mapError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.sendTimeout) {
      return DioException(requestOptions: e.requestOptions, error: TimeoutException());
    }

    if (e.type == DioExceptionType.badResponse) {
      
      final code = e.response?.statusCode ?? 0;
      final data = e.response?.data;

      switch (code) {
        case 400:
          return DioException(requestOptions: e.requestOptions, error: ServerException(data['message'] ?? "Bad Request", code: code));
        case 401:
          return DioException(requestOptions: e.requestOptions, error: UnauthorizedException(data['message'] ?? "Unauthorized", code: code));
        case 404:
          return DioException(requestOptions: e.requestOptions, error: NotFoundException());
        default:
          return DioException(requestOptions: e.requestOptions, error: ServerException(data['message'] ?? "Server Error", code: code));
      }
    }

    if (e.type == DioExceptionType.unknown) {
      return DioException(requestOptions: e.requestOptions, error: NetworkException("No internet connection"));
    }

    return DioException(requestOptions: e.requestOptions, error: UnknownException(e.message ?? "Unknown error"));
  }
}