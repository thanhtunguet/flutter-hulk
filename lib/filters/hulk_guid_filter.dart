import 'package:flutter_hulk/filters/hulk_filter.dart';

class HulkGuidFilter extends HulkFilter {
  List<String>? inList;

  List<String>? notInList;

  String? equal;

  String? notEqual;

  Map<String, dynamic> toJSON() {
    return {
      "in": inList,
      "notIn": notInList,
      "equal": equal,
      "notEqual": notEqual,
    };
  }
}
