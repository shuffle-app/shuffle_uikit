import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitLocationSearchTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final bool isLast;

  const UiKitLocationSearchTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.isLast = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return Material(
      elevation: 0,
      color: Colors.white,
      borderRadius: BorderRadiusFoundation.zero,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsFoundation.darkNeutral500.withOpacity(0.32),
                ),
                child: ImageWidget(
                  svgAsset: GraphicsFoundation.instance.svg.landmark,
                  color: ColorsFoundation.darkNeutral600,
                ).paddingAll(EdgeInsetsFoundation.all4),
              ),
              SpacingFoundation.horizontalSpace8,
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      title,
                      style: textTheme?.caption1Medium.copyWith(color: Colors.black),
                    ),
                    SpacingFoundation.verticalSpace4,
                    Text(
                      subtitle,
                      style: textTheme?.caption2Medium.copyWith(color: ColorsFoundation.darkNeutral600),
                    ),
                    if (!isLast) ...[
                      Divider(
                        height: SpacingFoundation.verticalSpacing16,
                        thickness: 1,
                        color: ColorsFoundation.lightSurface2,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
