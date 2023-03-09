class PropertyRequiredException extends FormatException {
  final String fieldName;

  PropertyRequiredException(this.fieldName)
      : super("PROPERTY_REQUIRED_EXCEPTION");
}
