import 'package:flutter_hulk/json/json_type.dart';
import 'package:flutter_hulk/json/property_descriptor.dart';

class JsonNumber extends PropertyDescriptor<num> {
  JsonNumber({bool isRequired = false})
      : super(fieldType: JsonType.number, isRequired: isRequired);

  @override
  num? toJSON() {
    return value;
  }
}
