import 'package:flutter_hulk/json/json_type.dart';
import 'package:flutter_hulk/json/json_property_descriptor.dart';

class JsonDouble extends JsonPropertyDescriptor<double> {
  JsonDouble({bool isRequired = false})
      : super(fieldType: JsonType.double, isRequired: isRequired);

  @override
  double? toJSON() {
    return value;
  }
}
