import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutterapp/components/VideoCell.dart';
import 'package:flutterapp/utils/log.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List dataSource = [
    VideoModel(title: '', url: 'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4'),
    VideoModel(title: '', url: 'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4'),
    VideoModel(title: '', url: 'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
  ];
  late Size size;

  
  @override
  void initState() {
    super.initState();
    log('=======init');
  }

  void _onTap(VideoModel item) {
    Log.log('home', '$item');
  }

  void _getScreen(BuildContext context) {
    final size = MediaQuery.of(context).size;
    this.size = size;
    log('$size');
  }

  // Widget _builder(VideoModel item) {
  //   return dataSource.map((item) {
  //           return VideoCell(
  //             onTap: _onTap,
  //             width: size.width, 
  //             height: size.height,
  //             item: item,);
  //         }).toList();
  // }

  @override
  Widget build(BuildContext context) {
    _getScreen(context);
    return Scaffold(
      body:ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            // alignment: AlignmentDirectional.center,//指定未定位或部分定位的子组件的对齐方式
            children: <Widget>[
              Container(
                height: size.height,
                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: dataSource.length,
                  itemBuilder:(BuildContext context, int index) {
                    VideoModel item = this.dataSource[index];
                    return VideoCell(onTap: _onTap,item: item);
                },)
              ),
              Positioned(
                bottom: 100,
                child: Row(
                  verticalDirection: VerticalDirection.up,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      color: Colors.brown,
                      child: Image.asset(
                        'images/avatar.png',
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
