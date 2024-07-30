import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitChartLegendWidget extends StatelessWidget {
  final String valueTitle;
  final String value;
  final Widget? leading;

  const UiKitChartLegendWidget({
    Key? key,
    required this.valueTitle,
    required this.value,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        leading?.paddingOnly(right: EdgeInsetsFoundation.horizontal4) ?? const SizedBox.shrink(),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: value,
                style: boldTextTheme?.caption2Bold,
              ),
              TextSpan(
                text: ' $valueTitle',
                style: regularTextTheme?.caption2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
