import 'package:reflectable/reflectable.dart';

class ModelReflector extends Reflectable {
  const ModelReflector()
      : super(invokingCapability, typingCapability, reflectedTypeCapability);
}

const reflector = ModelReflector();
