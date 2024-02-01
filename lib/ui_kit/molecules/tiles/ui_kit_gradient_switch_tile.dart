import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitGradientSwitchTile extends StatelessWidget {
  final String title;
  final ValueChanged<bool>? onChanged;
  final bool switchedOn;
  final Widget? subtitle;

  const UiKitGradientSwitchTile({
    super.key,
    required this.title,
    required this.switchedOn,
    this.subtitle,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return UiKitCardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: context.uiKitTheme?.boldTextTheme.labelLarge,
                ),
              ),
              UiKitGradientSwitch(
                onChanged: onChanged,
                switchedOn: switchedOn,
              ),
            ],
          ),
          if (subtitle != null) ...[
            SpacingFoundation.verticalSpace16,
            subtitle!,
          ],
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
