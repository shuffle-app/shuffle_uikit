import 'dart:developer';
import 'dart:io';

import 'package:ffmpeg_kit_flutter_min/ffmpeg_kit.dart';
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

  /// [onBackPressed] is called when back button is pressed
  /// it takes user back to previous screen and does not return anything
  final VoidCallback? onBackPressed;

  /// [outputDirectory] is the directory where the exported video will be saved
  /// it is required to be passed to make sure app has permission to write in the directory
  final String outputDirectory;

  const VideoCutter({
    Key? key,
    required this.videoFile,
    required this.onExportFinished,
    required this.outputDirectory,
    this.onBackPressed,
  }) : super(key: key);

  @override
  State<VideoCutter> createState() => _VideoCutterState();
}

class _VideoCutterState extends State<VideoCutter> {
  VideoEditorController? _videoEditorController;

  final frameThumbnailWidth = 0.0625.sw;

  bool cuttingVideo = false;

  bool get muted => _videoEditorController?.video.value.volume == 0;

  @override
  void dispose() {
    _videoEditorController?.dispose();
    super.dispose();
  }

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
            cropStyle: const CropGridStyle(
              boundariesColor: ColorsFoundation.proUserAvatarBorder,
            ),
            trimStyle: TrimSliderStyle(
              edgesSize: 12.w,
              iconSize: 18.h,
              iconColor: Colors.white,
              positionLineWidth: 4.w,
              lineColor: Colors.red,
              positionLineColor: Colors.white,
              onTrimmingColor: ColorsFoundation.proUserAvatarBorder,
              onTrimmedColor: ColorsFoundation.darkNeutral400,
              onTrimmingStoppedColor: ColorsFoundation.darkNeutral400,
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

  Future<void> exportCroppedVideo() async {
    if (_videoEditorController == null) return;
    setState(() => cuttingVideo = true);
    final config = VideoFFmpegVideoEditorConfig(
      _videoEditorController!,
      outputDirectory: widget.outputDirectory,
      commandBuilder: (controller, videoPath, outputPath) {
        /// return the ffmpeg command to export the video without audio
        if (muted) {
          return '-ss ${_videoEditorController!.startTrim} -i $videoPath -t ${_videoEditorController!.endTrim} -c copy -an -y $outputPath';
        } else {
          return '-ss ${_videoEditorController!.startTrim} -i $videoPath -t ${_videoEditorController!.endTrim} -c copy -y $outputPath';
        }
      },
    );

    final exportResult = await config.getExecuteConfig();
    log('Exporting video: ${exportResult.command}');
    await FFmpegKit.executeAsync(exportResult.command, (success) {
      widget.onExportFinished(exportResult.outputPath);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = theme?.boldTextTheme;
    final colorScheme = theme?.colorScheme;
    if (_videoEditorController == null) return const LoadingWidget();

    if (cuttingVideo) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LoadingWidget(),
          SpacingFoundation.verticalSpace24,
          Text(
            cuttingVideo ? S.current.CuttingVideo : S.current.CompressingVideo,
            style: boldTextTheme?.subHeadline,
            textAlign: TextAlign.center,
          ),
        ],
      );
    }

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              context.smallOutlinedButton(
                data: BaseUiKitButtonData(
                  text: S.current.Back,
                  onPressed: () {
                    widget.onBackPressed?.call();
                    context.pop();
                  },
                  iconInfo: BaseUiKitButtonIconData(
                    iconData: ShuffleUiKitIcons.chevronleft,
                    iconAlignment: Alignment.centerLeft,
                  ),
                ),
              ),
              context.smallButton(
                data: BaseUiKitButtonData(
                  text: S.current.Next,
                  onPressed: exportCroppedVideo,
                  iconInfo: BaseUiKitButtonIconData(
                    iconData: ShuffleUiKitIcons.chevronright,
                  ),
                ),
              ),
            ],
          ),
          SpacingFoundation.verticalSpace16,
          Expanded(
            child: LayoutBuilder(
              builder: (context, size) {
                final timeLineWidth = size.maxWidth * 0.8;

                return SizedBox.fromSize(
                  size: size.biggest,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Center(
                        child: AspectRatio(
                          aspectRatio: _videoEditorController!.video.value.aspectRatio,
                          child: VideoPlayer(_videoEditorController!.video),
                        ),
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
                              AnimatedBuilder(
                                animation: _videoEditorController!.video,
                                builder: (context, child) {
                                  return GestureDetector(
                                    onTap: () => _videoEditorController?.video.setVolume(muted ? 1 : 0),
                                    child: ImageWidget(
                                      iconData: muted ? ShuffleUiKitIcons.volumeoff : ShuffleUiKitIcons.volume,
                                      color: colorScheme?.inverseSurface,
                                      width: 24,
                                      height: 24,
                                    ),
                                  );
                                },
                              ),
                              AnimatedBuilder(
                                animation: _videoEditorController!.video,
                                builder: (context, child) {
                                  return SizedBox(
                                    width: 0.15.sw,
                                    child: Text(
                                      formatDuration(_videoEditorController?.videoPosition),
                                      style: boldTextTheme?.caption2Bold,
                                      textAlign: TextAlign.right,
                                    ),
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
                              SizedBox(
                                width: timeLineWidth,
                                height: size.minHeight - 16,
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
            ),
          ),
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
