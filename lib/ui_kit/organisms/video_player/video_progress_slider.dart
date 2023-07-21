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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: bottomPadding,
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              width: width - horizontalPadding * 2,
              height: thickness,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(68, 170, 174, 0.4),
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
            ),
            ValueListenableBuilder(
                valueListenable: controller,
                builder: (context, VideoPlayerValue value, child) {
                  return Container(
                    width: (width - horizontalPadding * 2) *
                                value.position.inSeconds /
                                value.duration.inSeconds >
                            1.w
                        ? (width - horizontalPadding * 2) *
                            value.position.inSeconds /
                            value.duration.inSeconds
                        : 1.w,
                    height: thickness,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
