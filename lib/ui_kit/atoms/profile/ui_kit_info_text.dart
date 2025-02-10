import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInfoText extends StatelessWidget {
  final String text;
  final String? title;
  final String? chatName;
  final String? additionalText;
  final String? gradientText;
  final Gradient? textGradient;
  final bool? centerText;

  const UiKitInfoText({
    super.key,
    required this.text,
    this.chatName,
    this.additionalText,
    this.title,
    this.gradientText,
    this.textGradient,
    this.centerText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = theme?.boldTextTheme;
    final regularTextTheme = theme?.regularTextTheme;

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

    if (chatName != null) {
      child = RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  chatName!,
                  style: boldTextTheme?.caption3Medium,
                ),
                if (title != null)
                  Text(
                    title!,
                    style: regularTextTheme?.caption4Regular,
                  ),
              ],
            )),
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
    }

    if (centerText ?? false) return Center(child: child);

    return child;
  }
}
