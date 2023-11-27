import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCustomBackgroundSwitchOptionWidget extends StatelessWidget {
  final CustomBackgroundSwitchOption option;

  const UiKitCustomBackgroundSwitchOptionWidget({
    Key? key,
    required this.option,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageWidget(
          iconData: option.icon,
        ),
        GradientableWidget(
          gradient: GradientFoundation.defaultRadialGradient,
          child: Text(
            option.title,
            style: textTheme?.caption2Bold.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
