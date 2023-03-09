import 'dart:convert';

import 'package:flutter_hulk/json_serializable.dart';
import 'package:reflectable/mirrors.dart';

import './annotations/field_decorator.dart';
import './data_field.dart';
import './exceptions/property_required_exception.dart';
import './flutter_hulk.dart';
import './reflection/reflector.dart';

class DataClass with JsonSerializable {
  void loadFields() {
    InstanceMirror instanceMirror = reflector.reflect(this);
    instanceMirror.type.declarations.forEach((key, value) {
      if (value.metadata.isEmpty) {
        return;
      }
      for (var element in value.metadata) {
        if (element is FieldDecorator) {
          DataField dataField = instanceMirror.invokeGetter(key) as DataField;
          dataField.fieldName = key;
        }
      }
    });
  }

  List<DataField> getFields() {
    List<DataField> fields = [];
    InstanceMirror instanceMirror = reflector.reflect(this);
    instanceMirror.type.declarations.forEach((key, value) {
      if (value.metadata.isEmpty) {
        return;
      }
      for (var element in value.metadata) {
        if (element is FieldDecorator) {
          DataField dataField = instanceMirror.invokeGetter(key) as DataField;
          fields.add(dataField);
          continue;
        }
      }
    });
    return fields;
  }

  static DataClass _newInstanceFromJSON(Type type, dynamic json) {
    DataClass dataInstance = ReflectionHelper.newInstance(type);
    dataInstance.fromJSON(json);
    return dataInstance;
  }

  @override
  void fromJSON(dynamic json) {
    var fields = getFields();

    for (var field in fields) {
      String key = field.fieldName;

      if (json.containsKey(key)) {
        if (field is JsonPropertyDescriptor) {
          if (field is JsonDate) {
            if (json[key] is String) {
              field.value = DateTime.parse(json[key]);
            } else {
              field.value = null;
            }
            continue;
          }
          if (field is JsonObject) {
            field.value =
                _newInstanceFromJSON(field.classType, json[field.fieldName])
                    as Model;
            continue;
          }
          if (field is JsonList) {
            Type classType = field.classType;
            dynamic list = json[field.fieldName];
            if (list != null) {
              for (var value in list) {
                field.add(
                  _newInstanceFromJSON(field.classType, json[field.fieldName])
                      as Model,
                );
              }
            }
            continue;
          }
          field.value = json[field.fieldName];
        }
      }
    }
  }

  @override
  dynamic toJSON({List<JsonSerializable>? serialized}) {
    serialized ??= [];
    List<DataField> fields = getFields();
    Map<String, dynamic> result = {};
    for (var field in fields) {
      if (field.isRequired) {
        if (field.isEmpty()) {
          throw PropertyRequiredException(field.fieldName);
        }
      }
      if (field is JsonList) {
        result[field.fieldName] = [];
        field.value?.forEach((element) {
          if (serialized!.contains(element)) {
            return;
          }
          result[field.fieldName].add(element.toJSON(serialized: serialized));
          serialized.add(element);
        });
        continue;
      }
      if (field is JsonObject) {
        if (field.value != null) {
          if (serialized.contains(field.value)) {
            continue;
          }
          serialized.add(field.value!);
        }
        result[field.fieldName] = field.value?.toJSON(serialized: serialized);
        continue;
      }
      result[field.fieldName] = field.toJSON();
    }
    return result;
  }

  DataClass.fromJSON(Map<String, dynamic> json) {
    loadFields();
    fromJSON(json);
  }

  DataClass() {
    loadFields();
  }

  @override
  String toString() {
    return jsonEncode(toJSON());
  }
}
