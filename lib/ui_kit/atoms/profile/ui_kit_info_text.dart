import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInfoText extends StatelessWidget {
  final String text;
  final String? title;
  final String? additionalText;
  final String? gradientText;
  final Gradient? textGradient;
  final bool? centerText;

  const UiKitInfoText({
    Key? key,
    required this.text,
    this.additionalText,
    this.title,
    this.gradientText,
    this.textGradient,
    this.centerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    Widget child = RichText(
      text: TextSpan(
        children: [
          if (title != null)
            TextSpan(
              text: '$title\n',
              style: boldTextTheme?.caption2Bold.copyWith(color: ColorsFoundation.mutedText),
            ),
          TextSpan(
            text: text,
            style: boldTextTheme?.caption3Medium.copyWith(color: ColorsFoundation.mutedText),
          ),
          if (additionalText != null)
            TextSpan(
              text: ' $additionalText',
              style: boldTextTheme?.caption3Medium.copyWith(color: ColorsFoundation.mutedText),
            ),
        ],
      ),
    );
    if (gradientText != null) {
      child = Stack(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$text ',
                  style: boldTextTheme?.caption3Medium.copyWith(color: ColorsFoundation.mutedText),
                ),
                TextSpan(
                  text: gradientText,
                  style: boldTextTheme?.caption3Medium.copyWith(color: Colors.transparent),
                ),
                if (additionalText != null)
                  TextSpan(
                    text: ' $additionalText',
                    style: boldTextTheme?.caption3Medium.copyWith(color: ColorsFoundation.mutedText),
                  )
              ],
            ),
          ),
          GradientableWidget(
            gradient: textGradient,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$text ',
                    style: boldTextTheme?.caption3Medium.copyWith(color: Colors.transparent),
                  ),
                  TextSpan(
                    text: gradientText,
                    style: boldTextTheme?.caption3Medium.copyWith(color: Colors.white),
                  ),
                  if (additionalText != null)
                    TextSpan(
                      text: ' $additionalText',
                      style: boldTextTheme?.caption3Medium.copyWith(color: ColorsFoundation.transparent),
                    )
                ],
              ),
            ),
          ),
        ],
      );
    }

    if (centerText ?? false) return Center(child: child);

    return child;
  }
}
