import '../json_property_descriptor.dart';

class JsonBoolean extends JsonPropertyDescriptor<bool> {
  JsonBoolean() : super();

  JsonBoolean.fromJSON(bool json) : super.fromJSON(json) {
    value = json;
  }
}
