import './json_serializable.dart';
import 'data_class.dart';

enum FilterOrderType {
  asc,
  desc,
}

abstract class ModelFilter extends DataClass {
  int skip = 0;

  int take = 10;

  String? orderBy;

  FilterOrderType? orderType;

  @override
  Map<String, dynamic> toJSON({List<JsonSerializable>? serialized}) {
    var result = super.toJSON(serialized: serialized);
    result["skip"] = skip;
    result["take"] = take;
    if (orderBy != null) {
      result["orderBy"] = orderBy;
    }
    if (orderType == FilterOrderType.asc) {
      result["orderType"] = "ASC";
    } else if (orderType == FilterOrderType.desc) {
      result["orderType"] = "DESC";
    }
    return result;
  }
}
