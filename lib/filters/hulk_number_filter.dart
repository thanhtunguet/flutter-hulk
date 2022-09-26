import 'package:flutter_hulk/filters/hulk_filter.dart';

class HulkNumberFilter<T extends num> extends HulkFilter {
  T? greaterEqual;

  T? lessEqual;

  T? greater;

  T? less;

  T? equal;

  T? notEqual;
}
