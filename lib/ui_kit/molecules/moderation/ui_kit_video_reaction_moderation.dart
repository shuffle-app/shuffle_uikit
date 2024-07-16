import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitVideoReactionsModeration extends StatelessWidget {
  final String videoUrl;
  final UiKitFeedbackInfo feedbackInfo;

  const UiKitVideoReactionsModeration({
    super.key,
    required this.feedbackInfo,
    required this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: UiKitModerationVideoPlayer(
            videoUrl: videoUrl,
          ),
        ),
        SpacingFoundation.horizontalSpace24,
        Expanded(
          child: feedbackInfo,
        ),
      ],
    );
  }
}

//VideoCutter(
//             videoFile: videoFile,
//             onExportFinished: (exportPath) {},
//             outputDirectory: 'output',
//           )
