// This file has been generated by the reflectable package.
// https://github.com/dart-lang/reflectable.
// @dart = 2.12

import 'dart:core';
import 'flutter_hulk_test.dart' as prefix1;
import 'package:flutter_hulk/hulk_model_field.dart' as prefix2;
import 'package:flutter_hulk/hulk_model_reflector.dart' as prefix0;
import 'package:flutter_hulk/json/hulk_json_date.dart' as prefix5;
import 'package:flutter_hulk/json/hulk_json_integer.dart' as prefix4;
import 'package:flutter_hulk/json/hulk_json_object.dart' as prefix6;
import 'package:flutter_hulk/json/hulk_json_string.dart' as prefix3;

// ignore_for_file: camel_case_types
// ignore_for_file: implementation_imports
// ignore_for_file: prefer_adjacent_string_concatenation
// ignore_for_file: prefer_collection_literals
// ignore_for_file: unnecessary_const

// ignore:unused_import
import 'package:reflectable/mirrors.dart' as m;
// ignore:unused_import
import 'package:reflectable/src/reflectable_builder_based.dart' as r;
// ignore:unused_import
import 'package:reflectable/reflectable.dart' as r show Reflectable;

final _data = <r.Reflectable, r.ReflectorData>{
  const prefix0.ModelReflector(): r.ReflectorData(
      <m.TypeMirror>[
        r.NonGenericClassMirrorImpl(
            r'User',
            r'.User',
            134217735,
            0,
            const prefix0.ModelReflector(),
            const <int>[0, 1, 2, 3, 15],
            const <int>[
              16,
              17,
              18,
              19,
              20,
              21,
              22,
              23,
              24,
              25,
              26,
              27,
              28,
              29,
              30,
              31,
              7,
              8,
              9,
              10,
              11,
              12,
              13,
              14
            ],
            const <int>[],
            -1,
            {},
            {},
            {r'': (bool b) => () => b ? prefix1.User() : null},
            0,
            0,
            const <int>[],
            const <Object>[prefix0.reflector],
            null)
      ],
      <m.DeclarationMirror>[
        r.VariableMirrorImpl(
            r'name',
            134348805,
            0,
            const prefix0.ModelReflector(),
            -1,
            1,
            1,
            const <int>[],
            const <Object>[const prefix2.ModelField("name")]),
        r.VariableMirrorImpl(
            r'age',
            134348805,
            0,
            const prefix0.ModelReflector(),
            -1,
            2,
            2,
            const <int>[],
            const <Object>[const prefix2.ModelField("age")]),
        r.VariableMirrorImpl(
            r'birthday',
            134348805,
            0,
            const prefix0.ModelReflector(),
            -1,
            3,
            3,
            const <int>[],
            const <Object>[const prefix2.ModelField("birthday")]),
        r.VariableMirrorImpl(
            r'manager',
            151126021,
            0,
            const prefix0.ModelReflector(),
            -1,
            4,
            5,
            const <int>[0],
            const <Object>[const prefix2.ModelField("manager")]),
        r.VariableMirrorImpl(r'generalErrors', 151126021, -1,
            const prefix0.ModelReflector(), -1, 6, 7, const <int>[8], const []),
        r.VariableMirrorImpl(r'generalWarnings', 151126021, -1,
            const prefix0.ModelReflector(), -1, 6, 7, const <int>[8], const []),
        r.VariableMirrorImpl(r'generalInformations', 151126021, -1,
            const prefix0.ModelReflector(), -1, 6, 7, const <int>[8], const []),
        r.ImplicitGetterMirrorImpl(const prefix0.ModelReflector(), 0, 7),
        r.ImplicitSetterMirrorImpl(const prefix0.ModelReflector(), 0, 8),
        r.ImplicitGetterMirrorImpl(const prefix0.ModelReflector(), 1, 9),
        r.ImplicitSetterMirrorImpl(const prefix0.ModelReflector(), 1, 10),
        r.ImplicitGetterMirrorImpl(const prefix0.ModelReflector(), 2, 11),
        r.ImplicitSetterMirrorImpl(const prefix0.ModelReflector(), 2, 12),
        r.ImplicitGetterMirrorImpl(const prefix0.ModelReflector(), 3, 13),
        r.ImplicitSetterMirrorImpl(const prefix0.ModelReflector(), 3, 14),
        r.MethodMirrorImpl(r'', 64, 0, -1, 0, 0, const <int>[], const <int>[],
            const prefix0.ModelReflector(), const []),
        r.MethodMirrorImpl(r'==', 2097154, -1, -1, 9, 9, const <int>[],
            const <int>[4], const prefix0.ModelReflector(), const []),
        r.MethodMirrorImpl(
            r'toString',
            2097154,
            -1,
            -1,
            8,
            8,
            const <int>[],
            const <int>[],
            const prefix0.ModelReflector(),
            const <Object>[override]),
        r.MethodMirrorImpl(
            r'noSuchMethod',
            524290,
            -1,
            -1,
            -1,
            -1,
            const <int>[],
            const <int>[5],
            const prefix0.ModelReflector(),
            const []),
        r.MethodMirrorImpl(r'hashCode', 2097155, -1, -1, 10, 10, const <int>[],
            const <int>[], const prefix0.ModelReflector(), const []),
        r.MethodMirrorImpl(
            r'runtimeType',
            2097155,
            -1,
            -1,
            11,
            11,
            const <int>[],
            const <int>[],
            const prefix0.ModelReflector(),
            const []),
        r.MethodMirrorImpl(r'fromJSON', 1310722, -1, -1, -1, -1, const <int>[],
            const <int>[6], const prefix0.ModelReflector(), const []),
        r.MethodMirrorImpl(r'toJSON', 35651586, -1, -1, 12, 13, null,
            const <int>[], const prefix0.ModelReflector(), const []),
        r.ImplicitGetterMirrorImpl(const prefix0.ModelReflector(), 4, 23),
        r.ImplicitSetterMirrorImpl(const prefix0.ModelReflector(), 4, 24),
        r.ImplicitGetterMirrorImpl(const prefix0.ModelReflector(), 5, 25),
        r.ImplicitSetterMirrorImpl(const prefix0.ModelReflector(), 5, 26),
        r.ImplicitGetterMirrorImpl(const prefix0.ModelReflector(), 6, 27),
        r.ImplicitSetterMirrorImpl(const prefix0.ModelReflector(), 6, 28),
        r.MethodMirrorImpl(r'hasError', 2097155, -1, -1, 9, 9, const <int>[],
            const <int>[], const prefix0.ModelReflector(), const []),
        r.MethodMirrorImpl(r'hasWarning', 2097155, -1, -1, 9, 9, const <int>[],
            const <int>[], const prefix0.ModelReflector(), const []),
        r.MethodMirrorImpl(
            r'hasInformation',
            2097155,
            -1,
            -1,
            9,
            9,
            const <int>[],
            const <int>[],
            const prefix0.ModelReflector(),
            const [])
      ],
      <m.ParameterMirror>[
        r.ParameterMirrorImpl(
            r'_name',
            134348902,
            8,
            const prefix0.ModelReflector(),
            -1,
            1,
            1,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_age',
            134348902,
            10,
            const prefix0.ModelReflector(),
            -1,
            2,
            2,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_birthday',
            134348902,
            12,
            const prefix0.ModelReflector(),
            -1,
            3,
            3,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_manager',
            151126118,
            14,
            const prefix0.ModelReflector(),
            -1,
            4,
            5,
            const <int>[0],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'other',
            134348806,
            16,
            const prefix0.ModelReflector(),
            -1,
            14,
            14,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'invocation',
            134348806,
            18,
            const prefix0.ModelReflector(),
            -1,
            15,
            15,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'json',
            151126022,
            21,
            const prefix0.ModelReflector(),
            -1,
            12,
            13,
            null,
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_generalErrors',
            151126118,
            24,
            const prefix0.ModelReflector(),
            -1,
            6,
            7,
            const <int>[8],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_generalWarnings',
            151126118,
            26,
            const prefix0.ModelReflector(),
            -1,
            6,
            7,
            const <int>[8],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_generalInformations',
            151126118,
            28,
            const prefix0.ModelReflector(),
            -1,
            6,
            7,
            const <int>[8],
            const [],
            null,
            null)
      ],
      <Type>[
        prefix1.User,
        prefix3.JsonString,
        prefix4.JsonInteger,
        prefix5.JsonDate,
        const m.TypeValue<prefix6.JsonObject<prefix1.User>>().type,
        prefix6.JsonObject,
        const m.TypeValue<List<String>>().type,
        List,
        String,
        bool,
        int,
        Type,
        const m.TypeValue<Map<String, dynamic>>().type,
        Map,
        Object,
        Invocation
      ],
      1,
      {
        r'==': (dynamic instance) => (x) => instance == x,
        r'toString': (dynamic instance) => instance.toString,
        r'noSuchMethod': (dynamic instance) => instance.noSuchMethod,
        r'hashCode': (dynamic instance) => instance.hashCode,
        r'runtimeType': (dynamic instance) => instance.runtimeType,
        r'fromJSON': (dynamic instance) => instance.fromJSON,
        r'toJSON': (dynamic instance) => instance.toJSON,
        r'generalErrors': (dynamic instance) => instance.generalErrors,
        r'generalWarnings': (dynamic instance) => instance.generalWarnings,
        r'generalInformations': (dynamic instance) =>
            instance.generalInformations,
        r'hasError': (dynamic instance) => instance.hasError,
        r'hasWarning': (dynamic instance) => instance.hasWarning,
        r'hasInformation': (dynamic instance) => instance.hasInformation,
        r'name': (dynamic instance) => instance.name,
        r'age': (dynamic instance) => instance.age,
        r'birthday': (dynamic instance) => instance.birthday,
        r'manager': (dynamic instance) => instance.manager
      },
      {
        r'generalErrors=': (dynamic instance, value) =>
            instance.generalErrors = value,
        r'generalWarnings=': (dynamic instance, value) =>
            instance.generalWarnings = value,
        r'generalInformations=': (dynamic instance, value) =>
            instance.generalInformations = value,
        r'name=': (dynamic instance, value) => instance.name = value,
        r'age=': (dynamic instance, value) => instance.age = value,
        r'birthday=': (dynamic instance, value) => instance.birthday = value,
        r'manager=': (dynamic instance, value) => instance.manager = value
      },
      <m.LibraryMirror>[
        r.LibraryMirrorImpl(
            r'',
            Uri.parse(r'reflectable://0/'),
            const prefix0.ModelReflector(),
            const <int>[],
            {},
            {},
            const [],
            null)
      ],
      [])
};

final _memberSymbolMap = null;

void initializeReflectable() {
  r.data = _data;
  r.memberSymbolMap = _memberSymbolMap;
}