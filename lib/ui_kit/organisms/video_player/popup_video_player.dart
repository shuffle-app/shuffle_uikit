import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/organisms/video_player/sound_slider.dart';
import 'package:smooth_video_progress/smooth_video_progress.dart';
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
  Color get barrierColor => Colors.black.withOpacity(0.5);

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
    return const Material(
      type: MaterialType.transparency,
      child: Expanded(
        child: PopupVideoPlayer(),
      ),
    );
  }
}

class PopupVideoPlayer extends StatefulWidget {
  const PopupVideoPlayer({super.key});

  @override
  State<PopupVideoPlayer> createState() => _PopupVideoPlayerState();
}

class _PopupVideoPlayerState extends State<PopupVideoPlayer> {
  var _fullScreen = false;
  final _animationDuration = const Duration(milliseconds: 200);
  late final _fullScreenHeight = 500.h;
  final _partScreenHeight = 200.h;
  final _barHeight = 40.h;
  final _partScreenHorizontalPadding = 20.w;

  late VideoPlayerController _controller;

  Duration _currentPosition = Duration.zero;
  late bool _setVolumeMode;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.setLooping(true);
          _controller.play();
        });
      });
    _controller.addListener(() {
      setState(() => _currentPosition = _controller.value.position);
    });
    _setVolumeMode = false;
    _fullScreenHeight = context.size!.height;
  }

  String _formatedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? '0$min' : '$min';
    String second = sec.toString().length <= 1 ? '0$sec' : '$sec';

    return '$minute:$second';
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _animationDuration,
      padding: EdgeInsets.symmetric(
        horizontal: _fullScreen ? 0 : _partScreenHorizontalPadding,
        vertical: _fullScreen ? 0 : 100.h,
      ),
      child: Stack(
        children: [
          AnimatedContainer(
            // color: Colors.green,
            height: _fullScreen ? _fullScreenHeight : _partScreenHeight,
            duration: _animationDuration,
            child: Column(
              children: [
                Stack(
                  children: [
                    AnimatedContainer(
                      duration: _animationDuration,
                      height: _fullScreen
                          ? _fullScreenHeight - _barHeight
                          : _partScreenHeight - _barHeight,
                      color: Colors.black,
                      width: double.infinity,
                      child: _controller.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            )
                          : Container(),
                    ),
                    Positioned(
                      bottom: 1.h,
                      right: 5.h,
                      left: 5.h,
                      child: SizedBox(
                        width: 200.w,
                        child: SmoothVideoProgress(
                          controller: _controller,
                          builder: (context, position, duration, _) =>
                              VideoProgressSlider(
                            position: position,
                            duration: duration,
                            controller: _controller,
                            swatch: Colors.white12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: const Color.fromARGB(255, 26, 26, 26),
                  height: _barHeight,
                  width: double.infinity,
                  child: Row(
                    children: [
                      IconButton(
                        splashRadius: double.minPositive,
                        onPressed: () {
                          setState(
                            () {
                              _controller.value.isPlaying
                                  ? _controller.pause()
                                  : _controller.play();
                            },
                          );
                        },
                        icon: GradientableWidget(
                          gradient: GradientFoundation.badgeIcon,
                          child: ImageWidget(
                            svgAsset: _controller.value.isPlaying
                                ? GraphicsFoundation.instance.svg.pause
                                : GraphicsFoundation.instance.svg.play,
                            height: 80,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        '${_formatedTime(timeInSecond: _currentPosition.inSeconds)}/${_formatedTime(timeInSecond: _controller.value.duration.inSeconds)}',
                        style:
                            context.uiKitTheme?.regularTextTheme.body.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        splashRadius: double.minPositive,
                        onPressed: () {
                          setState(
                            () {
                              _setVolumeMode = !_setVolumeMode;
                            },
                          );
                        },
                        icon: GradientableWidget(
                          gradient: GradientFoundation.badgeIcon,
                          child: ImageWidget(
                            svgAsset: GraphicsFoundation.instance.svg.volume,
                            height: 80,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      if (_setVolumeMode)
                        SoundSlider(
                          controller: _controller,
                        ),
                      IconButton(
                        splashRadius: double.minPositive,
                        onPressed: () {
                          setState(
                            () {
                              _fullScreen = !_fullScreen;
                            },
                          );
                        },
                        icon: GradientableWidget(
                          gradient: GradientFoundation.badgeIcon,
                          child: ImageWidget(
                            svgAsset: _fullScreen
                                ? GraphicsFoundation.instance.svg.minimize
                                : GraphicsFoundation.instance.svg.maximize,
                            height: 80,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10.h,
            right: 10.h,
            child: IconButton(
              splashRadius: double.minPositive,
              icon: ImageWidget(
                svgAsset: GraphicsFoundation.instance.svg.x,
                height: 80,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
