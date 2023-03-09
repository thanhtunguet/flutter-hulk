import 'package:flutter_hulk/json_serializable.dart';

import 'data_class.dart';

enum ModelFilterOrder {
  asc,
  desc,
}

abstract class ModelFilter extends DataClass {
  int skip = 0;

  int take = 10;

  String? orderBy;

  ModelFilterOrder? orderType;

  @override
  Map<String, dynamic> toJSON({List<JsonSerializable>? serialized}) {
    var result = super.toJSON(serialized: serialized);
    result["skip"] = skip;
    result["take"] = take;
    if (orderBy != null) {
      result["orderBy"] = orderBy;
    }
    if (orderType == ModelFilterOrder.asc) {
      result["orderType"] = "ASC";
    } else if (orderType == ModelFilterOrder.desc) {
      result["orderType"] = "DESC";
    }
    return result;
  }
}
