import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'App.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

void _onPressed(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', true);
    //跳转并关闭当前页面
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => AppPage()),
      (route) => false,
    );
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       color: Colors.white,
       child: TextButton(onPressed: () => _onPressed(context), child: const Text('login'))
    );
  }
}