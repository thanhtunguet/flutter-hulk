import 'package:flutter_hulk/annotations/entity.dart';
import 'package:flutter_hulk/json/json_date.dart';
import 'package:flutter_hulk/json/json_integer.dart';
import 'package:flutter_hulk/json/json_list.dart';
import 'package:flutter_hulk/json/json_object.dart';
import 'package:flutter_hulk/json/json_string.dart';
import 'package:flutter_hulk/model.dart';
import 'package:flutter_hulk/annotations/model_field.dart';
import 'package:flutter_hulk/annotations/model_reflector.dart';

@reflector
@Entity()
class User extends Model {
  @ModelField("name")
  JsonString name = JsonString();

  @ModelField("age")
  JsonInteger age = JsonInteger();

  @ModelField("birthday")
  JsonDate birthday = JsonDate();

  @ModelField("manager")
  JsonObject<User> manager = JsonObject<User>(isRequired: false);

  @ModelField("members")
  JsonList<User> members = JsonList<User>();
}
