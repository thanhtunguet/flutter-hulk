abstract class Filter {
  String fieldName = "";

  bool isRequired = false;

  Filter({required this.isRequired});

  Filter.fromJSON(Map<String, dynamic> json, {required this.isRequired});

  Map<String, dynamic> toJSON();
}
