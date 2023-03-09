abstract class DataField {
  String fieldName = "";

  bool isRequired = false;

  DataField();

  DataField.fromJSON(Map<String, dynamic> json);

  dynamic toJSON();

  bool isEmpty();
}
