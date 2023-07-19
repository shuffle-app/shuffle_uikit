import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';


class SoundSlider extends StatelessWidget {
  const SoundSlider({
    super.key,
    required this.controller,
  });

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 100.w,
      child: SliderTheme(
        data: SliderThemeData(
          activeTrackColor: Colors.white70,
          inactiveTrackColor: Colors.white12,
          thumbShape: SliderComponentShape.noThumb,
          overlayColor: Colors.transparent,
        ),
        child: Slider(
          value: controller.value.volume,
          onChanged: (value) =>
              controller.setVolume(value),
        ),
      ),
    );
  }
}
