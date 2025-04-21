import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../_di/injections.dart';
import '../styles/keys.dart';
import '../utils/shared_preferences_manager.dart';
import 'dio_client.dart';
import 'errors/network_exception.dart';
import 'errors/not_found_exception.dart';
import 'errors/server_exception.dart';
import 'errors/time_out_exception.dart';
import 'errors/unauthorized_exception.dart';
import 'errors/unknown_exception.dart';
import '../styles/strings.dart';

class DioClientImpl implements DioClient {

  final SharedPreferenceManager _sharedPreferenceManager = getIt();
  final Dio _dio;
  CancelToken? _cancelToken;

  DioClientImpl({
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
    _cancelToken = CancelToken();
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
          if (_sharedPreferenceManager.isLoggedIn) {
            options.headers[Keys.authorization] = 'Bearer ${_sharedPreferenceManager.getUser.accessToken}';
          }
          _logData(options.data);
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

  // Dio get instance => _dio;

  void _logData(dynamic data) {

    if (data is FormData) {
      final Map<String, dynamic> formDataMap = {};
      for (var field in data.fields) {
        formDataMap[field.key] = field.value;
      }
      log("~~~ Params: ${formDataMap.toString()}");
    } else {
      log("~~~ Params: $data");
    }
  }

  DioException _mapError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.sendTimeout) {
      return DioException(requestOptions: e.requestOptions, error: TimeoutException());
    }

    if (e.type == DioExceptionType.badResponse) {
      
      final code = e.response?.statusCode ?? 0;
      final data = e.response?.data;

      switch (code) {
        case 400:
          if (data['old_password'] != null) {
            return DioException(requestOptions: e.requestOptions, error: ServerException("Your current password is incorrect", code: code));
          } 
          return DioException(requestOptions: e.requestOptions, error: ServerException(data['message'] ?? "Bad Request", code: code));
        case 401:
          if (data['code'] != null) {
            return DioException(requestOptions: e.requestOptions, error: ServerException("Session Expired", code: code));
          }
          return DioException(requestOptions: e.requestOptions, error: UnauthorizedException(data?['messages']?["message"] ?? data['message'] ?? "Unauthorized", code: code));
        case 404:
          return DioException(requestOptions: e.requestOptions, error: NotFoundException());
        default:
          return DioException(requestOptions: e.requestOptions, error: ServerException(Strings.errorMessage, code: code));
      }
    }

    if (e.type == DioExceptionType.unknown) {
      return DioException(requestOptions: e.requestOptions, error: NetworkException(Strings.noInternetConnection));
    }

    return DioException(requestOptions: e.requestOptions, error: UnknownException(Strings.errorMessage));
  }

  @override
  void cancelRequest() {
    _cancelToken?.cancel();
    _cancelToken = CancelToken();
  }
  
  @override
  Future<Response<T>> delete<T>(
    String url, 
    {
      Object? body, 
      Map<String, dynamic>? queryParameters, 
      Options? options
    }
  ) {
    cancelRequest();
    return _dio.delete(
      url, 
      data: body,
      queryParameters: queryParameters,
      options: options,
      cancelToken: _cancelToken
    );
  }
  
  @override
  Future<Response<T>> get<T>(
    String url, 
    {
      Object? body, 
      Map<String, dynamic>? queryParameters, 
      Options? options, 
      ProgressCallback? onReceiveProgress
    }
  ) {
    cancelRequest();
    return _dio.get(
      url, 
      data: body,
      queryParameters: queryParameters,
      options: options,
      onReceiveProgress: onReceiveProgress,
      cancelToken: _cancelToken
    );
  }
  
  @override
  Future<Response<T>> patch<T>(
    String url, 
    {
      Object? body, 
      Map<String, dynamic>? queryParameters, 
      Options? options, 
      ProgressCallback? onSendProgress, 
      ProgressCallback? onReceiveProgress
    }
  ) {
    cancelRequest();
    return _dio.patch(
      url, 
      data: body,
      queryParameters: queryParameters,
      options: options,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      cancelToken: _cancelToken
    );
  }
  
  @override
  Future<Response<T>> post<T>(
    String url, 
    {
      Object? body, 
      Map<String, dynamic>? queryParameters, 
      Options? options, 
      ProgressCallback? onSendProgress, 
      ProgressCallback? onReceiveProgress
    }
  ) {
    cancelRequest();
    return _dio.post(
      url, 
      data: body,
      queryParameters: queryParameters,
      options: options,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      cancelToken: _cancelToken
    );
  }
}