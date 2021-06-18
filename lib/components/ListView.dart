
import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {

  final List<ListItem> items;
  // @required
  // final VoidCallback onPress;
  @required
  final Function(ListItem) onTap;

  ListViewPage({Key? key, required this.items, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: items.map((item) {
          return ListTile(
            onTap: () => onTap(item),
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
  IconData iconData;
  String page;

  ListItem({required this.title, required this.iconData,required this.page});
}
