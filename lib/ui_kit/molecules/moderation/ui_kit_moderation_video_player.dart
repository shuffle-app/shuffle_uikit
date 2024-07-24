import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:video_player/video_player.dart';

class UiKitModerationVideoPlayer extends StatefulWidget {
  const UiKitModerationVideoPlayer({super.key, required this.videoUrl});

  final String videoUrl;

  @override
  State<UiKitModerationVideoPlayer> createState() =>
      _UiKitModerationVideoPlayerState();
}

class _UiKitModerationVideoPlayerState
    extends State<UiKitModerationVideoPlayer> {
  late VideoPlayerController _controller;
  Duration duration = Duration.zero;
  Duration currentDuration = Duration.zero;

  _init() async {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    );
    await _controller.initialize();
    await _controller.play();
    duration = _controller.value.duration;
    _controller.addListener(
      () {
        _controller.position.then((value) {
          setState(() {
            currentDuration = value!;
          });
        });
      },
    );
    setState(() {});
  }

  bool isReady() {
    return _controller.value.isInitialized;
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 284,
      height: 464,
      child: isReady()
          ? Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: VideoPlayer(_controller),
              ),
              ValueListenableBuilder(
                builder: (context, value, child) {
                  if (!value.isPlaying && !value.isCompleted) {
                    return Align(
                      alignment: Alignment.center,
                      child: UiKitCardWrapper(
                        borderRadius: BorderRadiusFoundation.max,
                        color: ColorsFoundation.surface.withOpacity(0.3),
                        child: Icon(
                          ShuffleUiKitIcons.playfill,
                          size: 40,
                          color: context
                              .uiKitTheme?.colorScheme.darkNeutral500,
                        ).paddingAll(EdgeInsetsFoundation.all20),
                      ),
                    );
                  } else if (value.isCompleted) {
                    return Align(
                      alignment: Alignment.center,
                      child: UiKitCardWrapper(
                        borderRadius: BorderRadiusFoundation.max,
                        color: ColorsFoundation.surface.withOpacity(0.2),
                        child: Icon(
                          ShuffleUiKitIcons.refresh,
                          size: 40,
                          color: context
                              .uiKitTheme?.colorScheme.darkNeutral500,
                        ).paddingAll(EdgeInsetsFoundation.all20),
                      ),
                    );
                  }
                  return const SizedBox();
                },
                valueListenable: _controller,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Material(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Text(
                        formatDuration(currentDuration),
                        style: context.uiKitTheme?.regularTextTheme.title2,
                      ),
                      Expanded(
                        child: Slider(
                          onChanged: (value) {
                            _controller.seekTo(
                              Duration(
                                  milliseconds:
                                      (value * duration.inMilliseconds)
                                          .toInt()),
                            );
                          },
                          activeColor: context
                              .uiKitTheme?.colorScheme.darkNeutral500,
                          inactiveColor: context
                              .uiKitTheme?.colorScheme.darkNeutral500
                              .withOpacity(0.3),
                          value: getCurrentValue(currentDuration, duration),
                        ),
                      ),
                      Text(
                        formatDuration(duration),
                        style: context.uiKitTheme?.regularTextTheme.title2,
                      ),
                    ],
                  ).paddingSymmetric(
                      horizontal: EdgeInsetsFoundation.horizontal16),
                ),
              )
            ],
          )
          : const LoadingWidget(),
    );
  }
}

double getCurrentValue(Duration currentDuration, Duration duration) {
  if (currentDuration >= duration  ) return 1.0;
  return currentDuration.inMilliseconds / duration.inMilliseconds;
}
