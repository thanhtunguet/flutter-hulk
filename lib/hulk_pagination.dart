import 'package:flutter_hulk/hulk_order_type.dart';

abstract class HulkPagination {
  int? skip = 0;

  int? take = 10;

  String? orderBy;

  HulkOrderType? orderType;
}
