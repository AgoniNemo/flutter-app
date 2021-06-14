import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageNames = [
    {'image': 'images/avatar.png', 'tips': 'hello nemos'},
    {'image': 'images/AlbumHeader.png', 'tips': '大图'}
  ];
  int _index = 0;

  void _incrementCounter() {
    setState(() {
      _index = (++_index) % _imageNames.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('首页'),
      ),
      body: Center(
        widthFactor: 300,
        heightFactor: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 128,
              height: 128,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Image.asset(
                  _imageNames[_index]['image'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              _imageNames[_index]['tips'],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
