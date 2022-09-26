import 'package:flutter_hulk/hulk_model.dart';
import 'package:flutter_hulk/hulk_pagination.dart';

class HulkAdvancedFilter extends HulkModel with HulkPagination {
  HulkAdvancedFilter({
    int? skip,
    int? take,
  }) {
    this.skip = skip;
    this.take = take;
  }
}
