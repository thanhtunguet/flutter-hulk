import '../json_property_descriptor.dart';

class JsonInteger extends JsonPropertyDescriptor<int> {
  JsonInteger() : super();

  JsonInteger.fromJSON(num json) : super.fromJSON(json) {
    value = json.toInt();
  }
}
