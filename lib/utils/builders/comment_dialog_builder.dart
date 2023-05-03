import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<T?> showUiKitPopover<T extends Object?>(BuildContext context,
    {required Widget title,
    Widget? description,
    required String buttonText,
    VoidCallback? onPop}) {
  return showPopover<T>(
    context: context,
    backgroundColor: context.uiKitTheme?.cardTheme.color ?? Colors.white,
    transitionDuration: const Duration(milliseconds: 250),
    bodyBuilder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        title.paddingOnly(bottom: SpacingFoundation.verticalSpacing8),
        if (description != null)
          description.paddingSymmetric(
              vertical: SpacingFoundation.verticalSpacing8),
        context
            .button(
              text: buttonText,
              dialogButton: true,
              dialogButtonType: DialogButtonType.buttonBlack,
              onPressed: () => context.pop(),
            )
            .paddingOnly(
              top: SpacingFoundation.verticalSpacing8,
            )
      ],
    ).paddingSymmetric(
        vertical: SpacingFoundation.verticalSpacing24,
        horizontal: SpacingFoundation.horizontalSpacing24),
    //ставим зависимость от константы и берем значение любого угла, любого аксиса, так как они все одинаковые
    radius: BorderRadiusFoundation.all24.topRight.x,
    constraints: SizesFoundation.minimumSizeForCommentPopup,
    onPop: onPop,
    direction: PopoverDirection.bottom,
  );
}
