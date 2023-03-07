import 'package:flutter_hulk/json/json_type.dart';
import 'package:flutter_hulk/json/json_property_descriptor.dart';

class JsonBoolean extends JsonPropertyDescriptor<bool> {
  JsonBoolean({bool isRequired = false})
      : super(fieldType: JsonType.boolean, isRequired: isRequired);

  @override
  bool? toJSON() {
    return value;
  }
}
