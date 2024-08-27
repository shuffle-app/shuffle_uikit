import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ShortLogInButton extends StatelessWidget {
  const ShortLogInButton({
    super.key,
    this.icon,
    this.link,
    required this.title,
    required this.onTap,
    this.isGradient = false,
  }) : assert(icon != null || link != null);

  final IconData? icon;
  final String? link;
  final String title;
  final VoidCallback onTap;
  final bool isGradient;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme!.surface1,
          borderRadius: BorderRadiusFoundation.max,
        ),
        child: UiKitCardWrapper(
          borderRadius: BorderRadiusFoundation.max,
          color: colorScheme.surface3,
          child: Row(
            children: [
              isGradient
                  ? GradientableWidget(
                      gradient: GradientFoundation.defaultLinearGradient,
                      child: ImageWidget(
                        iconData: icon,
                        link: link,
                        color: Colors.white,
                        height: 20.w,
                        width: 20.w,
                        fit: BoxFit.cover,
                      ),
                    )
                  : ImageWidget(
                      iconData: icon,
                      link: link,
                      height: 20.w,
                      width: 20.w,
                      fit: BoxFit.cover,
                    ),
              Expanded(
                child: Text(
                  title.toUpperCase(),
                  style: theme?.boldTextTheme.caption1Medium,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ).paddingSymmetric(
            horizontal: EdgeInsetsFoundation.horizontal8,
            vertical: EdgeInsetsFoundation.vertical10,
          ),
        ).paddingAll(EdgeInsetsFoundation.all4),
      ),
    );
  }
}
