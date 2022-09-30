import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_hulk/data/hulk_http_repository.dart';
import 'package:flutter_hulk/hulk_model.dart';

abstract class Repository with HttpRepository {
  static final List<Repository> _instances = [];

  static get instances {
    return _instances;
  }

  Repository({
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

  /// Map HTTP response to a Model
  ///
  /// @param response - HTTP response
  T responseMapToModel<T extends Model>(dynamic modelClass, Response response) {
    T model = modelClass();
    model.fromJSON(response.data);
    return model;
  }

  /// Map HTTP response to list of models that extends Model
  ///
  /// @param response - HTTP response
  List<T> responseMapToList<T extends Model>(
    dynamic modelClass,
    Response<List<Map<String, dynamic>>> response,
  ) {
    return response.data!.map((value) {
      T model = modelClass();
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
