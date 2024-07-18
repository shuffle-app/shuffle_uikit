import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
// import 'package:video_player/video_player.dart';

import 'package:media_kit/media_kit.dart'; // Provides [Player], [Media], [Playlist] etc.
import 'package:media_kit_video/media_kit_video.dart';

class UiKitFullScreenPortraitVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final Uint8List? coverImageBytes;
  final String? coverImageUrl;
  final ValueChanged<double>? onProgressChanged;
  final ValueChanged<DragEndDetails>? onVerticalSwipe;
  final ValueChanged<TapUpDetails>? onTapUp;
  final VoidCallback? onVideoComplete;
  final VoidCallback? onVideoInited;

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
  });

  @override
  State<UiKitFullScreenPortraitVideoPlayer> createState() => _UiKitFullScreenPortraitVideoPlayerState();
}

class _UiKitFullScreenPortraitVideoPlayerState extends State<UiKitFullScreenPortraitVideoPlayer> {
  // VideoPlayerController? _controller;
  bool seeking = false;
  double height = 0;
  double width = 0;
  double coverOpacity = 1;
  bool isReady = false;
  final key = UniqueKey();

  // Create a [Player] to control playback.
  late final player = Player();

  // Create a [VideoController] to handle video output from [Player].
  late final controller = VideoController(player);

  @override
  void initState() {
    width = 1.sw;
    height = 1.sh;
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
    //     ..initialize().then((_) {
    //       _calculateDimensions(_controller!.value.aspectRatio);
    //       setState(() {});
    //       _controller!.play();
    //       _controller!.addListener(_playBackListener);
    //       if (widget.onVideoInited != null) {
    //         Future.delayed(Duration.zero, widget.onVideoInited!);
    //       }
    //     });
    // });
    // Play a [Media] or [Playlist].
    player.open(Media(widget.videoUrl));
    controller.waitUntilFirstFrameRendered.then((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          coverOpacity = 0;
        });
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            isReady = true;
          });
        });
      });
    });
    controller.platform.future.then((value) {
      if (widget.onVideoInited != null) {
        Future.delayed(Duration.zero, widget.onVideoInited!);
      }
      value.player.stream.position.listen((Duration event) {
        if (!seeking && controller.player.platform!.state.duration.inSeconds != 0) {
          widget.onProgressChanged?.call(controller.player.platform!.state.position.inMilliseconds /
              controller.player.platform!.state.duration.inMilliseconds);
        }
      });
      value.player.stream.completed.listen((value) {
        if (!seeking && value) {
          if (widget.onVideoComplete == null) {
            context.pop();
          } else {
            widget.onVideoComplete!.call();
          }
        }
      });
    });
  }

  @override
  void dispose() {
    // _controller?.dispose();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width,
      width: height,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        // onHorizontalDragStart: (details) {
        //   if (controller.player.platform?.state.playing ?? true) controller.player.pause();
        //   setState(() => seeking = true);
        // },
        // onHorizontalDragUpdate: (details) {
        //   if (seeking) {
        //     final position = controller.player.platform?.state.position.inMilliseconds ?? 0;
        //     final duration = controller.player.platform?.state.duration.inMilliseconds ?? 0;
        //     int seekTo = (position + details.primaryDelta! * duration ~/ 1000);
        //     if (details.primaryDelta! > 0) {
        //       seekTo += (seekTo ~/ 16).clamp(0, duration);
        //     } else {
        //       seekTo -= (seekTo ~/ 16).abs().clamp(0, duration);
        //     }
        //     final progress = (seekTo / duration).clamp(0.0, 1.0);
        //     widget.onProgressChanged?.call(progress);
        //     player.seek(Duration(milliseconds: seekTo));
        //   }
        // },
        // onHorizontalDragEnd: (details) {
        //   setState(() => seeking = false);
        //   if (!(controller.player.platform?.state.playing ?? true)) controller.player.play();
        // },
        onTapDown: (details) {
          controller.player.pause();
        },
        onTapUp: (details) {
          controller.player.play();
          widget.onTapUp?.call(details);
        },
        onVerticalDragEnd: widget.onVerticalSwipe,
        child:
            // AnimatedSwitcher(
            //     duration: const Duration(milliseconds: 500),
            //     switchInCurve: Curves.decelerate,
            //     child: !isReady
            //         ?
            Stack(fit: StackFit.expand, children: [
          // :
          Video(
            key: key,
            controller: controller,
            height: height - MediaQuery.of(context).padding.top,
            width: 1.sw,
            wakelock: false,
            pauseUponEnteringBackgroundMode: true,
            resumeUponEnteringForegroundMode: true,
            fit: BoxFit.cover,
            controls: (_) => const SizedBox.shrink(),
            filterQuality: Platform.isIOS ? FilterQuality.high : FilterQuality.low,
          ),
          if (!isReady)
            AnimatedOpacity(
                opacity: coverOpacity,
                duration: const Duration(milliseconds: 200),
                child: ImageWidget(
                  link: widget.coverImageUrl,
                  imageBytes: widget.coverImageBytes,
                  fit: BoxFit.cover,
                  width: 1.sw,
                  height: 1.sh,
                  // ),
                  // Container(color: Colors.black.withOpacity(0.5)),
                  // const Center(child: LoadingWidget()),
                  // ],
                )),
        ]),
      ),
    ).paddingOnly(top: MediaQuery.paddingOf(context).top);
  }
}
