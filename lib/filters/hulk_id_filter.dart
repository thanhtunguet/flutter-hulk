import 'package:flutter_hulk/filters/hulk_filter.dart';

class HulkIdFilter extends HulkFilter {
  List<String>? _in;

  List<String>? notIn;

  String? equal;

  String? notEqual;
}
