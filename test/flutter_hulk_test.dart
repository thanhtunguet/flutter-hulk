import 'package:flutter_hulk/model.dart';
import 'package:flutter_hulk/model_field.dart';
import 'package:flutter_hulk/model_reflector.dart';
import 'package:flutter_hulk/json/json_date.dart';
import 'package:flutter_hulk/json/json_integer.dart';
import 'package:flutter_hulk/json/json_object.dart';
import 'package:flutter_hulk/json/json_string.dart';
import 'package:flutter_test/flutter_test.dart';

import 'flutter_hulk_test.reflectable.dart';

@reflector
class User extends Model {
  @ModelField("name")
  JsonString name = JsonString();

  @ModelField("age")
  JsonInteger age = JsonInteger();

  @ModelField("birthday")
  JsonDate birthday = JsonDate();

  @ModelField("manager")
  JsonObject<User> manager = JsonObject<User>();
}

void main() {
  initializeReflectable();

  Map<String, dynamic> json = {
    "name": "Test",
    "age": 25,
    "birthday": "1997-11-01T01:59:00+0700",
    "manager": {
      "name": "Test",
      "age": 25,
      "birthday": "1997-11-01T01:59:00+0700"
    }
  };

  User user = User();
  user.fromJSON(json);

  test('adds one to input values', () {
    print(user.manager.value?.toJSON());
    expect(user, user.manager.value);
  });
}
