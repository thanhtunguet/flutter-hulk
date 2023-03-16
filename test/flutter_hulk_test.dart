import 'package:flutter_hulk/model_filter.dart';
import 'package:flutter_test/flutter_test.dart';

import 'entities/user.dart';
import 'entities/user_filter.dart';
import 'flutter_hulk_test.reflectable.dart';

void main() {
  initializeReflectable();

  test('user deserialization', () {
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
    User user = User();
    user.fromJSON(jsonValue);
    expect(
      user.manager.value is User,
      true,
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
  });

  test("user filter", () {
    UserFilter userFilter = UserFilter();
    userFilter.name.equal = "Test";
    userFilter.orderBy = "name";
    userFilter.orderType = FilterOrderType.asc;
  });
}
