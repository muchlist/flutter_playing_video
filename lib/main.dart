import 'package:flutter/material.dart';
import 'package:playing_video/provider/volume_manager.dart';
import 'package:playing_video/widget/video_widget.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider<VolumeManager>(
      create: (_) => VolumeManager(),
      child: DemoApp(),
    ));

class DemoApp extends StatelessWidget {
  const DemoApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Play a video"),
          ),
          body: const Center(
            child: VideoWidget(),
          )),
    );
  }
}
