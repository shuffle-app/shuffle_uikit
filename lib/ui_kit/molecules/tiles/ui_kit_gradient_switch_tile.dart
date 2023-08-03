import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitGradientSwitchTile extends StatelessWidget {
  final String title;
  final ValueChanged<bool>? onChanged;
  final bool switchedOn;

  const UiKitGradientSwitchTile({
    super.key,
    required this.title,
    this.onChanged,
    required this.switchedOn,
  });

  @override
  Widget build(BuildContext context) {
    return UiKitCardWrapper(
      child: Row(
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
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
