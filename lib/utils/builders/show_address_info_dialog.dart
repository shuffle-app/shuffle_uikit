import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

showAddressInfoDialog(BuildContext context, String? address) {
  final theme = context.uiKitTheme;
  showGeneralDialog(
      barrierColor: const Color(0xff2A2A2A),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: widget,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Dialog(
          insetPadding: EdgeInsets.all(EdgeInsetsFoundation.all16),
          backgroundColor: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusFoundation.all24,
          ),
          child: CustomContentInfoDialog(
            title: S.current.Address,
            children: [
              Text(
                address ?? '',
                style: theme?.regularTextTheme.body.copyWith(color: Colors.black),
              )
            ],
          ),
        );
      });
}
