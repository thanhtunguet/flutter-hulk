import 'dart:core';

import 'package:flutter_hulk/filters/hulk_filter.dart';

class HulkStringFilter extends HulkFilter {
  String? equal;

  String? notEqual;

  String? startWith;

  String? notStartWith;

  String? endWith;

  String? notEndWith;

  String? contain;

  String? notContain;

  HulkStringFilter();

  HulkStringFilter.fromJSON(Map<String, dynamic> json) {
    if (json.containsKey("equal")) {
      equal = json["equal"];
    }
    if (json.containsKey("notEqual")) {
      notEqual = json["notEqual"];
    }
    if (json.containsKey("startWith")) {
      startWith = json["startWith"];
    }
    if (json.containsKey("notStartWith")) {
      notStartWith = json["notStartWith"];
    }
    if (json.containsKey("endWith")) {
      endWith = json["endWith"];
    }
    if (json.containsKey("contain")) {
      contain = json["contain"];
    }
    if (json.containsKey("notContain")) {
      notEqual = json["notContain"];
    }
  }

  Map<String, dynamic> toJSON() {
    return {
      "equal": equal,
      "notEqual": notEqual,
      "startWith": startWith,
      "notStartWith": notStartWith,
      "contain": contain,
      "notContain": notContain,
      "endWith": endWith,
      "notEndWith": notEndWith,
    };
  }
}
