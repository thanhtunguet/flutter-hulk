import "dart:core";

import 'package:flutter_hulk/filters/hulk_filter.dart';

class HulkNumberFilter<T extends num> extends HulkFilter {
  T? greaterEqual;

  T? lessEqual;

  T? greater;

  T? less;

  T? equal;

  T? notEqual;

  Map<String, dynamic> toJSON() {
    return {
      "greaterEqual": greaterEqual,
      "lessEqual": lessEqual,
      "greater": greater,
      "less": less,
      "equal": equal,
      "notEqual": notEqual,
    };
  }
}
