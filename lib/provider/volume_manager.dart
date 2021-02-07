import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';

class VolumeManager with ChangeNotifier {
  var _volume = 50.0;
  double get volume => _volume;

  void setVolume(
      {required double volumeValue,
      required VideoPlayerController controller}) {
    _volume = volumeValue;
    controller.setVolume(_volume);

    notifyListeners();
  }
}
