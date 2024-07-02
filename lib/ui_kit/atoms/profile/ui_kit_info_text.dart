import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInfoText extends StatelessWidget {
  final String text;
  final String? title;
  final Gradient? textGradient;

  const UiKitInfoText({
    Key? key,
    required this.text,
    this.title,
    this.textGradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Stack(
      children: [
        RichText(
          text: TextSpan(
            children: [
              if (title != null)
                TextSpan(
                  text: '$title\n',
                  style: boldTextTheme?.caption2Bold,
                ),
              TextSpan(
                text: text,
                style: boldTextTheme?.caption3Medium.copyWith(color: Colors.transparent),
              ),
            ],
          ),
        ),
        GradientableWidget(
          gradient: textGradient,
          child: RichText(
            text: TextSpan(
              children: [
                if (title != null)
                  TextSpan(
                    text: '$title\n',
                    style: boldTextTheme?.caption2Bold.copyWith(color: Colors.transparent),
                  ),
                TextSpan(
                  text: text,
                  style: boldTextTheme?.caption3Medium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
