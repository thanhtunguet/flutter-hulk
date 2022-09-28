import 'package:flutter_hulk/json/hulk_json_type.dart';
import 'package:flutter_hulk/json/hulk_property_descriptor.dart';

class HulkJsonDouble extends HulkPropertyDescriptor<double> {
  HulkJsonDouble({required String fieldName})
      : super(fieldName: fieldName, fieldType: HulkJsonType.double);

  @override
  double? toJSON() {
    return value;
  }
}
