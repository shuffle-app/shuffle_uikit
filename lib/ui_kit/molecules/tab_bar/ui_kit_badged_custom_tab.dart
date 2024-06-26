import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBadgedCustomTab extends UiKitCustomTab {
  final int badgeValue;

  const UiKitBadgedCustomTab({
    this.badgeValue = 0,
    super.key,
    super.height = 40,
    super.active = true,
    super.group,
    super.customValue,
    super.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: height,
      child: Opacity(
        opacity: active ? 1.0 : 0.5,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            group != null
                ? AutoSizeText(
                    title.toUpperCase(),
                    maxLines: 1,
                    group: group,
                  )
                : Text(title.toUpperCase()),
            if (badgeValue > 0)
              Positioned(
                right: -28,
                top: -16,
                child: Container(
                  width: 0.075.sw,
                  height: 0.075.sw,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: GradientFoundation.defaultRadialGradient,
                  ),
                  child: Center(
                    child: AutoSizeText(
                      badgeValue > 99 ? '99+' : badgeValue.toString(),
                      style: context.uiKitTheme?.boldTextTheme.caption1Bold.copyWith(color: Colors.black),
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
