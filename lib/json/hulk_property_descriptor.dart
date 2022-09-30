import 'package:flutter_hulk/json/hulk_json_type.dart';

class PropertyDescriptor<T extends dynamic> {
  String fieldName = "";

  JsonType fieldType;

  bool isRequired = false;

  PropertyDescriptor({
    String? fieldName,
    required this.fieldType,
    this.isRequired = false,
  }) {
    if (fieldName != null) {
      this.fieldName = fieldName;
    }
  }

  PropertyDescriptor.fromJSON({
    required dynamic json,
    required this.fieldName,
    required this.fieldType,
    this.isRequired = false,
  });

  T? value;

  String? error;

  String? warning;

  String? information;

  dynamic toJSON() {
    return value;
  }
}
