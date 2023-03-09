import '../json_property_descriptor.dart';
import '../model.dart';
import '../reflection/reflector.dart';

class JsonList<T extends Model> extends JsonPropertyDescriptor<List<T>> {
  Type classType = T;

  JsonList() : super();

  JsonList.fromJSON( List<Map<String, dynamic>> json) : super.fromJSON(json) {
    value = json.map((element) {
      T model = ReflectionHelper.newInstance(T);
      model.fromJSON(element);
      return model;
    }).toList();
  }

  void add(T element) {
    value ??= [];
    value!.add(element);
  }

  void remove(T element) {
    value?.remove(element);
  }

  bool contains(T element) {
    if (value == null) {
      return false;
    }
    return value!.contains(element);
  }

  @override
  void fromJSON(json) {
    if (json is List) {
      value = json.map((element) {
        T model = ReflectionHelper.newInstance(T);
        model.fromJSON(element);
        return model;
      }).toList();
    }
  }
}
