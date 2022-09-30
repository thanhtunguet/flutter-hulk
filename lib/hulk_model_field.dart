class ModelField {
  final String fieldName;

  final dynamic classType;

  final bool isRequired;

  const ModelField(
    this.fieldName, {
    this.classType,
    this.isRequired = false,
  });
}
