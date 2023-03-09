import '../json_property_descriptor.dart';

class JsonString extends JsonPropertyDescriptor<String> {
  JsonString() : super();

  JsonString.fromJSON(String json) : super.fromJSON(json) {
    value = json;
  }
}
