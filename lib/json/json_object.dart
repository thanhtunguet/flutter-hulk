import 'package:flutter_hulk/json/json_type.dart';
import 'package:flutter_hulk/json/property_descriptor.dart';
import 'package:flutter_hulk/model.dart';
import 'package:flutter_hulk/model_reflector.dart';

@reflector
class JsonObject<T extends Model> extends PropertyDescriptor<T> {
  Type classType = T;

  JsonObject({
    bool isRequired = false,
  }) : super(
          fieldType: JsonType.object,
          isRequired: isRequired,
        );

  JsonObject.fromJSON(
    Map<String, dynamic> json, {
    dynamic classType,
    required String fieldName,
  }) : super(
          fieldName: fieldName,
          fieldType: JsonType.object,
        );

  @override
  T? toJSON() {
    return value;
  }
}
