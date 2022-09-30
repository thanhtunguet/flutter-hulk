import 'package:flutter_hulk/hulk_order_type.dart';

abstract class Pagination {
  int? skip = 0;

  int? take = 10;

  String? orderBy;

  OrderType? orderType;

  static String? getOrderType(OrderType? orderType) {
    if (orderType == OrderType.asc) {
      return "ASC";
    }
    if (orderType == OrderType.desc) {
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
