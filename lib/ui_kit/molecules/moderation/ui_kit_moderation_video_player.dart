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

  _init() async {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    );
    await _controller.initialize();
    setState(() {});
    await _controller.play();
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
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
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
                            color:
                                context.uiKitTheme?.colorScheme.darkNeutral500,
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
                            color:
                                context.uiKitTheme?.colorScheme.darkNeutral500,
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
              ],
            )
          : const LoadingWidget(),
    );
  }
}
