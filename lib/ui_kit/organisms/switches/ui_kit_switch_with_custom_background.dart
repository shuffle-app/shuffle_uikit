import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitSwitchWithCustomBackground extends StatelessWidget {
  final CustomBackgroundSwitchOption firstOption;
  final CustomBackgroundSwitchOption secondOption;
  final CustomBackgroundSwitchOption selectedOption;
  final ValueChanged<CustomBackgroundSwitchOption>? onChanged;

  const UiKitSwitchWithCustomBackground({
    Key? key,
    required this.firstOption,
    required this.secondOption,
    required this.selectedOption,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = 0.765625.sw;
    final height = width * 0.4897;

    return UiKitCardWrapper(
      height: height,
      width: width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SpacingFoundation.horizontalSpace24,
              UiKitCustomBackgroundSwitchOptionWidget(option: firstOption),
              const Spacer(),
              UiKitCustomBackgroundSwitchOptionWidget(option: secondOption),
              SpacingFoundation.horizontalSpace24,
            ],
          ).paddingAll(EdgeInsetsFoundation.all8),
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            alignment: selectedOption == firstOption ? Alignment.centerLeft : Alignment.centerRight,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: EdgeInsets.all(EdgeInsetsFoundation.all12),
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusFoundation.all24,
                gradient: GradientFoundation.defaultRadialGradient,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBackgroundSwitchOption {
  final String title;
  final String imageLink;

  const CustomBackgroundSwitchOption({
    required this.title,
    required this.imageLink,
  });
}
