import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';
import './person.dart';


//  为什么这个不创建一个类 ???

Future<String> _loadPersonJson() async {
  // 获取本地json字符串
  return await rootBundle.loadString('data-assets/person.json');
}

//  将json解析为Person对象
Future<Person> decodePerson() async {
  //  获取本地json字符串
  String personJson = await _loadPersonJson();

    // 解析 json 字符串，返回的是 Map<String, dynamic> 类型
  final jsonMap = json.decode(personJson);
  print('jsonMap runType is ${jsonMap.runtimeType}');
  Person person = Person.fromJson(jsonMap);
  print('person first Name is ${person.firstName}, last name is ${person.lastName}, email is ${person.email}');
  return person;
}
