import 'package:flutter/material.dart';
import 'package:flutter_html_iframe/shims/dart_ui_real.dart';
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

              /// -1 to avid overflow
              height: height - 1,
              width: width,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
            child: ClipRRect(
              borderRadius: BorderRadiusFoundation.all8,
              child: ColoredBox(
                color: Colors.white.withOpacity(0.01),
              ),
            ),
          ),
          Center(
            child: Text(
              title,
              style: regularTextTheme?.caption4.copyWith(color: colorScheme?.surface),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
