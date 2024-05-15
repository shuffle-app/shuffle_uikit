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
  final height = kBottomNavigationBarHeight / 2;
  static const iconSwitchDuration = Duration(milliseconds: 200);

  String _formattedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? '0$min' : '$min';
    String second = sec.toString().length <= 1 ? '0$sec' : '$sec';

    return '$minute:$second';
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return SizedBox(
        height: kBottomNavigationBarHeight,
        width: double.infinity,
        child: ColoredBox(
          color: theme?.colorScheme.primary ?? Colors.black87,
          child: ValueListenableBuilder(
              valueListenable: widget.controller,
              builder: (context, VideoPlayerValue value, child) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
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
                        child: AnimatedSwitcher(
                            duration: iconSwitchDuration,
                            child: value.isPlaying
                                ? ImageWidget(
                                    iconData: ShuffleUiKitIcons.pause,
                                    height: height,
                                    fit: BoxFit.fitHeight,
                                    color: Colors.white,
                                  )
                                : ImageWidget(
                                    iconData: ShuffleUiKitIcons.play,
                                    height: height,
                                    fit: BoxFit.fitHeight,
                                    color: Colors.white,
                                  )),
                      ),
                    ),
                    Text(
                        '${_formattedTime(timeInSecond: value.position.inSeconds)}/${_formattedTime(timeInSecond: value.duration.inSeconds)}',
                        style: theme?.regularTextTheme.body
                            .copyWith(fontSize: 14, color: theme.colorScheme.inversePrimary)),
                    const Spacer(),
                    IconButton(
                      splashRadius: double.minPositive,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (value.volume == 1) {
                          widget.controller.setVolume(0);
                        } else {
                          widget.controller.setVolume(1);
                        }
                      },
                      icon: GradientableWidget(
                        gradient: GradientFoundation.badgeIcon,
                        child: AnimatedSwitcher(
                            duration: iconSwitchDuration,
                            child: value.volume == 1
                                ? ImageWidget(
                                    iconData: ShuffleUiKitIcons.volume,
                                    height: height,
                                    fit: BoxFit.fitHeight,
                                    color: Colors.white,
                                  )
                                : ImageWidget(
                                    iconData: ShuffleUiKitIcons.volumeoff,
                                    height: height,
                                    fit: BoxFit.fitHeight,
                                    color: Colors.white,
                                  )),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
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
                          fit: BoxFit.fitHeight,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ).paddingOnly(
                  left: MediaQuery.paddingOf(context).left,
                  right: MediaQuery.paddingOf(context).right,
                  bottom: widget.isFullScreen ? MediaQuery.paddingOf(context).bottom : 0,
                );
              }),
        ));
  }
}
