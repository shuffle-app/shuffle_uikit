import 'package:shuffle_uikit/shuffle_uikit.dart';

class AudioFoundation {

  static AudioFoundation instance = AudioFoundation._();

  $AssetsAudioGen get audio => Assets.audio;

  AudioFoundation._();
}
