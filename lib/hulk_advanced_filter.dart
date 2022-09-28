import 'package:flutter_hulk/hulk_model.dart';
import 'package:flutter_hulk/hulk_pagination.dart';

abstract class HulkAdvancedFilter extends HulkModel with HulkPagination {
  HulkAdvancedFilter.fromJSON(super.json) : super.fromJSON();

  HulkAdvancedFilter() {
    skip = 0;
    take = 10;
  }
}
