import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class CompactAlertPopUp extends StatelessWidget {
  final String title;
  final String body;
  final Widget action;

  const CompactAlertPopUp({
    super.key,
    required this.title,
    required this.body,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusFoundation.all24,
      ),
      child: SizedBox(
        width: 0.9.sw,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: textTheme?.title2.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            Text(
              body,
              style: regularTextTheme?.title2.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SpacingFoundation.verticalSpace16,
            action,
          ],
        ).paddingAll(EdgeInsetsFoundation.all24),
      ),
    );
  }
}
