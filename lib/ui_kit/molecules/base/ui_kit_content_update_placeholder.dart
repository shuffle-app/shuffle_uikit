import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitContentUpdatePlaceholder extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final Gradient gradient;

  const UiKitContentUpdatePlaceholder({
    Key? key,
    required this.height,
    required this.width,
    required this.title,
    required this.gradient,
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
        gradient: gradient,
      ),
      child: Center(
        child: Text(
          title,
          style: regularTextTheme?.caption4.copyWith(color: colorScheme?.surface),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
