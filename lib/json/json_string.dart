import 'package:flutter_hulk/json/json_type.dart';
import 'package:flutter_hulk/json/json_property_descriptor.dart';

class JsonString extends JsonPropertyDescriptor<String> {
  JsonString({bool isRequired = false})
      : super(fieldType: JsonType.string, isRequired: isRequired);

  @override
  String? toJSON() {
    return value;
  }
}
