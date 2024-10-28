import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:flutter/foundation.dart';

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
    return SizedBox(
      height: kIsWeb ? 22 : 0.035.sh,
      width: (kIsWeb ? 22 : 0.035.sh) / 0.6,
      child: GestureDetector(
        onTap: () => onChanged?.call(!switchedOn),
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            AnimatedSwitcher(
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: child,
              ),
              duration: _duration,
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeIn,
              child: Container(
                key: ValueKey(switchedOn),
                height: 0.035.sh,
                width: 0.035.sh / 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusFoundation.max,
                  color: switchedOn ? null : context.uiKitTheme?.colorScheme.surface5,
                  gradient: switchedOn ? GradientFoundation.defaultRadialGradient : null,
                ),
              ),
            ),
            AnimatedAlign(
              curve: Curves.easeIn,
              duration: _duration,
              alignment: switchedOn ? Alignment.centerRight : Alignment.centerLeft,
              child: AnimatedContainer(
                margin: EdgeInsets.all(
                  switchedOn ? EdgeInsetsFoundation.all2 : EdgeInsetsFoundation.all4,
                ),
                curve: Curves.easeIn,
                height: switchedOn ? 0.03.sh : 0.02.sh,
                width: switchedOn ? 0.03.sh : 0.02.sh,
                duration: _duration,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: switchedOn ? context.uiKitTheme?.colorScheme.primary : ColorsFoundation.darkNeutral500,
                ),
              ),
            ),
            if (onChanged == null)
              Positioned.fill(
                child: ColoredBox(
                  color: context.uiKitTheme?.colorScheme.primary.withOpacity(0.5) ?? Colors.black.withOpacity(0.5),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
