import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_kit/atoms/app_bar/app_bar_back_button.dart';
import 'package:shuffle_uikit/ui_kit/atoms/app_bar/app_bar_title.dart';

class CustomAppBar extends PreferredSize {
  final String title;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.centerTitle = false,
    super.preferredSize = const Size(double.infinity, 84),
  }) : super(child: const SizedBox());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: preferredSize.width,
      height: preferredSize.height + MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.all(16),

      /// Navigation-top under Frame484 in Figma
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const AppBarCustomBackButton(),
            AppBarTitle(
              title: title,
              centerTitle: centerTitle,
            ),
          ],
        ),
      ),
    );
  }
}
