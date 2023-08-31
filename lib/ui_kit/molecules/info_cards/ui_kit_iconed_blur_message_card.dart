import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitIconedBlurMessageCard extends StatelessWidget {
  final Widget message;
  final String iconLink;
  final double? blurValue;
  final Axis orientation;
  final BorderRadius? borderRadius;
  final Border? border;
  final CrossAxisAlignment? crossAxisAlignment;

  UiKitIconedBlurMessageCard({
    Key? key,
    required this.message,
    required this.iconLink,
    this.blurValue,
    this.border,
    this.borderRadius,
    this.crossAxisAlignment,
    this.orientation = Axis.horizontal,
  }) : super(key: key);

  late final children = [
    Stack(
      children: [
        Container(
          width: 0.0225.sw,
          height: 0.0225.sw,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              const BoxShadow(
                color: Color.fromRGBO(255, 255, 255, 0.63),
                blurRadius: 10,
                offset: Offset(0, 4),
                blurStyle: BlurStyle.normal,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(-1, -1),
                blurRadius: 10,
              )
            ],
          ),
        ).paddingOnly(
          top: 0.0125.sw,
          left: 0.0225.sw,
        ),
        ImageWidget(
          link: iconLink,
          width: 0.075.sw,
          height: 0.075.sw,
          fit: BoxFit.cover,
        ),
      ],
    ),
    if (orientation == Axis.horizontal) SpacingFoundation.horizontalSpace4,
    if (orientation == Axis.vertical) SpacingFoundation.verticalSpace4,
    message,
  ];

  @override
  Widget build(BuildContext context) {
    if (orientation == Axis.horizontal) {
      return UiKitBlurWrapper(
        borderRadius: borderRadius,
        border: border,
        blurValue: blurValue ?? 50,
        child: Row(
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      );
    }

    return UiKitBlurWrapper(
      borderRadius: borderRadius,
      border: border,
      blurValue: blurValue ?? 50,
      child: Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
