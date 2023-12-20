import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMessageCloud extends StatelessWidget {
  final Widget? messageWidget;
  final String? message;
  final String? subtitle;
  final TextStyle? messageTextStyle;
  final TextStyle? subtitleTextStyle;

  const UiKitMessageCloud({
    Key? key,
    this.messageWidget,
    this.message,
    this.subtitle,
    this.messageTextStyle,
    this.subtitleTextStyle,
  })  : assert(messageWidget != null || message != null, 'messageWidget or message must be provided'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.uiKitTheme?.colorScheme;
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return SizedBox(
      width: 0.375.sw,
      height: 0.075.sh,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          UiKitCardWrapper(
            borderRadius: BorderRadiusFoundation.all12,
            color: colorScheme?.surface,
            child: UiKitCardWrapper(
              borderRadius: BorderRadiusFoundation.all12,
              color: colorScheme?.surface5,
              child: Center(
                child: (messageWidget ??
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: message ?? '',
                            style:
                                messageTextStyle ?? boldTextTheme?.caption1Bold.copyWith(color: colorScheme?.headingTypography),
                          ),
                          if (subtitle != null)
                            TextSpan(
                              text: '\n$subtitle',
                              style:
                                  subtitleTextStyle ?? boldTextTheme?.caption1Medium.copyWith(color: ColorsFoundation.mutedText),
                            ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    )),
              ),
            ).paddingAll(EdgeInsetsFoundation.all2),
          ),
          Positioned(
            bottom: -12,
            right: 16,
            child: ClipPath(
              clipper: TriangleClipper(),
              child: Container(
                height: 16,
                width: 24.w,
                color: colorScheme?.surface5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const vertexRadius = 4;

    path.lineTo(size.width, 0);
    path.lineTo((size.width / 2) + (vertexRadius / 2), size.height - (vertexRadius / 2));
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      (size.width / 2) - (vertexRadius / 2),
      size.height - (vertexRadius / 2),
    );
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => true;
}
