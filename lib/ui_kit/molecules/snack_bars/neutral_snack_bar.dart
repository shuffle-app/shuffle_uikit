import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class NeutralSnackBar extends StatelessWidget implements SnackBarFactory {
  const NeutralSnackBar({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme?.surface2,
        borderRadius: BorderRadiusFoundation.all12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              message,
              style: textTheme?.body,
            ),
          ),
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
