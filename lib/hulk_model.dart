import 'dart:convert';

import 'package:flutter_hulk/hulk_model_field.dart';
import 'package:flutter_hulk/hulk_model_reflector.dart';
import 'package:flutter_hulk/json/hulk_json_boolean.dart';
import 'package:flutter_hulk/json/hulk_json_date.dart';
import 'package:flutter_hulk/json/hulk_json_double.dart';
import 'package:flutter_hulk/json/hulk_json_integer.dart';
import 'package:flutter_hulk/json/hulk_json_list.dart';
import 'package:flutter_hulk/json/hulk_json_number.dart';
import 'package:flutter_hulk/json/hulk_json_object.dart';
import 'package:flutter_hulk/json/hulk_json_string.dart';
import 'package:flutter_hulk/json/hulk_property_descriptor.dart';
import 'package:reflectable/mirrors.dart';

abstract class Model {
  void _loadFields() {
    InstanceMirror mirror = reflector.reflect(this);
    mirror.type.declarations.forEach((key, value) {
      if (value.metadata.isNotEmpty) {
        var field = value.metadata[0];
        if (field is ModelField) {
          PropertyDescriptor fieldDescriptor =
              mirror.invokeGetter(field.fieldName) as PropertyDescriptor;
          if (fieldDescriptor is JsonString ||
              fieldDescriptor is JsonDate ||
              fieldDescriptor is JsonInteger ||
              fieldDescriptor is JsonNumber ||
              fieldDescriptor is JsonBoolean ||
              fieldDescriptor is JsonDouble) {
            fieldDescriptor.fieldName = field.fieldName;
            fieldDescriptor.isRequired = field.isRequired;
          }
          if (fieldDescriptor is JsonObject) {
            fieldDescriptor.fieldName = field.fieldName;
            fieldDescriptor.classType = field.classType;
            fieldDescriptor.isRequired = field.isRequired;
          }
          if (fieldDescriptor is JsonList) {
            fieldDescriptor.fieldName = field.fieldName;
            fieldDescriptor.classType = field.classType;
            fieldDescriptor.isRequired = field.isRequired;
          }
        }
      }
    });
  }

  Model() {
    _loadFields();
  }

  Model.fromJSON(Map<String, dynamic> json) {
    _loadFields();
    fromJSON(json);
  }

  List<PropertyDescriptor> _getFields() {
    List<PropertyDescriptor> fields = [];
    InstanceMirror mirror = reflector.reflect(this);
    mirror.type.declarations.forEach((key, value) {
      if (value.metadata.isNotEmpty) {
        var field = value.metadata[0];
        if (field is ModelField) {
          DeclarationMirror declarationMirror = value;
          PropertyDescriptor field = mirror
              .invokeGetter(declarationMirror.simpleName) as PropertyDescriptor;
          fields.add(field);
        }
      }
    });
    return fields;
  }

  void fromJSON(Map<String, dynamic> json) {
    var fields = _getFields();
    for (var field in fields) {
      String key = field.fieldName;
      if (json.containsKey(key)) {
        if (field is JsonString ||
            field is JsonInteger ||
            field is JsonNumber ||
            field is JsonBoolean ||
            field is JsonDouble) {
          field.value = json[key];
        }
        if (field is JsonDate) {
          field.value = DateTime.parse(json[key]);
        }
        if (field is JsonObject<Model>) {
          Model model = field.classType();
          model.fromJSON(json[key]);
          field.value = model;
        }
        if (field is JsonList) {
          field.value = (json[key] as List<Map<String, dynamic>>).map((value) {
            Model model = field.classType();
            model.fromJSON(value);
            return model;
          }).toList();
        }
      }
    }
  }

  Map<String, dynamic> _toJSON() {
    Map<String, dynamic> result = {};
    var fields = _getFields();
    for (var field in fields) {
      if (field.value != null) {
        result[field.fieldName] = field.value;
      }
    }
    return result;
  }

  Map<String, dynamic> toJSON() {
    var result = _toJSON();
    var fields = _getFields();
    for (var field in fields) {
      if (field.isRequired) {
        if (field.value == null) {
          print("Field ${field.fieldName} is missing in this model.");
          print(result);
        }
      }
    }
    return result;
  }

  @override
  String toString() {
    return jsonEncode(toJSON());
  }
}
