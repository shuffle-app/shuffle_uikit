import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitContestUpdateWidget extends UiKitContentUpdateWidget {
  final String text;
  final UiKitReactionPreview contestVideo;

  @override
  final double height;

  const UiKitContestUpdateWidget({
    Key? key,
    required this.text,
    required this.contestVideo,
    required this.height,
    required String title,
  }) : super(key: key, title: title);

  @override
  Widget build(BuildContext context) {
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        contestVideo,
        SpacingFoundation.horizontalSpace8,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GradientableWidget(
                    gradient: GradientFoundation.defaultLinearGradient,
                    child: Text(
                      title!,
                      style: boldTextTheme?.caption3Medium.copyWith(color: Colors.white),
                    ),
                  ),
                  SpacingFoundation.horizontalSpace4,
                  ImageWidget(
                    link: GraphicsFoundation.instance.png.rating.path,
                    height: 0.040625.sw,
                    width: 0.040625.sw,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SpacingFoundation.verticalSpace2,
              Text(
                text,
                style: regularTextTheme?.caption3.copyWith(overflow: TextOverflow.ellipsis),
                maxLines: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
