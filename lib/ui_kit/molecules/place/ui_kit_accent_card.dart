import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitAccentCard extends StatelessWidget {
  final String title;
  final String additionalInfo;
  final String accentMessage;
  final ImageWidget image;
  final VoidCallback? onPressed;

  const UiKitAccentCard({
    super.key,
    required this.title,
    required this.additionalInfo,
    required this.accentMessage,
    required this.image,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final textTheme = theme?.boldTextTheme;
    final titleStyle = textTheme?.subHeadline;
    final additionalInfoStyle = textTheme?.caption2Bold.copyWith(
      color: ColorsFoundation.darkNeutral500,
      overflow: TextOverflow.ellipsis,
    );
    final accentMessageStyle = textTheme?.caption1Bold.copyWith(color: ColorsFoundation.darkNeutral100);
    final height = 0.92.sw * 0.57;

    return Container(
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all24,
        boxShadow: const [
          BoxShadow(
            color: ColorsFoundation.shadowPink,
            blurRadius: 18,
            spreadRadius: 0,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          image,
          Positioned(
            top: SpacingFoundation.verticalSpacing16,
            right: SpacingFoundation.horizontalSpacing16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.15),
                borderRadius: BorderRadiusFoundation.all24,
              ),
              child: Text(
                accentMessage,
                style: accentMessageStyle,
              ).paddingSymmetric(
                horizontal: EdgeInsetsFoundation.horizontal12,
                vertical: EdgeInsetsFoundation.vertical8,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery
                  .sizeOf(context)
                  .width,
              height: height / 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.5),
                  ],
                ),
              ),
            ),
          ),
          Material(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadiusFoundation.all24,
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
              borderRadius: BorderRadiusFoundation.all24,
              child: Ink(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadiusFoundation.all24,
                ),
              ),
            ),
          ),
          Positioned(
              bottom: SpacingFoundation.verticalSpacing16,
              left: SpacingFoundation.horizontalSpacing16,
              right: SpacingFoundation.horizontalSpacing16,
              child: IgnorePointer(child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    additionalInfo,
                    style: additionalInfoStyle,
                    maxLines: 1,
                  ),
                  Flexible(
                      child: Text(
                        title,
                        style: titleStyle?.copyWith(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                      )),
                ],
              ),
              )),
        ],
      ),
    );
  }
}
