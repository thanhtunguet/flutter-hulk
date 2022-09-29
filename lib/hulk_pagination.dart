import 'package:flutter_hulk/hulk_order_type.dart';

abstract class HulkPagination {
  int? skip = 0;

  int? take = 10;

  String? orderBy;

  HulkOrderType? orderType;

  static String? getOrderType(HulkOrderType? orderType) {
    if (orderType == HulkOrderType.asc) {
      return "ASC";
    }
    if (orderType == HulkOrderType.desc) {
      return "DESC";
    }
    return null;
  }

  Map<String, dynamic> toJSON() {
    return {
      "skip": skip,
      "take": take,
      "orderBy": orderBy,
      "orderType": getOrderType(orderType),
    };
  }
}
