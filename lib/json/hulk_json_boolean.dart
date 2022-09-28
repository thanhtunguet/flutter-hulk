import 'package:flutter_hulk/json/hulk_json_type.dart';
import 'package:flutter_hulk/json/hulk_property_descriptor.dart';

class HulkJsonBoolean extends HulkPropertyDescriptor<bool> {
  HulkJsonBoolean({required String fieldName})
      : super(fieldName: fieldName, fieldType: HulkJsonType.boolean);

  @override
  bool? toJSON() {
    return value;
  }
}
