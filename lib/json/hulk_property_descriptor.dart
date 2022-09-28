import 'package:flutter_hulk/json/hulk_json_type.dart';

class HulkPropertyDescriptor<T extends dynamic> {
  String fieldName;

  HulkJsonType fieldType;

  HulkPropertyDescriptor({
    required this.fieldName,
    required this.fieldType,
  });

  HulkPropertyDescriptor.fromJSON({
    required dynamic json,
    required this.fieldName,
    required this.fieldType,
  });

  T? value;

  String? error;

  String? warning;

  String? information;

  dynamic toJSON() {
    return value;
  }
}
