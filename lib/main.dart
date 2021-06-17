import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'pages/App.dart';
import 'common/UserInfo.dart';
import 'pages/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void collectLog(String line){
    //收集日志
}
void reportErrorAndLog(FlutterErrorDetails details){
    //上报错误和日志逻辑
}

FlutterErrorDetails makeDetails(Object obj, StackTrace stack){
    // 构建错误信息
    return new FlutterErrorDetails(exception: obj);
}

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    reportErrorAndLog(details);
  };
  runZoned(
    () => runApp(Main()),
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        collectLog(line); // 收集日志
      },
    ),
    // ignore: deprecated_member_use
    onError: (Object obj, StackTrace stack) {
      var details = makeDetails(obj, stack);
      reportErrorAndLog(details);
    },
  );
}

class Main extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  bool isLogin = false;

  void _getUserInfo() async {
     SharedPreferences prefs = await SharedPreferences.getInstance(); //初始化
      // String temp="my是最棒的！！！";
      // testList.add(temp);
      // prefs.setStringList('testInfo', testList);
      bool login =  prefs.getBool('isLogin')??false;
      setState(() {
        isLogin = login;
      });
      print('===========isLogin');
      print(isLogin);
  }

  @override
    Widget build(BuildContext context) {
    // 获取用户信息
    _getUserInfo();
    return MaterialApp(
      title: 'Flutter app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isLogin ? AppPage():LoginPage(),
    );
  }
}