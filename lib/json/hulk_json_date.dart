import 'package:flutter_hulk/json/hulk_json_type.dart';
import 'package:flutter_hulk/json/hulk_property_descriptor.dart';

class HulkJsonDate extends HulkPropertyDescriptor<DateTime> {
  HulkJsonDate({required String fieldName})
      : super(fieldName: fieldName, fieldType: HulkJsonType.datetime);

  @override
  String? toJSON() {
    return value?.toIso8601String();
  }
}
