import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<T?> showUiKitPopover<T extends Object?>(
  BuildContext context, {
  required Widget title,
  Widget? description,
  String buttonText = 'OK',
  VoidCallback? onPop,
  bool showButton = true,
  ButtonFit? buttonFit,
  double? customMinHeight,
}) {
  return showPopover<T>(
    context: context,
    backgroundColor: context.uiKitTheme?.cardTheme.color ?? Colors.white,
    transitionDuration: const Duration(milliseconds: 250),
    bodyBuilder: (context) => ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 1.sw - SpacingFoundation.horizontalSpacing32,
        minHeight: customMinHeight ?? 0.2.sh,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          title,
          if (description != null) description.paddingSymmetric(vertical: SpacingFoundation.verticalSpacing8),
          if (showButton)
            context
                .dialogButton(
                  data: BaseUiKitButtonData(
                      text: buttonText,
                      onPressed: () {
                        onPop?.call();
                        context.pop();
                      },
                      fit: buttonFit ?? ButtonFit.hugContent),
                  small: true,
                  dialogButtonType: DialogButtonType.buttonBlack,
                )
                .paddingOnly(top: SpacingFoundation.verticalSpacing8)
        ],
      ).paddingSymmetric(
        vertical: SpacingFoundation.verticalSpacing12,
        horizontal: SpacingFoundation.horizontalSpacing12,
      ),
    ),
    //ставим зависимость от константы и берем значение любого угла, любого направления, так как они все одинаковые
    radius: BorderRadiusFoundation.all24.topRight.x,
    constraints: SizesFoundation.minimumSizeForCommentPopup,
    // onPop: onPop,
    direction: PopoverDirection.bottom,
  );
}

Future<T?> showEdgePopOver<T extends Object?>(
  BuildContext context, {
  required Widget title,
  // required Offset popOverTailStart,
  Widget? description,
  String buttonText = 'OK',
  VoidCallback? onPop,
  bool showButton = true,
  double? customMinHeight,
}) {
  // final renderObject = context.findRenderObject() as RenderBox;
  const popOverTailStart = Offset(387.1, 387.0); //renderObject.localToGlobal(const Offset(6, -16));
  // print('popOverTailStart: $popOverTailStart');

  return showDialog(
    context: context,
    builder: (context) {
      return SizedBox.fromSize(
        size: Size(1.sw, 1.sh),
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Positioned(
              top: popOverTailStart.dy,
              left: popOverTailStart.dx,
              width: 10,
              height: 10,
              child: Container(
                width: 10,
                height: 10,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    },
  );
}
