import 'package:flutter_hulk/json/hulk_json_type.dart';
import 'package:flutter_hulk/json/hulk_property_descriptor.dart';

class JsonDouble extends PropertyDescriptor<double> {
  JsonDouble({bool isRequired = false})
      : super(fieldType: JsonType.double, isRequired: isRequired);

  @override
  double? toJSON() {
    return value;
  }
}
