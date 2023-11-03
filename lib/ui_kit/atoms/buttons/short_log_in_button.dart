import 'package:flutter/widgets.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ShortLogInButton extends StatelessWidget {
  const ShortLogInButton({
    super.key,
    required this.iconPath,
    required this.title,
    required this.onTap,
  });

  final String iconPath;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme!.surface1,
          borderRadius: BorderRadiusFoundation.all24,
        ),
        child: UiKitCardWrapper(
          color: colorScheme.surface3,
          child: Row(
            children: [
              ImageWidget(
                link: iconPath,
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
