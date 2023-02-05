import 'package:flutter_hulk/json/json_type.dart';

class PropertyDescriptor<T extends dynamic> {
  String fieldName = "";

  JsonType fieldType;

  bool isRequired = false;

  bool isDisabled = false;

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

  bool get hasError {
    return error != null;
  }

  bool get hasWarning {
    return warning != null;
  }

  bool get hasInformation {
    return information != null;
  }
}
