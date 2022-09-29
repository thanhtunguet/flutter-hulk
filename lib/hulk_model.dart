import 'package:flutter_hulk/json/hulk_property_descriptor.dart';

abstract class HulkModel {
  Map<String, HulkPropertyDescriptor> fields = {};

  HulkModel();

  HulkModel.fromJSON(Map<String, dynamic> json) {
    throw Exception("fromJSON is not implemented for this model");
  }

  void fromJSON(Map<String, dynamic> json) {
    throw Exception("fromJSON is not implemented for this model");
  }

  Map<String, dynamic> toJSON() {
    return fields.map((key, value) {
      return MapEntry(key, value.toJSON());
    });
  }
}
