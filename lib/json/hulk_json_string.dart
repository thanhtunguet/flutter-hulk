import 'package:flutter_hulk/json/hulk_json_type.dart';
import 'package:flutter_hulk/json/hulk_property_descriptor.dart';

class JsonString extends PropertyDescriptor<String> {
  JsonString({bool isRequired = false})
      : super(fieldType: JsonType.string, isRequired: isRequired);

  @override
  String? toJSON() {
    return value;
  }
}
