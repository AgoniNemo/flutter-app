import 'package:flutter/material.dart';
import 'package:flutterapp/components/mine-listView.dart';

class MinePage extends StatefulWidget {
  MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('个人中心'),
      ),
      body: ListViewPage(),
    );
  }
}
