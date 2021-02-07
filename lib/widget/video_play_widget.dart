import 'package:flutter/material.dart';
import 'package:playing_video/provider/volume_manager.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class PlayWidget extends StatelessWidget {
  final VideoPlayerController controller;
  const PlayWidget(this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          AspectRatio(
            // aspect rasio sangat penting karena menjamin ukuran widget konsisten
            // dengan aspek rasio dari videonya. (controller.value.aspectRatio)
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          ),

          // Play and pause button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                child: const Text("Play!"),
                onPressed: _play,
              ),
              RaisedButton(
                child: const Text("Pause"),
                onPressed: _pause,
              )
            ],
          ),

          // Slider
          Consumer<VolumeManager>(
            builder: (context, manager, _) {
              return Slider(
                value: manager.volume,
                onChanged: (value) {
                  manager.setVolume(
                    volumeValue: value,
                    controller: controller,
                  );
                },
                min: 0,
                max: 1,
                divisions: 10,
                label: "${manager.volume * 100}%",
              );
            },
          )
        ]);
  }

  void _play() {
    if (!controller.value.isPlaying) {
      controller.play();
    }
  }

  void _pause() {
    if (controller.value.isPlaying) {
      controller.pause();
    }
  }
}
