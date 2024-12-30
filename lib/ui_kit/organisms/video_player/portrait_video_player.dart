import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:video_player/video_player.dart';

class UiKitFullScreenPortraitVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final Uint8List? coverImageBytes;
  final String? coverImageUrl;
  final ValueChanged<double>? onProgressChanged;
  final ValueChanged<DragEndDetails>? onVerticalSwipe;
  final ValueChanged<TapUpDetails>? onTapUp;
  final VoidCallback? onVideoComplete;
  final VoidCallback? onVideoInited;
  final VideoPlayerController? videoPlayer;
  final ValueChanged<VideoPlayerController>? onSetPlayer;

  const UiKitFullScreenPortraitVideoPlayer({
    super.key,
    required this.videoUrl,
    this.coverImageBytes,
    this.onProgressChanged,
    this.coverImageUrl,
    this.onVerticalSwipe,
    this.onTapUp,
    this.onVideoComplete,
    this.onVideoInited,
    this.videoPlayer,
    this.onSetPlayer,
  });

  @override
  State<UiKitFullScreenPortraitVideoPlayer> createState() => _UiKitFullScreenPortraitVideoPlayerState();
}

class _UiKitFullScreenPortraitVideoPlayerState extends State<UiKitFullScreenPortraitVideoPlayer> {
  bool seeking = false;
  double height = 0;
  double width = 0;
  late final ValueKey key;
  late final VideoPlayerController _controller;
  double coverOpacity = 1;
  bool isReady = false;

  @override
  void initState() {
    width = 1.sw;
    height = 1.sw;
    key = ValueKey(widget.videoUrl);
    _controller = (widget.videoPlayer ?? VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl)));
    if (widget.videoPlayer == null) {
      debugPrint('Video player not provided, created a new one and passed to the model');
      widget.onSetPlayer?.call(_controller);
    }
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!_controller.value.isInitialized) {
        debugPrint('Video player not initialized, initializing now');
        await _controller.initialize().onError((error, stackTrace) {
          debugPrint('Error initializing video player: $error, stack trace: $stackTrace');
        });
      }
      _calculateDimensions(_controller.value.aspectRatio);
      await _controller.play().onError((error, stackTrace) {
        debugPrint('Error playing video player: $error, stack trace: $stackTrace');
      });
      setState(() {
        coverOpacity = 0;
      });
      _controller.addListener(_playBackListener);
      if (widget.onVideoInited != null) {
        Future.delayed(const Duration(milliseconds: 200), widget.onVideoInited!);
      }
      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          isReady = true;
        });
      });
    });
  }

  _calculateDimensions(double aspectRatio) {
    if (aspectRatio < 1) {
      setState(() {
        height = height - MediaQuery.of(context).padding.top;
        width = height / aspectRatio;
      });
      debugPrint('Portrait mode height: $height, width: $width');
    }
  }

  void _playBackListener() {
    if (!seeking) {
      widget.onProgressChanged
          ?.call(_controller.value.position.inMilliseconds / _controller.value.duration.inMilliseconds);
    }
    if (_controller.value.position.inMilliseconds == _controller.value.duration.inMilliseconds &&
        _controller.value.duration.inMilliseconds != 0) {
      if (!seeking) {
        if (widget.onVideoComplete == null) {
          context.pop();
        } else {
          widget.onVideoComplete!.call();
        }
      }
    }
  }

  @override
  void dispose() {
    debugPrint('dispose called');
    _controller.removeListener(_playBackListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width,
      width: height,
      child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onHorizontalDragStart: (details) {
            if (_controller.value.isPlaying) _controller.pause();
            setState(() => seeking = true);
          },
          onHorizontalDragUpdate: (details) {
            if (seeking) {
              final position = _controller.value.position.inMilliseconds;
              final duration = _controller.value.duration.inMilliseconds;
              int seekTo = (position + details.primaryDelta! * duration ~/ 1000);
              if (details.primaryDelta! > 0) {
                seekTo += (seekTo ~/ 16).clamp(0, duration);
              } else {
                seekTo -= (seekTo ~/ 16).abs().clamp(0, duration);
              }
              final progress = (seekTo / duration).clamp(0.0, 1.0);
              widget.onProgressChanged?.call(progress);
              _controller.seekTo(Duration(milliseconds: seekTo));
            }
          },
          onHorizontalDragEnd: (details) {
            setState(() => seeking = false);
            if (!_controller.value.isPlaying) _controller.play();
          },
          onTapDown: (details) {
            _controller.pause();
          },
          onTapUp: (details) {
            _controller.play();
            widget.onTapUp?.call(details);
          },
          onVerticalDragEnd: widget.onVerticalSwipe,
          child: Transform.scale(
            scale: _controller.value.aspectRatio > (MediaQuery.sizeOf(context).aspectRatio + 0.18)
                ? 1
                : (width / 1.sw - height / 1.sh),
            child: VideoPlayer(
              _controller,
              key: key,
            ),
          )),
    ).paddingOnly(top: MediaQuery.paddingOf(context).top);
  }
}