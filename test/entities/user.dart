import 'package:flutter_hulk/annotations/model_field.dart';
import 'package:flutter_hulk/flutter_hulk.dart';
import 'package:flutter_hulk/reflection/reflector.dart';

@reflector
class User extends Model {
  @ModelField()
  JsonInteger id = JsonInteger();

  @ModelField()
  JsonString name = JsonString();

  @ModelField()
  JsonInteger age = JsonInteger();

  @ModelField()
  JsonDate birthday = JsonDate();

  @ModelField()
  JsonObject<User> manager = JsonObject<User>();

  @ModelField()
  JsonList<User> members = JsonList<User>();
}
