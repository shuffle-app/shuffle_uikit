// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/organisms/video_player/full_screen_video_player_page.dart';
import 'package:video_player/video_player.dart';

class UiKitVideoPlayerWithContentDetails extends StatefulWidget {
  final String videoUrl;
  final String? contentImageLink;
  final String? contentName;
  final DateTime? datePosted;

  const UiKitVideoPlayerWithContentDetails({
    super.key,
    required this.videoUrl,
    this.contentImageLink,
    this.contentName,
    this.datePosted,
  });

  @override
  State<UiKitVideoPlayerWithContentDetails> createState() => _UiKitVideoPlayerWithContentDetailsState();
}

class _UiKitVideoPlayerWithContentDetailsState extends State<UiKitVideoPlayerWithContentDetails> {
  VideoPlayerController? _controller;

  double get imageWidth => 0.2.sw;

  double get imageHeight => imageWidth * 0.75;

  bool get hasContentData => widget.contentName != null || widget.datePosted != null || widget.contentImageLink != null;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
      await _controller?.initialize();
      setState(() {});
      // VideoProgressSlider
    });
  }

  Future<void> playPause() async {
    if (_controller?.value.isPlaying == true) {
      await _controller?.pause();
    } else {
      await _controller?.play();
    }
  }

  Future<void> muteUnmute() async {
    if (_controller?.value.volume == 0) {
      await _controller?.setVolume(1);
    } else {
      await _controller?.setVolume(0);
    }
  }

  Future<void> stopVideo() async {
    await _controller?.pause();
    await _controller?.seekTo(Duration.zero);
  }

  Future<void> goFullScreen() async {
    if (_controller == null) return;
    await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    unawaited(Navigator.of(context, rootNavigator: true)
        .push(
      MaterialPageRoute(
        builder: (context) => FullScreenVideoPlayerPage(controller: _controller!),
      ),
    )
        .then((value) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }));
  }

  @override
  Widget build(BuildContext context) {
    final colorsScheme = context.uiKitTheme?.colorScheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    if (_controller == null) return const LoadingWidget();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (_controller != null)
          ValueListenableBuilder(
            valueListenable: _controller!,
            builder: (context, value, child) {
              return AspectRatio(
                aspectRatio: _controller?.value.aspectRatio ?? 16 / 9,
                child: SizedBox(
                  child: Stack(
                    children: [
                      VideoPlayer(_controller!),
                      GestureDetector(
                        onTap: stopVideo,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.15),
                              shape: BoxShape.circle,
                            ),
                            child: ImageWidget(
                              link: GraphicsFoundation.instance.svg.cross.path,
                              color: Colors.white,
                            ).paddingAll(EdgeInsetsFoundation.all6),
                          ).paddingSymmetric(
                            vertical: EdgeInsetsFoundation.vertical8,
                            horizontal: EdgeInsetsFoundation.horizontal4,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: VideoProgressIndicator(
                          _controller!,
                          allowScrubbing: true,
                          colors: VideoProgressColors(
                            backgroundColor: ColorsFoundation.neutral40,
                            playedColor: colorsScheme?.inversePrimary ?? Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        SpacingFoundation.verticalSpace16,
        UiKitCardWrapper(
          color: colorsScheme?.surface2,
          borderRadius: BorderRadiusFoundation.zero,
          child: ValueListenableBuilder(
            valueListenable: _controller!,
            builder: (context, value, widget) => Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                  onTap: playPause,
                  child: GradientableWidget(
                    gradient: GradientFoundation.defaultRadialGradient,
                    child: ImageWidget(
                      color: Colors.white,
                      link: value.isPlaying
                          ? GraphicsFoundation.instance.svg.pauseFill.path
                          : GraphicsFoundation.instance.svg.playFill.path,
                    ),
                  ),
                ),
                SpacingFoundation.horizontalSpace4,
                Expanded(
                  child: Text(
                    '${formatDuration(_controller!.value.position)}/${formatDuration(_controller!.value.duration)}',
                    style: regularTextTheme?.caption2,
                  ),
                ),
                SpacingFoundation.horizontalSpace16,
                GestureDetector(
                  onTap: muteUnmute,
                  child: GradientableWidget(
                    gradient: GradientFoundation.defaultRadialGradient,
                    child: ImageWidget(
                      color: Colors.white,
                      link: value.volume == 0
                          ? GraphicsFoundation.instance.svg.volumeOff.path
                          : GraphicsFoundation.instance.svg.volume.path,
                    ),
                  ),
                ),
                SpacingFoundation.horizontalSpace8,
                GestureDetector(
                  onTap: goFullScreen,
                  child: GradientableWidget(
                    gradient: GradientFoundation.defaultRadialGradient,
                    child: ImageWidget(
                      color: Colors.white,
                      link: GraphicsFoundation.instance.svg.maximize.path,
                    ),
                  ),
                ),
              ],
            ),
          ).paddingSymmetric(vertical: EdgeInsetsFoundation.vertical8, horizontal: EdgeInsetsFoundation.horizontal12),
        ),
        if (hasContentData) SpacingFoundation.verticalSpace16,
        if (hasContentData)
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusFoundation.all12,
                child: ImageWidget(
                  link: widget.contentImageLink,
                  width: imageWidth,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
              ),
              SpacingFoundation.horizontalSpace8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.contentName ?? '',
                    style: boldTextTheme?.caption1Bold,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                  ),
                  SpacingFoundation.verticalSpace4,
                  if (widget.datePosted != null)
                    Text(
                      formatDifference(widget.datePosted!),
                      style: boldTextTheme?.caption1Medium.copyWith(color: ColorsFoundation.mutedText),
                      textAlign: TextAlign.left,
                    ),
                ],
              ),
            ],
          ),
      ],
    );
  }

  String formatDuration(Duration duration) {
    final seconds = duration.inSeconds % 60;
    final minutes = duration.inMinutes % 60;
    final hours = duration.inHours;
    if (hours == 0) return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    final secondsStr = seconds < 10 ? '0$seconds' : '$seconds';
    final minutesStr = minutes < 10 ? '0$minutes' : '$minutes';
    final hoursStr = hours < 10 ? '0$hours' : '$hours';

    return '$hoursStr:$minutesStr:$secondsStr';
  }
}
