import 'package:flutter_hulk/json/hulk_json_type.dart';
import 'package:flutter_hulk/json/hulk_property_descriptor.dart';

class HulkJsonString extends HulkPropertyDescriptor<String> {
  HulkJsonString({required String fieldName})
      : super(fieldName: fieldName, fieldType: HulkJsonType.string);

  @override
  String? toJSON() {
    return value;
  }
}
