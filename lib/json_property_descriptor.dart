import './data_field.dart';
import './json_serializable.dart';

class JsonPropertyDescriptor<T extends dynamic> extends DataField
    with JsonSerializable {
  bool isDisabled = false;

  T? value;

  String? error;

  String? warning;

  String? information;

  @override
  dynamic toJSON({List<JsonSerializable>? serialized}) {
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

  @override
  JsonPropertyDescriptor.fromJSON(dynamic json) : super.fromJSON(json) {
    value = json;
  }

  @override
  bool isEmpty() {
    return value == null;
  }

  @override
  void fromJSON(json) {
    value = json;
  }
}
