import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoProgressSlider extends StatelessWidget {
  VideoProgressSlider({
    super.key,
    required this.controller,
    required this.width,
  });

  final VideoPlayerController controller;
  final double width;

  final double bottomPadding = 4.h;
  final double horizontalPadding = 4.h;
  final double thickness = 3.h;
  var wasPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: bottomPadding,
        ),
        child: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, VideoPlayerValue playerState, child) {
            return SliderTheme(
              data: const SliderThemeData(
                  thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 0,
                  ),
                  overlayColor: Colors.transparent,
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Colors.white24,
                ),
              child: Slider(
                // thumbColor: Colors.transparent,
                // inactiveColor: Colors.white30,
                // activeColor: Colors.white,
                // secondaryActiveColor: Colors.transparent,
                value: playerState.position.inMilliseconds * 1.0,
                min: 0,
                max: playerState.duration.inMilliseconds * 1.0,
                onChangeStart: (value) {
                  wasPlaying = playerState.isPlaying;
                  controller.pause();
                },
                onChangeEnd: (value) {
                  controller
                      .seekTo(
                    Duration(milliseconds: value.toInt()),
                  )
                      .whenComplete(
                    () {
                      if (wasPlaying) {
                        controller.play();
                      }
                    },
                  );
                },
                onChanged: (double value) {},
              ),
            );
          },
        ),
      ),
    );
  }
}
