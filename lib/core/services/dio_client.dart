import 'package:dio/dio.dart';

abstract class DioClient {

  Future<Response<T>> get<T>(
    String url, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response<T>> post<T>(
    String url, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response<T>> delete<T>(
    String url, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<Response<T>> patch<T>(
    String url, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  void cancelRequest();
}