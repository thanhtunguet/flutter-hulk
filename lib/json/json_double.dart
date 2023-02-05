import 'package:flutter_hulk/json/json_type.dart';
import 'package:flutter_hulk/json/property_descriptor.dart';

class JsonDouble extends PropertyDescriptor<double> {
  JsonDouble({bool isRequired = false})
      : super(fieldType: JsonType.double, isRequired: isRequired);

  @override
  double? toJSON() {
    return value;
  }
}
