import 'package:flutter_hulk/json/hulk_json_type.dart';
import 'package:flutter_hulk/json/hulk_property_descriptor.dart';

class HulkJsonNumber extends HulkPropertyDescriptor<num> {
  HulkJsonNumber({required String fieldName})
      : super(fieldName: fieldName, fieldType: HulkJsonType.number);

  @override
  num? toJSON() {
    return value;
  }
}
