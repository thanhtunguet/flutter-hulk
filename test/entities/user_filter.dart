import 'package:flutter_hulk/annotations/filter_field.dart';
import 'package:flutter_hulk/flutter_hulk.dart';
import 'package:flutter_hulk/reflection/reflector.dart';

@reflector
class UserFilter extends ModelFilter {
  @FilterField()
  StringFilter name = StringFilter();

  @FilterField()
  NumberFilter age = NumberFilter();

  @FilterField()
  DateFilter birthday = DateFilter();
}
