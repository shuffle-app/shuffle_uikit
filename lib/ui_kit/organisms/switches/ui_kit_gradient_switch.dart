import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitGradientSwitch extends StatelessWidget {
  static const _duration = Duration(milliseconds: 250);
  final bool switchedOn;
  final ValueChanged<bool>? onChanged;

  const UiKitGradientSwitch({
    super.key,
    required this.switchedOn,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged?.call(!switchedOn),
      child: AnimatedContainer(
        height: 0.035.sh,
        width: 0.035.sh / 0.6,
        duration: _duration,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusFoundation.max,
          color: switchedOn ? null : ColorsFoundation.surface5,
          gradient: switchedOn ? GradientFoundation.defaultRadialGradient : null,
        ),
        child: AnimatedAlign(
          duration: _duration,
          alignment: switchedOn ? Alignment.centerRight : Alignment.centerLeft,
          child: AnimatedContainer(
            height: switchedOn ? 0.03.sh : 0.02.sh,
            width: switchedOn ? 0.03.sh : 0.02.sh,
            duration: _duration,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: switchedOn ? Colors.black : ColorsFoundation.darkNeutral500,
            ),
          ),
        ).paddingAll(
          switchedOn ? EdgeInsetsFoundation.all2 : EdgeInsetsFoundation.all4,
        ),
      ),
    );
  }
}
