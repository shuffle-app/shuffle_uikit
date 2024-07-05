import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCheckbox extends StatelessWidget {
  final VoidCallback? onChanged;
  final bool isActive;
  final Color? borderColor;
  final bool disabled;

  const UiKitCheckbox({
    super.key,
    this.onChanged,
    this.borderColor,
    required this.isActive,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Material(
      color: disabled ? ColorsFoundation.neutral48 : Colors.transparent,
      child: InkWell(
        onTap: onChanged,
        child: Ink(
          padding: EdgeInsets.all(EdgeInsetsFoundation.all2),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusFoundation.all4,
            border: isActive
                ? GradientFoundation.gradientBorder
                : Border.all(
                    color: borderColor ?? colorScheme?.inversePrimary.withOpacity(0.3) ?? Colors.black38,
                    width: 2,
                  ),
          ),
          child: AnimatedScale(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            scale: isActive ? 1.0 : 0,
            child: GradientableWidget(
              active: isActive,
              gradient: GradientFoundation.attentionCard,
              child: Opacity(
                opacity: disabled ? 0.5 : 1.0,
                child: ImageWidget(
                  iconData: ShuffleUiKitIcons.check,
                  color: Colors.white,
                  height: SpacingFoundation.horizontalSpacing12,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
