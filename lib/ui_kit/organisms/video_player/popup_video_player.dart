import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/organisms/video_player/video_player_bottom_bar.dart';
import 'package:video_player/video_player.dart';

import 'video_progress_slider.dart';

class PopUpVideoPlayer extends ModalRoute<void> {
  final String videoUri;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  // Color get barrierColor => Colors.black.withOpacity(0.5);
  Color get barrierColor => Colors.transparent;

  @override
  String get barrierLabel => 'null';

  @override
  bool get maintainState => true;

  PopUpVideoPlayer({required this.videoUri});

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Material(
      type: MaterialType.transparency,
      child: PopupVideoPlayer(
        videoUri: videoUri,
      ),
    );
  }
}

class PopupVideoPlayer extends StatefulWidget {
  const PopupVideoPlayer({super.key, required this.videoUri});

  final String videoUri;

  @override
  State<PopupVideoPlayer> createState() => _PopupVideoPlayerState();
}

class _PopupVideoPlayerState extends State<PopupVideoPlayer> {
  final _partScreenHeight = 200.h;
  final _barHeight = 40.0;

  late final VideoPlayerController _controller;

  @override
  void initState() {
    log('initializing video player with url ${widget.videoUri}',name: 'PopUpVideoPlayer');

    super.initState();
    try {
      _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUri));
      log('controller created successfully', name: 'PopUpVideoPlayer');
      _controller.initialize().onError((error,st){
        log('Failed to initialize video player: $error', name: 'PopUpVideoPlayer');
      }).then((_) async {
        log('controller initialized successfully', name: 'PopUpVideoPlayer');
        await _controller.play();
        setState(() {});
      });
    } catch (error) {
      log('Failed to initialize video player: $error', name: 'PopUpVideoPlayer');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 100.h),
        child: GestureDetector(
          onDoubleTap: () {
            _controller.value.isPlaying ? _controller.pause() : _controller.play();
          },
          child: Stack(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: _partScreenHeight - _barHeight,
                        color: Colors.black,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: _controller.value.isInitialized
                            ?  AspectRatio(
                                  aspectRatio: _controller.value.aspectRatio,
                                  child: VideoPlayer(_controller),

                              )
                            : const SizedBox.shrink(),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 4.w,
                        left: 4.w,
                        child: VideoProgressSlider(
                          controller: _controller,
                          width: 280.w,
                        ),
                      ),
                    ],
                  ),
                  VideoPlayerBottomBar(
                    controller: _controller,
                    context: context,
                    isFullScreen: false,
                  ),
                ],
              ),
              Positioned(
                top: 10.h,
                right: 10.h,
                child: InkWell(
                  radius: double.minPositive,
                  onTap: Navigator.of(context).pop,
                  child: ImageWidget(
                    iconData: ShuffleUiKitIcons.x,
                    height: 15.h,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
