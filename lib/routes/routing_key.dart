import 'package:flutter/widgets.dart';
import 'package:reflectable/mirrors.dart';

import '../annotations/use_page_route.dart';
import '../reflection/reflector.dart';

String getRoutingKey(Type page) {
  ClassMirror mirror = reflector.reflectType(page) as ClassMirror;
  var routingKey = "";
  for (var element in mirror.metadata) {
    if (element is UsePageRoute) {
      routingKey = element.route;
      break;
    }
  }
  return routingKey;
}

Widget createRoutingWidget(Type page) {
  ClassMirror mirror = reflector.reflectType(page) as ClassMirror;
  return mirror.newInstance("", []) as Widget;
}
