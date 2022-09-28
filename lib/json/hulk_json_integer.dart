import 'package:flutter_hulk/json/hulk_json_type.dart';
import 'package:flutter_hulk/json/hulk_property_descriptor.dart';

class HulkJsonInteger extends HulkPropertyDescriptor<int> {
  HulkJsonInteger({required String fieldName})
      : super(fieldName: fieldName, fieldType: HulkJsonType.integer);

  @override
  int? toJSON() {
    return value;
  }
}
