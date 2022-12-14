import 'package:flutter_hulk/filters/hulk_filter.dart';

class GuidFilter extends Filter {
  List<String>? _inList;

  List<String>? _notInList;

  String? equal;

  String? notEqual;

  GuidFilter({bool isRequired = false}) : super(isRequired: isRequired);

  GuidFilter.fromJSON(Map<String, dynamic> json, {bool isRequired = false})
      : super.fromJSON(json, isRequired: isRequired) {
    if (json.containsKey("in")) {
      _inList = json["in"];
    }
    if (json.containsKey("notIn")) {
      _notInList = json["notIn"];
    }
    if (json.containsKey("equal")) {
      equal = json["equal"];
    }
    if (json.containsKey("notEqual")) {
      notEqual = json["notEqual"];
    }
  }

  @override
  Map<String, dynamic> toJSON() {
    return {
      "in": _inList,
      "notIn": _notInList,
      "equal": equal,
      "notEqual": notEqual,
    };
  }
}
