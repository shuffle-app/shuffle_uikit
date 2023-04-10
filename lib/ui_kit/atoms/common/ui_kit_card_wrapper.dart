import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class CardWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;

  const CardWrapper({
    Key? key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context).extension<UiKitThemeData>();
        return Theme(
          data: Theme.of(context).copyWith(cardTheme: theme?.cardTheme, cardColor: theme?.cardColor),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadiusFoundation.all24,
            ),
            child: Container(
              width: width,
              height: height,
              padding: padding,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
              ),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
