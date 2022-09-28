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
