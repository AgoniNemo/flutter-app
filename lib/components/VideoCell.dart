import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutterapp/utils/log.dart';

class VideoCell extends StatefulWidget {

  @required
  final Function(VideoModel) onTap;
  final VideoModel item;

  VideoCell({Key? key,required this.onTap,required this.item}) : super(key: key);

  @override
  _VideoCellState createState() => _VideoCellState();
}

class _VideoCellState extends State<VideoCell> {

  late final Function videoPlayFuture;
  // late Future videoPlayFuture;

  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.item.url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        Log.log('VideoCell', '======= ${widget.item.url}');
        videoPlayerController.play();
        setState(() {});
      });
    // ignore: unnecessary_null_comparison
    // if( videoPlayFuture == null) {
    //   videoPlayFuture = videoPlayerController.initialize() as Function;
    // }
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  Future<void> _videoPlayFuture() async {
    Future<void> page = videoPlayerController.initialize();
    return page;
  }

   ///播放视频
  buildVideoWidget() {
    return FutureBuilder(
      builder: (BuildContext contex, snapshot) {
        Log.log('connectionState', '$snapshot');
        if (snapshot.connectionState == ConnectionState.done) {
          ///点击事件
          return InkWell(
            onTap: () {
              if (videoPlayerController.value.isInitialized) {
                /// 视频已初始化
                if (videoPlayerController.value.isPlaying) {
                  /// 正播放 --- 暂停
                  videoPlayerController.pause();
                } else {
                  ///暂停 ----播放
                  videoPlayerController.play();
                }

                setState(() {});
              } else {
                ///未初始化
                videoPlayerController.initialize().then((_) {
                  videoPlayerController.play();
                  setState(() {});
                });
              }
            },
            ///居中
            child: Center(
              /// AspectRatio 组件用来设定子组件宽高比
              child: AspectRatio(
                ///设置视频的大小 宽高比。长宽比表示为宽高比。例如，16:9宽高比的值为16.0/9.0
                aspectRatio: videoPlayerController.value.aspectRatio,
                ///播放视频的组件
                child: VideoPlayer(videoPlayerController),
              ),
            ),
          );
        } else {
          return Container(
            alignment: Alignment.center,
            ///圆形加载进度
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: 
        ///播放视频
        buildVideoWidget(),
    );
  }
}

class VideoModel {
  String title = '';
  String url;

  VideoModel({required this.title, required this.url});
}