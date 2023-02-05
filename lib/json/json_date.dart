import 'package:flutter_hulk/json/json_type.dart';
import 'package:flutter_hulk/json/property_descriptor.dart';

class JsonDate extends PropertyDescriptor<DateTime> {
  JsonDate({bool isRequired = false}) : super(fieldType: JsonType.datetime, isRequired: isRequired);

  @override
  String? toJSON() {
    return value?.toIso8601String();
  }
}
