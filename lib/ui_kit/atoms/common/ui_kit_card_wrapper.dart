import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCardWrapper extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final BorderSide? border;
  final double? width;
  final double? height;
  final Color? color;
  final List<BoxShadow>? boxShadow;

  const UiKitCardWrapper({
    Key? key,
    required this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.color,
    this.boxShadow,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Theme(
      data: Theme.of(context).copyWith(cardTheme: theme?.cardTheme, cardColor: theme?.cardColor),
      child: Card(
        margin: EdgeInsets.zero,
        color: color ?? theme?.cardColor ?? theme?.colorScheme.surface3,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadiusFoundation.all24,
          side: border ?? BorderSide.none,
        ),
        child: Container(
          width: width,
          height: height,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            boxShadow: boxShadow,
            color: color ?? theme?.cardColor ?? theme?.colorScheme.surface3,
          ),
          child: child,
        ),
      ),
    );
  }
}
