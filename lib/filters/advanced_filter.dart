import 'dart:convert';

import 'package:flutter_hulk/filters/filter.dart';
import 'package:flutter_hulk/annotations/filter_field.dart';
import 'package:flutter_hulk/annotations/model_reflector.dart';
import 'package:flutter_hulk/utils/pagination.dart';
import 'package:reflectable/mirrors.dart';

abstract class AdvancedFilter with Pagination {
  void _initSkipTake() {
    skip = 0;
    take = 10;
  }

  void _loadFields() {
    InstanceMirror mirror = reflector.reflect(this);
    mirror.type.declarations.forEach((key, value) {
      if (value.metadata.isNotEmpty) {
        var metadata = value.metadata[0];
        if (metadata is FilterField) {
          var field = mirror.invokeGetter(value.simpleName) as Filter;
          field.fieldName = metadata.fieldName;
          field.isRequired = metadata.isRequired;
        }
      }
    });
  }

  List<Filter> _getFields() {
    List<Filter> fields = [];
    InstanceMirror mirror = reflector.reflect(this);
    mirror.type.declarations.forEach((key, value) {
      if (value.metadata.isNotEmpty) {
        var metadata = value.metadata[0];
        if (metadata is FilterField) {
          Filter field = mirror.invokeGetter(value.simpleName) as Filter;
          fields.add(field);
        }
      }
    });
    return fields;
  }

  AdvancedFilter() {
    _loadFields();
    _initSkipTake();
  }

  @override
  Map<String, dynamic> toJSON() {
    Map<String, dynamic> result = {
      "skip": skip,
      "take": take,
      "orderBy": orderBy,
      "orderType": Pagination.getOrderType(orderType),
    };
    var fields = _getFields();
    for (var field in fields) {
      result[field.fieldName] = field.toJSON();
    }
    Map<String, dynamic> endResult = {};
    result.forEach((key, value) {
      if (value is Map) {
        endResult[key] = {};
        value.forEach((subKey, subValue) {
          if (subValue != null) {
            endResult[key][subKey] = subValue;
          }
        });
        if ((endResult[key] as Map).isEmpty) {
          endResult.remove(key);
        }
        return;
      }
      if (value != null) {
        endResult[key] = value;
        return;
      }
    });
    return endResult;
  }

  @override
  String toString() {
    return jsonEncode(toJSON());
  }
}
