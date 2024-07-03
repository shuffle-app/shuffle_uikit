import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitReactionPreview extends StatelessWidget {
  final String? imagePath;
  final bool viewed;
  final bool isEmpty;
  final VoidCallback? onTap;
  final double? customWidth;
  final double? customHeight;

  const UiKitReactionPreview({
    super.key,
    this.imagePath,
    this.viewed = false,
    this.onTap,
    this.isEmpty = false,
    this.customWidth,
    this.customHeight,
  });

  factory UiKitReactionPreview.empty({
    VoidCallback? onTap,
    double? customWidth,
    double? customHeight,
  }) =>
      UiKitReactionPreview(
        imagePath: '',
        viewed: false,
        isEmpty: true,
        customWidth: customWidth,
        customHeight: customHeight,
        onTap: onTap,
      );

  double get width => customWidth ?? (height * 0.6);

  double get height => customHeight ?? 0.2605.sh;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (isEmpty)
            Center(
              child: GradientableWidget(
                gradient: GradientFoundation.defaultLinearGradient,
                child: ImageWidget(
                  svgAsset: GraphicsFoundation.instance.svg.plus,
                  color: Colors.white,
                  fit: BoxFit.cover,
                  height: 32.w,
                  width: 32.w,
                ),
              ),
            ),
          if (!isEmpty)
            ClipRRect(
              borderRadius: BorderRadiusFoundation.all16,
              // child: DecoratedBox(
              //     position: DecorationPosition.foreground,
              //     decoration: BoxDecoration(
              //       color: viewed ? ColorsFoundation.darkNeutral900.withOpacity(0.5) : null,
              //     ),
                  child: ImageWidget(
                    link: imagePath,
                    fit: BoxFit.cover,
                  )),
            // ),
          Material(
            color: Colors.transparent,
            borderRadius: BorderRadiusFoundation.all16,
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: onTap,
              child: Ink(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusFoundation.all16,
                  border: isEmpty
                      ? Border.all(width: 2, color: ColorsFoundation.neutral40)
                      : viewed
                      ? null
                      : GradientFoundation.gradientBorder,
                ),
                child: SizedBox(
                  width: width,
                  height: height,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
