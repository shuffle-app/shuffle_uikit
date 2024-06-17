import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:video_player/video_player.dart';

class UiKitFullScreenPortraitVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final Uint8List? coverImageBytes;
  final String? coverImageUrl;

  const UiKitFullScreenPortraitVideoPlayer({
    Key? key,
    required this.videoUrl,
    this.coverImageBytes,
    this.coverImageUrl,
  }) : super(key: key);

  @override
  State<UiKitFullScreenPortraitVideoPlayer> createState() => _UiKitFullScreenPortraitVideoPlayerState();
}

class _UiKitFullScreenPortraitVideoPlayerState extends State<UiKitFullScreenPortraitVideoPlayer> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
        ..initialize().then((_) {
          setState(() {});
          _controller!.play();
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        switchInCurve: Curves.decelerate,
        child: _controller == null
            ? Stack(
                fit: StackFit.expand,
                children: [
                  ImageWidget(
                    link: widget.coverImageUrl,
                    imageBytes: widget.coverImageBytes,
                    fit: BoxFit.cover,
                    width: 1.sw,
                    height: 1.sh,
                  ),
                  Container(color: Colors.black.withOpacity(0.5)),
                  const Center(child: LoadingWidget()),
                ],
              )
            : VideoPlayer(_controller!),
      ),
    );
  }
}
