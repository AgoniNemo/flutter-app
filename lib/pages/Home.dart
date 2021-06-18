import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List dataSource = [];
  int _index = 0;

  void _incrementCounter(BuildContext context) {
    // RenderBox renderBox = context.findRenderObject();
    // var screenSize = renderBox.size;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: AlignmentDirectional.center,//指定未定位或部分定位的子组件的对齐方式
            children: <Widget>[
              Container(
                width: 70,
                height: 70,
                child: Text("Hello World", style:TextStyle(color: Colors.white)),
                color: Colors.blue,
              ),
              Positioned(
                left: 18.0,
                child: Text("I am Jack"),
              ),
              Positioned(
                top: 30.0,
                child: Text("Your friend"),
              ),
            ],
          ),
        ),
    );
  }
}
