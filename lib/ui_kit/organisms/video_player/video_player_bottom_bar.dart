import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/organisms/video_player/full_screen_video_player_page.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerBottomBar extends StatefulWidget {
  const VideoPlayerBottomBar({
    super.key,
    required this.controller,
    required this.context,
    required this.isFullScreen,
  });
  final VideoPlayerController controller;
  final BuildContext context;
  final bool isFullScreen;

  @override
  State<VideoPlayerBottomBar> createState() => _VideoPlayerBottomBarState();
}

class _VideoPlayerBottomBarState extends State<VideoPlayerBottomBar> {
  final height = 40.0;

  String _formattedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? '0$min' : '$min';
    String second = sec.toString().length <= 1 ? '0$sec' : '$sec';

    return '$minute:$second';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 26, 26, 26),
      height: widget.isFullScreen ? height + MediaQuery.of(context).padding.bottom : height,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).padding.left,
          right: MediaQuery.of(context).padding.right,
          bottom: widget.isFullScreen ? MediaQuery.of(context).padding.bottom : 0,
        ),
        child: Row(
          children: [
            IconButton(
              splashRadius: double.minPositive,
              onPressed: () {
                setState(
                  () {
                    widget.controller.value.isPlaying ? widget.controller.pause() : widget.controller.play();
                  },
                );
              },
              icon: GradientableWidget(
                gradient: GradientFoundation.badgeIcon,
                child: ValueListenableBuilder(
                  valueListenable: widget.controller,
                  builder: (context, VideoPlayerValue value, child) {
                    return ImageWidget(
                      iconData: value.isPlaying ? ShuffleUiKitIcons.pause : ShuffleUiKitIcons.play,
                      height: height,
                      color: Colors.white,
                    );
                  },
                ),
              ),
            ),
            ValueListenableBuilder(
                valueListenable: widget.controller,
                builder: (context, VideoPlayerValue value, child) {
                  return Text(
                    '${_formattedTime(timeInSecond: value.position.inSeconds)}/${_formattedTime(timeInSecond: widget.controller.value.duration.inSeconds)}',
                    style: context.uiKitTheme?.regularTextTheme.body.copyWith(
                      fontSize: 14,
                    ),
                  );
                }),
            const Spacer(),
            IconButton(
              splashRadius: double.minPositive,
              onPressed: () {
                if (widget.controller.value.volume == 1) {
                  widget.controller.setVolume(0);
                } else {
                  widget.controller.setVolume(1);
                }
              },
              icon: GradientableWidget(
                gradient: GradientFoundation.badgeIcon,
                child: ValueListenableBuilder(
                  valueListenable: widget.controller,
                  builder: (context, VideoPlayerValue value, child) {
                    return ImageWidget(
                      iconData: value.volume == 1 ? ShuffleUiKitIcons.volume : ShuffleUiKitIcons.volumeoff,
                      height: height,
                      color: Colors.white,
                    );
                  },
                ),
              ),
            ),
            IconButton(
              splashRadius: double.minPositive,
              onPressed: () {
                widget.isFullScreen
                    ? Navigator.of(widget.context).pop()
                    : Navigator.of(widget.context, rootNavigator: true).push(
                        MaterialPageRoute(
                          builder: (context) => FullScreenVideoPlayerPage(controller: widget.controller),
                        ),
                      );
              },
              icon: GradientableWidget(
                gradient: GradientFoundation.badgeIcon,
                child: ImageWidget(
                  iconData: widget.isFullScreen ? ShuffleUiKitIcons.minimize : ShuffleUiKitIcons.maximize,
                  height: height,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
