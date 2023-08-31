import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BlurredProgressButton extends StatelessWidget implements ButtonFactory {
  final double? progress;
  final VoidCallback? onPressed;
  final String? text;

  const BlurredProgressButton({
    super.key,
    this.progress = 0,
    this.onPressed,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        final height = size.maxWidth * 0.16;

        return Material(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadiusFoundation.max,
          clipBehavior: Clip.hardEdge,
          child: SizedBox(
            height: height,
            width: size.maxWidth,
            child: Stack(
              fit: StackFit.expand,
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                  child: Container(),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: height,
                    width: size.maxWidth * (progress ?? 0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadiusFoundation.max,
                    ),
                  ).paddingAll(EdgeInsetsFoundation.all4),
                ),
                InkWell(
                  onTap: onPressed,
                  child: Ink(
                    child: Center(
                      child: Text(
                        text ?? '',
                        style: context.uiKitTheme?.boldTextTheme.body,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
