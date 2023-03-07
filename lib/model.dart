import 'dart:convert';

import 'package:flutter_hulk/exceptions/circular_exception.dart';
import 'package:flutter_hulk/json/json_boolean.dart';
import 'package:flutter_hulk/json/json_date.dart';
import 'package:flutter_hulk/json/json_double.dart';
import 'package:flutter_hulk/json/json_integer.dart';
import 'package:flutter_hulk/json/json_list.dart';
import 'package:flutter_hulk/json/json_number.dart';
import 'package:flutter_hulk/json/json_object.dart';
import 'package:flutter_hulk/json/json_string.dart';
import 'package:flutter_hulk/json/json_property_descriptor.dart';
import 'package:flutter_hulk/annotations/model_field.dart';
import 'package:flutter_hulk/annotations/model_reflector.dart';
import 'package:reflectable/mirrors.dart';

class Model {
  List<String> generalErrors = [];

  List<String> generalWarnings = [];

  List<String> generalInformation = [];

  void _loadFields() {
    InstanceMirror mirror = reflector.reflect(this);
    mirror.type.declarations.forEach((key, value) {
      if (value.metadata.isNotEmpty) {
        var field = value.metadata[0];
        if (field is ModelField) {
          JsonPropertyDescriptor fieldDescriptor =
              mirror.invokeGetter(field.fieldName) as JsonPropertyDescriptor;
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
            fieldDescriptor.isRequired = field.isRequired;
          }
          if (fieldDescriptor is JsonList) {
            fieldDescriptor.fieldName = field.fieldName;
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

  List<JsonPropertyDescriptor> _getFields() {
    List<JsonPropertyDescriptor> fields = [];
    InstanceMirror mirror = reflector.reflect(this);
    mirror.type.declarations.forEach((key, value) {
      if (value.metadata.isNotEmpty) {
        var field = value.metadata[0];
        if (field is ModelField) {
          DeclarationMirror declarationMirror = value;
          JsonPropertyDescriptor field = mirror
              .invokeGetter(declarationMirror.simpleName) as JsonPropertyDescriptor;
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
    generalInformation = _mapGeneralInfo(json["generalInformation"] ?? []);

    Map<String, dynamic> errors = {},
        information = {},
        disabledFields = {},
        warnings = {};

    if (json["errors"] != null) {
      errors = json["errors"];
    }
    if (json["warnings"] != null) {
      warnings = json["warnings"];
    }
    if (json["information"] != null) {
      information = json["information"];
    }
    if (json["disabled"] != null) {
      disabledFields = json["disabled"];
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
      if (information.containsKey(key)) {
        field.information = information[key];
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
        if (field is JsonObject) {
          Model model = invokeClass(field.classType);
          model.fromJSON(json[field.fieldName]);
          field.value = model;
        }
        if (field is JsonList) {
          Type classType = field.classType;
          dynamic list = json[field.fieldName];
          if (list != null) {
            for (var value in list) {
              dynamic model = invokeClass(field.classType);
              model.fromJSON(value);
              field.add(model);
            }
          }
        }
      }
    }
  }

  dynamic invokeClass(Type classType) {
    ClassMirror mirror = reflector.reflectType(classType) as ClassMirror;
    return mirror.newInstance("", []) as Model;
  }

  Map<String, dynamic> toJSON({List<Model>? serialized}) {
    if (_hasCircularDependency(serialized: [])) {
      throw CircularException();
    }
    serialized ??= [];
    Map<String, dynamic> result = {};
    var fields = _getFields();
    for (var field in fields) {
      if (field.isRequired) {
        if (field.value == null) {
          throw Exception("Field ${field.fieldName} is missing in this model.");
        }
      }
      if (field.value is DateTime) {
        result[field.fieldName] = field.value.toIso8601String();
        continue;
      }
      if (field.value is List) {
        if (field.value == null) {
          result[field.fieldName] = null;
          continue;
        }
        result[field.fieldName] = [];
        field.value.forEach((value) {
          bool isContained = serialized!.contains(value);
          if (isContained) {
            return;
          }
          dynamic v = value.toJSON(serialized: serialized);
          result[field.fieldName].add(v);
          serialized.add(value);
        });
        continue;
      }
      if (field.value is Model) {
        if (serialized.contains(field.value)) {
          continue;
        } else {
          serialized.add(field.value);
        }
        result[field.fieldName] = field.value.toJSON(serialized: serialized);
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

  bool _hasCircularDependency({List<Model>? serialized}) {
    serialized ??= [];
    List<JsonPropertyDescriptor> fields = _getFields();
    for (var field in fields) {
      if (field is JsonObject) {
        if (field.value != null) {
          if (serialized.contains(field.value)) {
            return true;
          }
          serialized.add(field.value!);
        }
        continue;
      }
      if (field is JsonList) {
        if (field.value != null) {
          for (var child in field.value!) {
            if (serialized.contains(child)) {
              return true;
            }
            if (child._hasCircularDependency(serialized: serialized)) {
              return true;
            }
            serialized.add(child);
          }
        }
      }
      continue;
    }
    return false;
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
    return generalInformation.isNotEmpty;
  }
}
