import '../json_property_descriptor.dart';
import '../model.dart';
import '../reflection/reflector.dart';

class JsonObject<T extends Model> extends JsonPropertyDescriptor<T> {
  Type classType = T;

  JsonObject() : super();

  JsonObject.fromJSON(Map<String, dynamic> json) : super.fromJSON(json) {
    T model = ReflectionHelper.newInstance(T);
    model.fromJSON(json);
    value = model;
  }

  @override
  void fromJSON(dynamic json) {
    if (json is Map) {
      value = ReflectionHelper.newInstance(T);
      value!.fromJSON(json);
      return;
    }
    throw const FormatException(
        "JSON passed to JsonObject.fromJSON should be a Map");
  }
}
