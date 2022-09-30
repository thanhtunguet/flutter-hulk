import 'package:flutter_hulk/json/hulk_json_type.dart';
import 'package:flutter_hulk/json/hulk_property_descriptor.dart';

class JsonInteger extends PropertyDescriptor<int> {
  JsonInteger({bool isRequired = false})
      : super(fieldType: JsonType.integer, isRequired: isRequired);

  @override
  int? toJSON() {
    return value;
  }
}
