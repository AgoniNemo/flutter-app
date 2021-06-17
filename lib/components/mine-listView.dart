import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListViewPage extends StatelessWidget {
  ListViewPage({Key? key});

  final List<ListItem> listItems = [
    ListItem(title: '个人中心', iconData: Icons.info, subTitle: '查看您的消息'),
    ListItem(title: '我的收藏', iconData: Icons.collections, subTitle: '搜索历史记录'),
    ListItem(title: '我的设置', iconData: Icons.settings, subTitle: '设置应用参数'),
    ListItem(title: '历史记录', iconData: Icons.history, subTitle: '查看您的账户')
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
      body: ListView(
        children: listItems.map((item) {
          return ListTile(
            onTap: () => _onTap(item),
            title: Text(item.title),
            leading: Icon(item.iconData),
            trailing: Icon(Icons.keyboard_arrow_right),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
          );
        }).toList(),
      ),
    );
  }
}

class ListItem {
  String title;
  String subTitle;
  IconData iconData;

  ListItem(
      {required this.title, required this.iconData, required this.subTitle});
}
