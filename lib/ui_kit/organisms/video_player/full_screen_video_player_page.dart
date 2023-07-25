import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/ui_kit/organisms/video_player/video_player_bottom_bar.dart';
import 'package:shuffle_uikit/ui_kit/organisms/video_player/video_progress_slider.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoPlayerPage extends StatefulWidget {
  const FullScreenVideoPlayerPage({
    super.key,
    required this.controller,
  });
  final VideoPlayerController controller;

  @override
  State<FullScreenVideoPlayerPage> createState() =>
      _FullScreenVideoPlayerPageState();
}

class _FullScreenVideoPlayerPageState extends State<FullScreenVideoPlayerPage> {
  var _showBar = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showBar = !_showBar;
        });
      },
      onDoubleTap: () {
        setState(() {
          widget.controller.value.isPlaying
              ? widget.controller.pause()
              : widget.controller.play();
        });
      },
      child: Scaffold(
        body: Stack(
          children: [
            widget.controller.value.isInitialized
                ? Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: AspectRatio(
                          aspectRatio: widget.controller.value.aspectRatio,
                          child: VideoPlayer(widget.controller),
                        ),
                      ),
                      Positioned(
                        bottom: _showBar
                            ? MediaQuery.of(context).padding.bottom + 40
                            : MediaQuery.of(context).padding.bottom,
                        right: 4.w,
                        left: 4.w,
                        child: VideoProgressSlider(
                          controller: widget.controller,
                          width: 280.w,
                        ),
                      ),
                    ],
                  )
                : Container(),
            Visibility(
              visible: _showBar,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: VideoPlayerBottomBar(
                  controller: widget.controller,
                  context: context,
                  isFullScreen: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
