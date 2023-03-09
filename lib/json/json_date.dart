import '../json_property_descriptor.dart';

class JsonDate extends JsonPropertyDescriptor<DateTime> {
  JsonDate() : super();

  JsonDate.fromJSON(String json) : super.fromJSON(json) {
    value = DateTime.parse(json);
  }

  @override
  String? toJSON() {
    return value?.toIso8601String();
  }
}
