import 'dart:convert';

import 'package:flutter_hulk/model_field.dart';
import 'package:flutter_hulk/model_reflector.dart';
import 'package:flutter_hulk/json/json_boolean.dart';
import 'package:flutter_hulk/json/json_date.dart';
import 'package:flutter_hulk/json/json_double.dart';
import 'package:flutter_hulk/json/json_integer.dart';
import 'package:flutter_hulk/json/json_list.dart';
import 'package:flutter_hulk/json/json_number.dart';
import 'package:flutter_hulk/json/json_object.dart';
import 'package:flutter_hulk/json/json_string.dart';
import 'package:flutter_hulk/json/property_descriptor.dart';
import 'package:reflectable/mirrors.dart';

abstract class Model {
  List<String> generalErrors = [];

  List<String> generalWarnings = [];

  List<String> generalInformations = [];

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

  List<String> _mapGeneralInfo(List<dynamic> json) {
    return json.map((value) {
      return value.toString();
    }).toList();
  }

  void fromJSON(Map<String, dynamic> json) {
    var fields = _getFields();

    generalErrors = _mapGeneralInfo(json["generalErrors"] ?? []);
    generalWarnings = _mapGeneralInfo(json["generalWarnings"] ?? []);
    generalInformations = _mapGeneralInfo(json["generalInformations"] ?? []);

    Map<String, dynamic> errors = {},
        informations = {},
        disabledFields = {},
        warnings = {};

    if (json["errors"] != null) {
      Map<String, dynamic> errors = json["errors"];
    }
    if (json["warnings"] != null) {
      Map<String, dynamic> warnings = json["warnings"];
    }
    if (json["informations"] != null) {
      Map<String, dynamic> informations = json["informations"];
    }
    if (json["disabled"] != null) {
      Map<String, dynamic> disabledFields = json["disabled"];
    }

    for (var field in fields) {
      String key = field.fieldName;

      if (disabledFields.containsKey(key)) {
        field.isDisabled = true;
      }

      if (errors.containsKey(key)) {
        field.error = errors[key];
      }
      if (warnings.containsKey(key)) {
        field.warning = warnings[key];
      }
      if (informations.containsKey(key)) {
        field.information = informations[key];
      }

      if (json.containsKey(key)) {
        if (field is JsonString ||
            field is JsonInteger ||
            field is JsonNumber ||
            field is JsonBoolean ||
            field is JsonDouble) {
          field.value = json[key];
        }
        if (field is JsonDate) {
          if (json[key] is String) {
            field.value = DateTime.parse(json[key]);
          } else {
            field.value = null;
          }
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

  Map<String, dynamic> convertToJSON({required List<Model> serialized}) {
    Map<String, dynamic> result = {};
    var fields = _getFields();
    for (var field in fields) {
      if (field.isRequired) {
        if (field.value == null) {
          throw Exception("Field ${field.fieldName} is missing in this model.");
          print(result);
        }
      }
      if (field.value is DateTime) {
        result[field.fieldName] = field.value.toIso8601String();
        continue;
      }
      if (field.value is List) {
        result[field.fieldName] = field.value.map((value) {
          return value.toJSON();
        }).toList();
        continue;
      }
      if (field.value is Model) {
        if (serialized.contains(field.value)) {
          continue;
        } else {
          serialized.add(field.value);
        }
        result[field.fieldName] =
            field.value.convertToJSON(serialized: serialized);
        continue;
      }
      if (field.value is String ||
          field.value is int ||
          field.value is double ||
          field.value is bool ||
          field.value == null) {
        result[field.fieldName] = field.value;
      }
    }
    return result;
  }

  Map<String, dynamic> toJSON() {
    return convertToJSON(serialized: []);
  }

  @override
  String toString() {
    return jsonEncode(toJSON());
  }

  bool get hasError {
    return generalErrors.isNotEmpty;
  }

  bool get hasWarning {
    return generalWarnings.isNotEmpty;
  }

  bool get hasInformation {
    return generalInformations.isNotEmpty;
  }
}
