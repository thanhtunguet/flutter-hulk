<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Package dành cho những coder tay to như Hulk!

## Tính năng nổi bật

- Định nghĩa Model trong app một cách dễ dàng và thuận tiện
- Chuyển đổi Model thành JSON và tối ưu dung lượng payload gửi lên server bằng cách loại bỏ các giá trị null
- Định nghĩa các loại Filter cho các kiểu dữ liệu tương ứng: String, Date, Number
- Thiết lập ứng dụng theo kiến trúc Repository-Service-Screen

## Cài đặt

```shell
flutter pub add flutter_hulk dio sqfentity sqflite reflectable
```

## Sử dụng

### Model

Model là các cấu trúc dữ liệu trong ứng dụng, thường sẽ được map tương ứng với các `Entity` hay `table` trong database
theo tên.
Ví dụ: Product, Customer, Order, ...

Để định nghĩa model, xem ví dụ sau:

```dart
import 'package:flutter_hulk/model.dart';
import 'package:flutter_hulk/model_field.dart';
import 'package:flutter_hulk/reflector.dart';
import 'package:flutter_hulk/json/json_date.dart';
import 'package:flutter_hulk/json/json_list.dart';
import 'package:flutter_hulk/json/json_object.dart';
import 'package:flutter_hulk/json/json_string.dart';

@reflector
class User extends Model {
  @ModelField("username")
  final JsonString username = JsonString();

  @ModelField("email")
  final JsonString email = JsonString();

  @ModelField("birthday")
  final JsonDate birthday = JsonDate();

  @ModelField("manager", classType: User)
  final JsonObject<User> manager = JsonObject<User>();

  @ModelField("children", classType: User)
  final JsonList<User> children = JsonList<User>();
}
```

#### Quy tắc định nghĩa model

- Mỗi model cần kế thừa từ super class Model
- Class model cần được annotate với `@reflector`
- Các field trong model được xếp thành các kiểu dữ liệu tương ứng với JSON: JsonString, JsonNumber, JsonInteger,
  JsonDouble, JsonDate, JsonObject, JsonList
- Các field cần được annotate với `@ModelField("stringFieldName", classType: classTypeForObjectOrList)`

#### Chuyển đổi sang Json

```dart
void main() {
   Map<String, dynamic> json = {
     "username": "test",
     "email": "test@example.com",
   };
   
   User user = User();
   user.fromJSON(json); // Convert json to model
   
   print(user.toString()); // Convert model to json
}
```

#### JsonType

JsonType là các kiểu dữ liệu dành cho các trường của model, tương ứng với các kiểu dữ liệu được json hỗ trợ.
Trong `flutter_hulk` đã có sẵn các kiểu dữ liệu JsonType dưới đây:

1. JsonString
2. JsonNumber
3. JsonInteger
4. JsonDouble
5. JsonDate
6. JsonBoolean

#### Annotations

`flutter_hulk` hỗ trợ các annotation để định nghĩa thông tin các trường trong class Model: ModelField

```dart
class ModelField {
  final String fieldName;

  final dynamic classType;

  final bool isRequired;

  const ModelField(
    this.fieldName, {
    this.classType,
    this.isRequired = false,
  });
}
```

- `fieldName`: tên trường, thường được ánh xạ thống nhất với tên trường trong bảng ở backend
- `classType`: Model class của trường đó, dành cho các trường có kiểu dữ liệu là các model khác hoặc List của các model khác
- `isRequired`: Đánh dấu trường là bắt buộc. Khi chuyển đổi dữ liệu thành JSON hoặc từ JSON, model sẽ kiểm tra dữ liệu của các trường `isRequired`. Nếu một trường được đánh dấu `isRequired` nhưng có giá trị là Null thì sẽ phát sinh lỗi. 

### AdvancedFilter

AdvancedFilter là một cấu trúc dữ liệu dành cho payload của các request dạng filter (get, list, search) được định nghĩa bởi [@leducthang](https://github.com/leducthang).
AdvancedFilter chứa các điều kiện filter dành cho một business model với các kiểu dữ liệu khác nhau, đi kèm với cấu hình phân trang và sắp xếp (pagination).

Cấu trúc phân trang (Pagination) có các thuộc tính sau:

```dart
abstract class Pagination {
   int? skip = 0;

   int? take = 10;

   String? orderBy;

   OrderType? orderType;
   
   /// ... other methods
}
```

Ví dụ: định nghĩa class `UserFilter` dùng để filter cho các API lấy dữ liệu từ bảng `User`:

```dart
import 'package:flutter_hulk/filters/date_filter.dart';
import 'package:flutter_hulk/filters/string_filter.dart';
import 'package:flutter_hulk/model_filter.dart';
import 'package:flutter_hulk/filter_field.dart';
import 'package:flutter_hulk/reflector.dart';

@reflector
class UserFilter extends AdvancedFilter {
  @FilterField("username")
  StringFilter username = StringFilter();

  @FilterField("email")
  StringFilter email = StringFilter();

  @FilterField("birthday")
  DateFilter birthday = DateFilter();
}
```

Trong đó:
- `username`, `email`, `birthday` là các trường filter tương ứng với các trường trong bảng
- `@FilterField` là annotation định nghĩa trường tương tự `@ModelFilter`.
- Các loại filter được hỗ trợ:
  - `StringFilter`: dữ liệu kiểu string: char, varchar, text, ...
  - `DateFilter`: dữ liệu kiểu date, time, datetime, timestamp, ...
  - `NumberFilter<T>`: dữ liệu kiểu số, hỗ trợ `int`, `double`, `num`
  - `IdFilter`: các trường primary key, foreign key dạng số
  - `GuidFilter`: các trường primary key, foreign key dạng unique id

#### Chuyển đổi AdvancedFilter thành JSON và ngược lại

   AdvancedFilter được chuyển đổi thành json và ngược lại tương tự Model.

### Update model reflection

Do Flutter đã disable tính năng Reflection của Dart, nên package này sử dụng reflection được cung cấp bởi `reflectable`.
Vì vậy, khi có thay đổi về model, filter dùng reflection, cần chạy lệnh sau để cập nhật:

```shell
flutter pub run build_runner build DIR
```

### Repository

```dart
const like = 'sample';
```

## Additional information
