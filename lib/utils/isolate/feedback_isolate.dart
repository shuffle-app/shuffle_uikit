import 'dart:async';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class FeedbackIsolate {
  static FeedbackIsolate instance = FeedbackIsolate._();

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

  FeedbackIsolate._() {
    _receivePort.listen((event) async {
      if (event is SystemSoundIsolateRachetClick) {
        await _setAsset(asset: rachet);
        await _player.play();
      }
      if (event is FeedbackIsolateRachetClickAndHaptics) {
        await _setAsset(asset: rachet);
        await _player.play();
        await HapticFeedback.mediumImpact();
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

  void addVibrationEvent(SystemVibrationIsolateEvent event) {
    switch (event.runtimeType) {
      case SystemLightVibrationIsolate:
        HapticFeedback.lightImpact();
        break;
      case SystemMediumVibrationIsolate:
        HapticFeedback.mediumImpact();
        break;
      case SystemHeavyVibrationIsolate:
        HapticFeedback.heavyImpact();
        break;
    }
  }

  Future<void> _setAsset({required String asset}) async {
    if (_currentSource != asset) {
      _currentSource = asset;
      await _player.setAsset(asset, package: 'shuffle_uikit');
    }
  }
}

abstract class SystemSoundIsolateEvent {}

class SystemSoundIsolateRachetClick extends SystemSoundIsolateEvent {}

class FeedbackIsolateRachetClickAndHaptics extends SystemSoundIsolateEvent {}

abstract class SystemVibrationIsolateEvent {}

class SystemLightVibrationIsolate extends SystemVibrationIsolateEvent {}

class SystemMediumVibrationIsolate extends SystemVibrationIsolateEvent {}

class SystemHeavyVibrationIsolate extends SystemVibrationIsolateEvent {}
