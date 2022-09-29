import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_hulk/data/hulk_http_repository.dart';
import 'package:flutter_hulk/hulk_model.dart';

abstract class HulkRepository with HulkHttpRepository {
  static final List<HulkRepository> _instances = [];

  static get instances {
    return _instances;
  }

  HulkRepository({
    InterceptorSendCallback? requestInterceptor,
    InterceptorSuccessCallback? responseInterceptor,
    InterceptorErrorCallback? errorInterceptor,
  }) {
    httpClient = Dio();
    httpClient.options.headers[HttpHeaders.contentTypeHeader] =
        'application/json';

    addInterceptors(
      requestInterceptor: requestInterceptor,
      responseInterceptor: responseInterceptor,
      errorInterceptor: errorInterceptor,
    );

    _instances.add(this);
  }

  /// Map HTTP response to a HulkModel
  ///
  /// @param response - HTTP response
  T responseMapToModel<T extends HulkModel>(dynamic T, Response response) {
    T model = T();
    model.fromJSON(response.data);
    return model;
  }

  /// Map HTTP response to list of models that extends HulkModel
  ///
  /// @param response - HTTP response
  List<T> responseMapToList<T extends HulkModel>(
    dynamic T,
    Response<List<Map<String, dynamic>>> response,
  ) {
    return response.data!.map((value) {
      T model = T();
      model.fromJSON(value);
      return model;
    }).toList();
  }

  /// Map HTTP response to primitive types: int, double, float, string, boolean
  ///
  /// @param response - HTTP response
  T? responseMap<T>(Response<T?> response) {
    return response.data;
  }
}
