import 'package:flutter_hulk/model.dart';
import 'package:flutter_hulk/json/json_type.dart';
import 'package:flutter_hulk/json/property_descriptor.dart';

class JsonList<T extends Model> extends PropertyDescriptor<List<T>> {
  dynamic classType;

  JsonList({bool isRequired = false}) : super(fieldType: JsonType.list, isRequired: isRequired);

  JsonList.fromJSON({
    required List<Map<String, dynamic>> json,
    required String fieldName,
    required this.classType,
  }) : super.fromJSON(
          json: json,
          fieldName: fieldName,
          fieldType: JsonType.list,
        );

  @override
  List<dynamic>? toJSON() {
    return value?.map((e) => e.toJSON()).toList();
  }
}
