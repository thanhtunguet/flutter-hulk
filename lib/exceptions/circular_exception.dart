class CircularException extends FormatException {
  final String tag = "CIRCULAR_EXCEPTION";

  CircularException() : super("CIRCULAR_EXCEPTION") {
    //
  }
}
