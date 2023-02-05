import 'package:dio/dio.dart';

mixin HttpRepository {
  late Dio httpClient;

  String get baseURL {
    throw Exception("get baseURL is not implemented");
  }

  /// Create a fully-qualified URL for API request
  ///
  /// @param path path of the API
  /// @return the fully-qualified URL
  String createUri(String path) {
    return Uri.parse(baseURL)
        .replace(
          path: path,
        )
        .toString();
  }

  /// Add interceptors to httpClient
  addInterceptors({
    InterceptorSendCallback? requestInterceptor,
    InterceptorSuccessCallback? responseInterceptor,
    InterceptorErrorCallback? errorInterceptor,
  }) {
    httpClient.interceptors.add(InterceptorsWrapper(
      onRequest: requestInterceptor,
      onResponse: responseInterceptor,
      onError: errorInterceptor,
    ));
  }
}
