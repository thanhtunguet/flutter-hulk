import '../reflection/reflector.dart';

import '../json_property_descriptor.dart';
import '../model.dart';

class JsonObject<T extends Model> extends JsonPropertyDescriptor<T> {
  Type classType = T;

  JsonObject() : super();

  JsonObject.fromJSON(Map<String, dynamic> json) : super.fromJSON(json) {
    T model = ReflectionHelper.newInstance(T);
    model.fromJSON(json);
    value = model;
  }

  void fromJSON(Map<String, dynamic> json) {
    value = ReflectionHelper.newInstance(T);
    value!.fromJSON(json);
  }
}
