import 'package:flutter_hulk/filters/hulk_filter.dart';

class HulkDateFilter extends HulkFilter {
  DateTime? greaterEqual;

  DateTime? lessEqual;

  DateTime? greater;

  DateTime? less;

  DateTime? equal;

  DateTime? notEqual;

  HulkDateFilter.fromJSON(Map<String, dynamic> json) {
    if (json.containsKey("greaterEqual")) {
      greaterEqual = DateTime.parse(json["greaterEqual"]);
    }
    if (json.containsKey("lessEqual")) {
      lessEqual = DateTime.parse(json["lessEqual"]);
    }
    if (json.containsKey("greater")) {
      greater = DateTime.parse(json["greater"]);
    }
    if (json.containsKey("less")) {
      less = DateTime.parse(json["less"]);
    }
    if (json.containsKey("equal")) {
      equal = DateTime.parse(json["equal"]);
    }
    if (json.containsKey("notEqual")) {
      equal = DateTime.parse(json["notEqual"]);
    }
  }

  Map<String, dynamic> toJSON() {
    return {
      "greaterEqual": greaterEqual?.toIso8601String(),
      "lessEqual": lessEqual?.toIso8601String(),
      "greater": greater?.toIso8601String(),
      "less": less?.toIso8601String(),
      "equal": equal?.toIso8601String(),
      "notEqual": notEqual?.toIso8601String(),
    };
  }
}
