import '../json_property_descriptor.dart';
import '../json_serializable.dart';

class JsonDate extends JsonPropertyDescriptor<DateTime> {
  JsonDate() : super();

  JsonDate.fromJSON(String json) : super.fromJSON(json) {
    value = DateTime.parse(json);
  }

  @override
  String? toJSON({List<JsonSerializable>? serialized}) {
    return value?.toIso8601String();
  }
}
