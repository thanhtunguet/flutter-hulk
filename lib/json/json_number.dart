import '../json_property_descriptor.dart';

class JsonNumber extends JsonPropertyDescriptor<num> {
  JsonNumber() : super();

  JsonNumber.fromJSON(num json) : super.fromJSON(json) {
    value = json;
  }
}
