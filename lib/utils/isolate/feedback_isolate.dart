import 'dart:async';
import 'dart:isolate';

import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:vibration/vibration.dart';

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
    _receivePort.debounceTime(const Duration(milliseconds: 1)).listen((event) async {
      try {
        if (event is SystemSoundIsolateRachetClick) {
          await _setAsset(asset: rachet);
          // await _player.seek(Duration.zero);
          await _player.play();
        }
        if (event is FeedbackIsolateRachetClickAndHaptics) {
          await _setAsset(asset: rachet);
          await _player.play();
          await HapticFeedback.mediumImpact();
        }
        if (event is FeedbackIsolateHaptics) {
          await Vibration.vibrate(
            // duration: 10,
            intensities: event.intensities ?? [100, 100],
            pattern: event.pattern ?? [5, 5],
          );
        }
      } catch (error) {
        print('Feedback isolate error: $error');
      }
    });
  }

  void dispose() {
    _isolate.kill();
    _player.dispose();
  }

  void addEvent(SystemSoundIsolateEvent event) {
    _isolate.controlPort.send(event);
  }

  Future<void> _setAsset({required String asset}) async {
    if (_currentSource != asset) {
      _currentSource = asset;
      await _player.setAsset(asset, package: 'shuffle_uikit', initialPosition: Duration.zero);
    }
  }
}

abstract class SystemSoundIsolateEvent {}

class FeedbackIsolateHaptics extends SystemSoundIsolateEvent {
  FeedbackIsolateHaptics({this.intensities, this.pattern});

  final List<int>? intensities;
  final List<int>? pattern;
}

class SystemSoundIsolateRachetClick extends SystemSoundIsolateEvent {}

class FeedbackIsolateRachetClickAndHaptics extends SystemSoundIsolateEvent {}
