import 'package:flutter_hulk/filters/hulk_filter.dart';

class DateFilter extends Filter {
  DateTime? greaterEqual;

  DateTime? lessEqual;

  DateTime? greater;

  DateTime? less;

  DateTime? equal;

  DateTime? notEqual;

  DateFilter({bool isRequired = false}) : super(isRequired: isRequired);

  DateFilter.fromJSON(Map<String, dynamic> json, {bool isRequired = false})
      : super.fromJSON(json, isRequired: isRequired) {
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
      notEqual = DateTime.parse(json["notEqual"]);
    }
  }

  @override
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
