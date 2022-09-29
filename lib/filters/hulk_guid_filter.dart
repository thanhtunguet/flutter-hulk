import 'package:flutter_hulk/filters/hulk_filter.dart';

class HulkGuidFilter extends HulkFilter {
  List<String>? _inList;

  List<String>? _notInList;

  String? equal;

  String? notEqual;

  HulkGuidFilter();

  HulkGuidFilter.fromJSON(Map<String, dynamic> json) {
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
