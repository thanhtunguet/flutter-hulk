import './data_field.dart';

abstract class Filter extends DataField {
  Filter();

  Filter.fromJSON(Map<String, dynamic> json) : super.fromJSON(json);

  @override
  bool isEmpty() {
    return false;
  }
}
