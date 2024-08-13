import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class CustomAppBar extends PreferredSize {
  final String title;
  final Widget? customTitle;
  final bool centerTitle;
  final bool hideBody;
  final bool? autoImplyLeading;
  final double? bodySpacing;
  final Widget? appBarBody;
  final Widget? appBarTrailing;
  final Widget? leading;
  final String? onIWidgetInfoString;
  final bool? expandTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.hideBody = true,
    this.customTitle,
    this.bodySpacing,
    this.leading,
    this.centerTitle = false,
    this.autoImplyLeading,
    this.appBarBody,
    this.appBarTrailing,
    this.onIWidgetInfoString,
    this.expandTitle,
    super.preferredSize = const Size(double.infinity, 84),
  }) : super(child: const SizedBox());

  @override
  Widget build(BuildContext context) {
    final showLeading = autoImplyLeading ?? false || leading != null;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return ClipRRect(
      borderRadius: BorderRadiusFoundation.onlyBottom24,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 25,
          sigmaY: 25,
          tileMode: TileMode.mirror,
        ),
        child: Container(
          width: preferredSize.width,
          decoration: BoxDecoration(
            color: colorScheme?.inversePrimary.withOpacity(0.07),
            borderRadius: BorderRadiusFoundation.onlyBottom24,
          ),
          padding: const EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: hideBody ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.viewPaddingOf(context).top,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (!showLeading) const SizedBox(),
                    if (showLeading) leading ?? const AppBarBackButton(),
                    if (showLeading) SpacingFoundation.horizontalSpace8,
                    customTitle ??
                        AppBarTitle(
                          title: title,
                          centerTitle: centerTitle,
                          onIWidgetInfoString: onIWidgetInfoString,
                          expanded: expandTitle,
                        ),
                    if (appBarTrailing != null && !centerTitle) SpacingFoundation.horizontalSpace8,
                    if (appBarTrailing != null) appBarTrailing!,
                    if (appBarTrailing == null && centerTitle) SpacingFoundation.horizontalSpace24,
                  ],
                ),
                if (!hideBody) bodySpacing?.heightBox ?? SpacingFoundation.verticalSpace8,
                if (appBarBody != null && !hideBody) appBarBody!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
