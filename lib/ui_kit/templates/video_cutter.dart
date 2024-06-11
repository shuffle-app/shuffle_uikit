import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:video_editor/video_editor.dart';
import 'package:video_player/video_player.dart';

class VideoCutter extends StatefulWidget {
  /// making field dynamic to avoid exceptions in web
  /// [File] from dart:io must be passed
  final dynamic videoFile;

  /// [onExportFinished] returns exported video-file path
  final ValueChanged<String> onExportFinished;

  const VideoCutter({
    Key? key,
    required this.videoFile,
    required this.onExportFinished,
  }) : super(key: key);

  @override
  State<VideoCutter> createState() => _VideoCutterState();
}

class _VideoCutterState extends State<VideoCutter> {
  VideoEditorController? _videoEditorController;

  final frameThumbnailWidth = 0.0625.sw;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((time) async {
      log('has videoFile: ${widget.videoFile}');
      if (widget.videoFile != null) {
        log('initializing VideoEditorController');
        try {
          _videoEditorController = VideoEditorController.file(
            widget.videoFile,
            maxDuration: const Duration(seconds: 60),
            trimStyle: TrimSliderStyle(
              onTrimmingColor: ColorsFoundation.proUserAvatarBorder,
            ),
          );
          await _videoEditorController!.initialize();
        } catch (e) {
          log('Error initializing VideoEditorController: $e');
        }
        log('VideoEditorController initialized');
        setState(() {});
      }
    });
  }

  // List<Widget> _buildThumbnails() {
  //   final thumbnails = <Widget>[];
  //   if (_videoEditorController == null) return thumbnails;
  //
  //   final frameCount = _videoEditorController!.frameCount;
  //
  //   for (var i = 0; i < frameCount; i++) {
  //     final frame = _videoEditorController!;
  //     final thumbnail = Image.memory(frame, width: frameThumbnailWidth, height: frameThumbnailWidth * 16 / 9);
  //     thumbnails.add(thumbnail);
  //   }
  //
  //   return thumbnails;
  // }

  Future<void> exportVideo() async {
    if (_videoEditorController == null) return;
    final config = VideoFFmpegVideoEditorConfig(_videoEditorController!);
    final exportResult = await config.getExecuteConfig();
    widget.onExportFinished(exportResult.outputPath);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = theme?.boldTextTheme;
    final colorScheme = theme?.colorScheme;
    if (_videoEditorController == null) return const LoadingWidget();

    return LayoutBuilder(
      builder: (context, size) {
        final timeLineWidth = size.maxWidth * 0.8;

        return SizedBox.fromSize(
          size: size.biggest,
          child: Stack(
            fit: StackFit.expand,
            children: [
              AspectRatio(
                aspectRatio: 9 / 16,
                child: VideoPlayer(_videoEditorController!.video),
              ),
              Positioned(
                top: 0,
                child: Container(
                  width: size.maxWidth,
                  height: size.maxHeight * 0.086,
                  color: colorScheme?.surface.withOpacity(0.3),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Spacer(),
                      ImageWidget(
                        iconData: ShuffleUiKitIcons.volume,
                        color: colorScheme?.inverseSurface,
                        width: 24,
                        height: 24,
                      ),
                      SpacingFoundation.horizontalSpace24,
                      AnimatedBuilder(
                        animation: _videoEditorController!,
                        builder: (context, child) {
                          return Text(
                            formatDuration(_videoEditorController?.trimmedDuration),
                            style: boldTextTheme?.caption2Bold,
                          );
                        },
                      ),
                    ],
                  ).paddingSymmetric(
                    vertical: EdgeInsetsFoundation.vertical8,
                    horizontal: EdgeInsetsFoundation.horizontal16,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: size.maxWidth,
                  height: size.maxHeight * 0.14,
                  color: colorScheme?.surface.withOpacity(0.5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SpacingFoundation.horizontalSpace8,
                      AnimatedBuilder(
                        animation: _videoEditorController!.video,
                        builder: (context, child) {
                          final playing = _videoEditorController?.video.value.isPlaying ?? false;

                          return GestureDetector(
                            onTap: () {
                              if (playing) {
                                _videoEditorController?.video.pause();
                              } else {
                                _videoEditorController?.video.play();
                              }
                            },
                            child: ImageWidget(
                              iconData: playing ? ShuffleUiKitIcons.pausefill : ShuffleUiKitIcons.playfill,
                              color: colorScheme?.inverseSurface,
                              width: 24,
                              height: 24,
                            ),
                          );
                        },
                      ),
                      SpacingFoundation.horizontalSpace8,
                      Container(
                        height: size.minHeight,
                        width: 1,
                        color: ColorsFoundation.neutral48,
                      ),
                      SpacingFoundation.horizontalSpace8,
                      Expanded(
                        child: TrimSlider(
                          controller: _videoEditorController!,
                          hasHaptic: false,
                        ).paddingSymmetric(
                          vertical: EdgeInsetsFoundation.vertical16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
