import 'package:flutter/material.dart';
import 'App.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       color: Colors.white,
       child: TextButton(onPressed: (){
        //  Navigator.pushAndRemoveUntil(context, newRoute, (route) => false)
       }, child: const Text('login'))
    );
  }
}