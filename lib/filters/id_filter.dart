import 'package:flutter_hulk/filters/filter.dart';

class IdFilter extends Filter {
  List<int>? _inList;

  List<int>? _notInList;

  int? equal;

  int? notEqual;

  IdFilter({bool isRequired = false}) : super(isRequired: isRequired);

  IdFilter.fromJSON(Map<String, dynamic> json, {bool isRequired = false})
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
