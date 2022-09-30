import 'package:flutter_hulk/json/hulk_json_type.dart';
import 'package:flutter_hulk/json/hulk_property_descriptor.dart';

class JsonBoolean extends PropertyDescriptor<bool> {
  JsonBoolean({bool isRequired = false})
      : super(fieldType: JsonType.boolean, isRequired: isRequired);

  @override
  bool? toJSON() {
    return value;
  }
}
