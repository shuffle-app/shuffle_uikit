import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitVideoReactionsModeration extends StatelessWidget {
  final UiKitFeedbackInfo feedbackInfo;

  const UiKitVideoReactionsModeration({
    super.key,
    required this.feedbackInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: VideoCutter(
            videoFile: null,
            onExportFinished: (exportPath) {},
            outputDirectory: 'output',
          ),
        ),
        Expanded(
          child: feedbackInfo,
        ),
      ],
    );
  }
}
