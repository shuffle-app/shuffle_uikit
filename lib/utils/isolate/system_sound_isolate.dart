import 'dart:async';
import 'dart:isolate';

import 'package:just_audio/just_audio.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SystemSoundIsolate {
  static SystemSoundIsolate instance = SystemSoundIsolate._();

  final rachet = AudioFoundation.instance.audio.rachetClick;

  late final _isolate = Isolate(
    _receivePort.sendPort,
  );

  late final _player = AudioPlayer()
    ..setAsset(
      _currentSource,
      package: 'shuffle_uikit',
      preload: true,
    );

  final ReceivePort _receivePort = ReceivePort();

  late String _currentSource = rachet;

  SystemSoundIsolate._() {
    _receivePort.listen((event) async {
      if (event is SystemSoundIsolateRachetClick) {
        if (_currentSource != rachet) {
          _currentSource = rachet;
          await _setAsset(asset: rachet);
        }
        await _player.play();
      }
    });
  }

  void dispose() {
    _isolate.kill();
    _player.dispose();
  }

  void addEvent(SystemSoundIsolateEvent event) {
    _player.seek(Duration.zero).then((value) => _player.play());
    _isolate.controlPort.send(event);
  }

  Future<void> _setAsset({required String asset}) async {
    try {
      await _player.setAsset(asset, package: 'shuffle_uikit');
    } catch (e) {
      print(e.toString());
    }
  }
}

abstract class SystemSoundIsolateEvent {}

class SystemSoundIsolateRachetClick extends SystemSoundIsolateEvent {}
