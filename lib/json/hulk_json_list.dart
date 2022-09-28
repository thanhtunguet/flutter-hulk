import 'package:flutter_hulk/hulk_model.dart';
import 'package:flutter_hulk/json/hulk_json_type.dart';
import 'package:flutter_hulk/json/hulk_property_descriptor.dart';

class HulkJsonList<T extends HulkModel>
    extends HulkPropertyDescriptor<List<T>> {
  HulkJsonList({required String fieldName})
      : super(fieldName: fieldName, fieldType: HulkJsonType.list);

  HulkJsonList.fromJSON({
    required List<Map<String, dynamic>> json,
    required String fieldName,
  }) : super.fromJSON(
          json: json,
          fieldName: fieldName,
          fieldType: HulkJsonType.list,
        );

  @override
  List<dynamic>? toJSON() {
    return value?.map((e) => e.toJSON()).toList();
  }
}
