import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OrdinaryProgressButton extends StatelessWidget implements ButtonFactory {
  final double? progress;
  final VoidCallback? onPressed;
  final String? text;

  const OrdinaryProgressButton({
    Key? key,
    this.progress,
    this.onPressed,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        final height = size.maxWidth * 0.15;

        return Material(
          color: Colors.white,
          borderRadius: BorderRadiusFoundation.max,
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: onPressed,
            child: Ink(
              width: size.maxWidth,
              height: height,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: height,
                      width: size.maxWidth * (progress ?? 0),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.15),
                        borderRadius: BorderRadiusFoundation.max,
                      ),
                    ).paddingAll(EdgeInsetsFoundation.all4),
                  ),
                  Center(
                    child: Text(
                      text ?? '',
                      style: context.uiKitTheme?.boldTextTheme.body.copyWith(color: Colors.black),
                    ),
                  ).paddingSymmetric(vertical: EdgeInsetsFoundation.vertical14),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
