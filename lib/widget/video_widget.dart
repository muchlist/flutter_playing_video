import 'package:flutter/material.dart';
import 'package:playing_video/widget/video_play_widget.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget();
  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late final VideoPlayerController controller;
  late final Future<void> initVideo;

  @override
  void initState() {
    super.initState();
    //pada contoh ini kita menggunakan asset, namun kita bisa saja menggunakan
    //network
    controller = VideoPlayerController.asset("assets/butterfly.mp4");
    controller.setLooping(true);
    initVideo = controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: initVideo,
        builder: (context, snapshot) {
          // jika ConnectionState.done artinya video selesai di load dan siap dimainkan
          if (snapshot.connectionState == ConnectionState.done) {
            return PlayWidget(controller);
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
