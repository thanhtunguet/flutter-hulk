import 'package:flutter_hulk/filters/hulk_filter.dart';

class HulkIdFilter extends HulkFilter {
  List<int>? _inList;

  List<int>? _notInList;

  int? equal;

  int? notEqual;

  HulkIdFilter();

  HulkIdFilter.fromJSON(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJSON() {
    return {
      "in": _inList,
      "notIn": _notInList,
      "equal": equal,
      "notEqual": notEqual,
    };
  }
}

