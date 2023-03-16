import 'data_class.dart';

abstract class Model extends DataClass {
  List<String>? generalErrors = [];

  List<String>? generalWarnings = [];

  List<String>? generalInformation = [];

  Map<String, String>? errors = {};

  Map<String, String>? warnings = {};

  Map<String, String>? information = {};

  bool get hasError {
    return generalErrors?.isNotEmpty ?? false;
  }

  bool get hasWarning {
    return generalWarnings?.isNotEmpty ?? false;
  }

  bool get hasInformation {
    return generalInformation?.isNotEmpty ?? false;
  }

  @override
  void fromJSON(dynamic json) {
    super.fromJSON(json);
    errors = json["errors"];
    warnings = json["warnings"];
    information = json["informations"];
  }
}
