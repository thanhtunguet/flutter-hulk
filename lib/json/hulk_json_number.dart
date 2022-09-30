import 'package:flutter_hulk/json/hulk_json_type.dart';
import 'package:flutter_hulk/json/hulk_property_descriptor.dart';

class JsonNumber extends PropertyDescriptor<num> {
  JsonNumber({bool isRequired = false})
      : super(fieldType: JsonType.number, isRequired: isRequired);

  @override
  num? toJSON() {
    return value;
  }
}
