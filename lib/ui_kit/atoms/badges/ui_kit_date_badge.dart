import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitDateBadge extends StatelessWidget {
  final DateTime date;

  const UiKitDateBadge({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return UiKitCardWrapper(
      color: colorScheme?.inverseSurface.withOpacity(0.1),
      borderRadius: BorderRadiusFoundation.max,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Text(
          DateFormat('dd MMMM', Localizations.localeOf(context).languageCode).format(date),
          style: regularTextTheme?.caption4Regular,
        ).paddingSymmetric(
          vertical: EdgeInsetsFoundation.vertical4,
          horizontal: EdgeInsetsFoundation.horizontal8,
        ),
      ),
    );
  }
}
