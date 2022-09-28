import 'package:flutter_hulk/json/hulk_json_type.dart';
import 'package:flutter_hulk/json/hulk_property_descriptor.dart';

class HulkJsonObject<T> extends HulkPropertyDescriptor<T> {
  HulkJsonObject({required String fieldName})
      : super(fieldName: fieldName, fieldType: HulkJsonType.object);

  @override
  T? toJSON() {
    return value;
  }
}
