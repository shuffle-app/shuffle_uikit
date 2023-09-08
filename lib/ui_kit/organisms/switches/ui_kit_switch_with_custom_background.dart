import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitSwitchWithCustomBackground extends StatelessWidget {
  final CustomBackgroundSwitchOption firstOption;
  final CustomBackgroundSwitchOption secondOption;
  final CustomBackgroundSwitchOption? selectedOption;
  final ValueChanged<CustomBackgroundSwitchOption>? onChanged;

  bool get firstOptionSelected => selectedOption?.title == firstOption.title;

  const UiKitSwitchWithCustomBackground({
    Key? key,
    required this.firstOption,
    required this.secondOption,
    this.selectedOption,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = 0.765625.sw;
    final height = width * 0.4897;

    return GestureDetector(
      onTap: () {
        if (firstOptionSelected) {
          onChanged?.call(secondOption);
        } else {
          onChanged?.call(firstOption);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusFoundation.all32,
          gradient: GradientFoundation.surfaceLinearGradient,
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 10,
              spreadRadius: 0,
              blurStyle: BlurStyle.normal,
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              offset: const Offset(4, -2),
              blurRadius: 10,
              blurStyle: BlurStyle.normal,
              spreadRadius: 0,
            ),
          ],
        ),
        child: UiKitCardWrapper(
          borderRadius: BorderRadiusFoundation.all32,
          height: height,
          color: ColorsFoundation.surface2,
          width: width,
          child: Stack(
            fit: StackFit.expand,
            children: [

              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SpacingFoundation.horizontalSpace24,
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    transitionBuilder: (child, animation) =>
                        ScaleTransition(
                          scale: animation,
                          child: child,
                        ),
                    child: firstOptionSelected
                        ? UiKitCustomBackgroundSwitchOptionWidget(option: firstOption)
                        : const SizedBox.shrink(),
                  ),
                  const Spacer(),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    transitionBuilder: (child, animation) =>
                        ScaleTransition(
                          scale: animation,
                          child: child,
                        ),
                    child: firstOptionSelected ? const SizedBox.shrink() : UiKitCustomBackgroundSwitchOptionWidget(
                        option: secondOption),
                  ),
                  SpacingFoundation.horizontalSpace24,
                ],
              ).paddingAll(EdgeInsetsFoundation.all8),
              AnimatedAlign(
                duration: const Duration(milliseconds: 250),
                alignment: !firstOptionSelected ? Alignment.centerLeft : Alignment.centerRight,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: EdgeInsets.all(EdgeInsetsFoundation.all12),
                  height: height - 16,
                  width: (height - 16) * 0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusFoundation.all24,
                    gradient: GradientFoundation.darkSurfaceGradient,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusFoundation.all20,
                      gradient: GradientFoundation.surfaceLinearGradient,
                    ),
                  ).paddingAll(EdgeInsetsFoundation.all6),
                ),
              ),
            ],
          ),
        ),
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

  factory CustomBackgroundSwitchOption.empty() =>
      const CustomBackgroundSwitchOption(
        title: '',
        imageLink: '',
      );
}
