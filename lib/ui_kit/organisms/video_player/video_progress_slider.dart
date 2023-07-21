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

  final horizontalPadding = 4.h;
  final thickness = 3.0;
  var wasPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, VideoPlayerValue playerState, child) {
          return SliderTheme(
            data: SliderThemeData(
                thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: thickness,
                  elevation: 0,
                ),
                thumbColor: Colors.white,
                overlayColor: Colors.transparent,
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.white24,
              ),
            child: Slider(
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
    );
  }
}
