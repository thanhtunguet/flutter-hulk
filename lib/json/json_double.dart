import '../json_property_descriptor.dart';

class JsonDouble extends JsonPropertyDescriptor<double> {
  JsonDouble() : super();

  JsonDouble.fromJSON(num json) : super.fromJSON(json) {
    value = json.toDouble();
  }
}
