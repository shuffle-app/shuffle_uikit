import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class CustomAppBar extends PreferredSize {
  final String title;
  final bool centerTitle;
  final bool? autoImplyLeading;
  final Widget? appBarBody;
  final Widget? appBarTrailing;

  const CustomAppBar({
    super.key,
    required this.title,
    this.centerTitle = false,
    this.autoImplyLeading,
    this.appBarBody,
    this.appBarTrailing,
    super.preferredSize = const Size(double.infinity, 84),
  }) : super(child: const SizedBox());

  @override
  Widget build(BuildContext context) {
    final showLeading = autoImplyLeading ?? false;

    return ClipRRect(
      borderRadius: BorderRadiusFoundation.onlyBottom24,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
        child: Container(
          width: preferredSize.width,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.07),
            borderRadius: BorderRadiusFoundation.onlyBottom24,
          ),
          padding: const EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.top,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (showLeading) const AppBarBackButton(),
                    if (showLeading && !centerTitle) SpacingFoundation.horizontalSpace8,
                    AppBarTitle(
                      title: title,
                      centerTitle: centerTitle,
                    ),
                    if (appBarTrailing != null && !centerTitle) SpacingFoundation.horizontalSpace8,
                    if (appBarTrailing != null) appBarTrailing!,
                  ],
                ),
                SpacingFoundation.verticalSpace16,
                if (appBarBody != null) appBarBody!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
