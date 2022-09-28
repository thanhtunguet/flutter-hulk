import 'package:flutter_hulk/filters/hulk_filter.dart';

class HulkIdFilter extends HulkFilter {
  List<int>? inList;

  List<int>? notInList;

  int? equal;

  int? notEqual;

  Map<String, dynamic> toJSON() {
    return {
      "in": inList,
      "notIn": notInList,
      "equal": equal,
      "notEqual": notEqual,
    };
  }
}

