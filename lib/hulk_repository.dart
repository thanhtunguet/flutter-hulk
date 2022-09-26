import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_hulk/hulk_model.dart';

class HulkRepository {
  late String _baseURL;

  late Dio httpClient;

  static InterceptorSendCallback? requestInterceptor;

  static InterceptorSuccessCallback? responseInterceptor;

  static InterceptorErrorCallback? errorInterceptor;

  static final List<HulkRepository> _instances = [];

  static get instances {
    return _instances;
  }

  HulkRepository({
    required String baseURL,
    InterceptorSendCallback? requestInterceptor,
    InterceptorSuccessCallback? responseInterceptor,
    InterceptorErrorCallback? errorInterceptor,
  }) {
    httpClient = Dio();
    httpClient.options.headers[HttpHeaders.contentTypeHeader] =
        'application/json';

    _baseURL = baseURL;

    addInterceptors(
      requestInterceptor: requestInterceptor,
      responseInterceptor: responseInterceptor,
      errorInterceptor: errorInterceptor,
    );

    _instances.add(this);
  }

  set baseURL(String baseURL) {
    _baseURL = baseURL;
  }

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

  String createUri(String path) {
    return Uri.parse(_baseURL)
        .replace(
          path: path,
        )
        .toString();
  }

  T responseMapToModel<T extends HulkModel>(dynamic T, Response response) {
    return T.fromJSON(response.data);
  }

  List<T> responseMapToList<T extends HulkModel>(dynamic T, Response response) {
    return response.data.map((element) => T.fromJSON(element));
  }

  T responseMap<T>(Response response) {
    return response.data;
  }
}
