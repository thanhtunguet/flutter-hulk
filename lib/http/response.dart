import 'package:dio/dio.dart';

import '../flutter_hulk.dart';
import '../reflection/reflector.dart';

extension ExtendedResponse on Response {
  T body<T extends DataClass>() {
    T model = ReflectionHelper.newInstance(T);
    model.fromJSON(data);
    return model;
  }

  List<T> list<T extends DataClass>() {
    return data.map((element) {
      T model = ReflectionHelper.newInstance(T);
      model.fromJSON(element);
      return model;
    });
  }
}
