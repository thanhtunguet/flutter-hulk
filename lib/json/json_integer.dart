import 'package:flutter_hulk/json/json_type.dart';
import 'package:flutter_hulk/json/json_property_descriptor.dart';

class JsonInteger extends JsonPropertyDescriptor<int> {
  JsonInteger({bool isRequired = false})
      : super(fieldType: JsonType.integer, isRequired: isRequired);

  @override
  int? toJSON() {
    return value;
  }
}
