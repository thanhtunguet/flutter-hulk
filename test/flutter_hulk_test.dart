import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'entities/user.dart';
import 'flutter_hulk_test.reflectable.dart';

void main() {
  initializeReflectable();

  Map<String, dynamic> jsonValue = {
    "name": "Test",
    "age": 25,
    "birthday": "1997-11-01T01:59:00+0700",
    "manager": {
      "name": "Test",
      "age": 25,
      "birthday": "1997-11-01T01:59:00+0700",
      "members": []
    }
  };

  test('user deserialization', () {
    User user = User();
    user.fromJSON(jsonValue);
    user.manager.value?.members.add(user);
    expect(
      user.manager.value.runtimeType,
      User,
    );
    expect(
      user.manager.value?.members.value![0],
      user,
    );
  });

  test('user serialization', () {
    User tungpt = User();
    tungpt.name.value = "TungPT";
    tungpt.age.value = 25;
    tungpt.birthday.value = DateTime(1997, 11, 01);

    User thangld = User();
    thangld.name.value = "ThangLD";
    thangld.age.value = 30;
    thangld.birthday.value = DateTime(1991, 05, 10);

    tungpt.manager.value = thangld;
    thangld.members.add(tungpt);

    expect(thangld.members.value![0], tungpt);
    String jsonString = json.encode(thangld.toJSON());
    print(jsonString);
    expect(jsonString,
        '{"name":"ThangLD","age":30,"birthday":"1991-05-10T00:00:00.000","manager":null,"members":[{"name":"TungPT","age":25,"birthday":"1997-11-01T00:00:00.000","manager":{"name":"ThangLD","age":30,"birthday":"1991-05-10T00:00:00.000","manager":null,"members":[{"name":"TungPT","age":25,"birthday":"1997-11-01T00:00:00.000","members":null}]},"members":null}]}');
  });
}
