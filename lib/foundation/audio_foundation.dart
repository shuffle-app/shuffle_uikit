import 'package:shuffle_uikit/shuffle_uikit.dart';

class AudioFoundation {
  AudioFoundation._();

  static AudioFoundation instance = AudioFoundation._();

  $AssetsAudioGen get audio => Assets.audio;
}
