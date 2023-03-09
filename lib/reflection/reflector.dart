import 'package:reflectable/reflectable.dart';

class ModelReflector extends Reflectable {
  const ModelReflector()
      : super(
          invokingCapability,
          typingCapability,
          reflectedTypeCapability,
          uriCapability,
          libraryCapability,
          instanceInvokeCapability,
          staticInvokeCapability,
          typeCapability,
        );
}

const reflector = ModelReflector();

class ReflectionHelper {
  static T newInstance<T>(Type type, {List<dynamic> arguments = const []}) {
    ClassMirror classMirror = reflector.reflectType(type) as ClassMirror;
    return classMirror.newInstance("", arguments) as T;
  }
}
