import 'package:flutter_hulk/hulk_model.dart';
import 'package:flutter_hulk/json/hulk_json_type.dart';
import 'package:flutter_hulk/json/hulk_property_descriptor.dart';

class JsonObject<T extends Model> extends PropertyDescriptor<T> {
  dynamic classType;

  JsonObject({bool isRequired = false})
      : super(fieldType: JsonType.object, isRequired: isRequired);

  JsonObject.fromJSON(
    Map<String, dynamic> json, {
    required String fieldName,
    required this.classType,
  }) : super(fieldName: fieldName, fieldType: JsonType.object);

  @override
  T? toJSON() {
    return value;
  }
}
