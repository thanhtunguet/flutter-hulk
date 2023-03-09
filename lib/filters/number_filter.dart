import '../filter.dart';

class NumberFilter<T> extends Filter {
  T? greaterEqual;

  T? lessEqual;

  T? greater;

  T? less;

  T? equal;

  T? notEqual;

  NumberFilter() : super();

  NumberFilter.fromJSON(Map<String, dynamic> json) : super.fromJSON(json) {
    if (json.containsKey("greaterEqual")) {
      greaterEqual = json["greaterEqual"];
    }
    if (json.containsKey("lessEqual")) {
      lessEqual = json["lessEqual"];
    }
    if (json.containsKey("greater")) {
      greater = json["greater"];
    }
    if (json.containsKey("less")) {
      less = json["less"];
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
      "greaterEqual": greaterEqual,
      "lessEqual": lessEqual,
      "greater": greater,
      "less": less,
      "equal": equal,
      "notEqual": notEqual,
    };
  }
}
