import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitContentUpdatePlaceholder extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final String imagePath;

  const UiKitContentUpdatePlaceholder({
    Key? key,
    required this.height,
    required this.width,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;
    final isLightTheme = context.uiKitTheme?.themeMode == ThemeMode.light;

    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.symmetric(horizontal: EdgeInsetsFoundation.horizontal2),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all8,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusFoundation.all8,
            child: ImageWidget(
              link: imagePath,
              fit: BoxFit.cover,
              color: colorScheme?.surface.withOpacity(0.5),
              colorBlendMode: isLightTheme ? BlendMode.lighten : BlendMode.darken,

              /// -1 to avid overflow
              height: height - 1,
              width: width,
            ),
          ),
          Center(
            child: Text(
              title,
              style: regularTextTheme?.caption4.copyWith(color: colorScheme?.bodyTypography),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
