import 'package:flutter_hulk/hulk_model.dart';
import 'package:flutter_hulk/hulk_pagination.dart';

abstract class HulkAdvancedFilter extends HulkModel with HulkPagination {
  _initSkipTake() {
    skip = 0;
    take = 10;
  }

  HulkAdvancedFilter.fromJSON(super.json) : super.fromJSON() {
    _initSkipTake();
  }

  HulkAdvancedFilter() {
    _initSkipTake();
  }

  @override
  Map<String, dynamic> toJSON() {
    return {
      "skip": skip,
      "take": take,
      "orderBy": orderBy,
      "orderType": HulkPagination.getOrderType(orderType),
    };
  }
}
