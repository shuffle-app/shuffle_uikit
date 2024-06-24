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

  const UiKitFullScreenPortraitVideoPlayer({
    super.key,
    required this.videoUrl,
    this.coverImageBytes,
    this.onProgressChanged,
    this.coverImageUrl,
    this.onVerticalSwipe,
  });

  @override
  State<UiKitFullScreenPortraitVideoPlayer> createState() => _UiKitFullScreenPortraitVideoPlayerState();
}

class _UiKitFullScreenPortraitVideoPlayerState extends State<UiKitFullScreenPortraitVideoPlayer> {
  VideoPlayerController? _controller;
  bool seeking = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
        ..initialize().then((_) {
          setState(() {});
          _controller!.play();
          _controller!.addListener(_playBackListener);
        });
    });
  }

  void _playBackListener() {
    if (!seeking) {
      widget.onProgressChanged
          ?.call(_controller!.value.position.inMilliseconds / _controller!.value.duration.inMilliseconds);
    }
    if (_controller?.value.position.inMilliseconds == _controller?.value.duration.inMilliseconds) {
      if (!seeking) context.pop();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onHorizontalDragStart: (details) {
          if (_controller!.value.isPlaying) _controller!.pause();
          setState(() => seeking = true);
        },
        onHorizontalDragUpdate: (details) {
          if (seeking) {
            final position = _controller!.value.position.inMilliseconds;
            final duration = _controller!.value.duration.inMilliseconds;
            int seekTo = (position + details.primaryDelta! * duration ~/ 1000);
            if (details.primaryDelta! > 0) {
              seekTo += (seekTo ~/ 16).clamp(0, duration);
            } else {
              seekTo -= (seekTo ~/ 16).abs().clamp(0, duration);
            }
            final progress = (seekTo / duration).clamp(0.0, 1.0);
            widget.onProgressChanged?.call(progress);
            _controller!.seekTo(Duration(milliseconds: seekTo));
          }
        },
        onHorizontalDragEnd: (details) {
          setState(() => seeking = false);
          if (!_controller!.value.isPlaying) _controller!.play();
        },
        onTapDown: (details) {
          if (_controller == null) return;
          _controller!.pause();
        },
        onTapUp: (details) {
          if (_controller == null) return;
          _controller!.play();
        },
        onVerticalDragEnd: widget.onVerticalSwipe,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          switchInCurve: Curves.decelerate,
          child: _controller == null
              ? Stack(
                  fit: StackFit.expand,
                  children: [
                    ImageWidget(
                      link: widget.coverImageUrl,
                      imageBytes: widget.coverImageBytes,
                      fit: BoxFit.cover,
                      width: 1.sw,
                      height: 1.sh,
                    ),
                    Container(color: Colors.black.withOpacity(0.5)),
                    const Center(child: LoadingWidget()),
                  ],
                )
              : VideoPlayer(_controller!),
        ),
      ),
    );
  }
}
