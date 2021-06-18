import 'package:flutter/material.dart';
import 'package:flutterapp/components/ListView.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MinePage extends StatefulWidget {
  MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {

  final List<ListItem> listItems = [
    ListItem(title: '个人中心', iconData: Icons.info, page: ''),
    ListItem(title: '我的收藏', iconData: Icons.collections, page: ''),
    ListItem(title: '我的设置', iconData: Icons.settings, page: ''),
    ListItem(title: '历史记录', iconData: Icons.history, page: '')
  ];

  _onTap(ListItem item) {
    Fluttertoast.showToast(
      msg: '您点击' + item.title + '了',
      gravity: ToastGravity.CENTER,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('个人中心'),
      ),
      body: ListViewPage(items: listItems,onTap: _onTap,),
    );
  }
}
