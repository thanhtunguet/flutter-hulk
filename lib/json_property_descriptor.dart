import './data_field.dart';
import './flutter_hulk.dart';

class JsonPropertyDescriptor<T extends dynamic> extends DataField {
  bool isDisabled = false;

  T? value;

  String? error;

  String? warning;

  String? information;

  @override
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

  JsonPropertyDescriptor() : super();

  JsonPropertyDescriptor.fromJSON(dynamic json) : super.fromJSON(json) {
    value = json;
  }

  @override
  bool isEmpty() {
    return value == null;
  }
}
