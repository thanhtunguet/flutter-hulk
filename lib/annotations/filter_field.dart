class FilterField {
  final String fieldName;

  final dynamic classType;

  final bool isRequired;

  const FilterField(
    this.fieldName, {
    this.classType,
    this.isRequired = false,
  });
}
