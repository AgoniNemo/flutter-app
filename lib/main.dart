import 'dart:async';
import 'package:flutter/material.dart';
import 'pages/App.dart';
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

  @override
  void initState() { 
    super.initState();
    // 获取用户信息
    getLogin().then((login) => 
        setState(() {
          this.isLogin = login;
        })
    );
  }

  //读取数据
  Future<bool> getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var login = prefs.getBool("isLogin")??false; //读取counter的值
    return login; //返回
  }

  @override
    Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isLogin ? AppPage():LoginPage(),
    );
  }
}