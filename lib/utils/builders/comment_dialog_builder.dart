import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<T?> showUiKitPopover<T extends Object?>(BuildContext context,
    {required Widget title,
    Widget? description,
    String buttonText = 'OK',
    VoidCallback? onPop,
    bool showButton = true,
    double? customMinHeight}) {
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
        children: [
          title,
          if (description != null) description.paddingSymmetric(vertical: SpacingFoundation.verticalSpacing8),
          if (showButton)
            context
                .dialogButton(
                  data: BaseUiKitButtonData(text: buttonText, onPressed: context.pop),
                  small: true,
                  dialogButtonType: DialogButtonType.buttonBlack,
                )
                .paddingOnly(top: SpacingFoundation.verticalSpacing8)
        ],
      ).paddingSymmetric(vertical: SpacingFoundation.verticalSpacing12, horizontal: SpacingFoundation.horizontalSpacing12),
    ),
    //ставим зависимость от константы и берем значение любого угла, любого направления, так как они все одинаковые
    radius: BorderRadiusFoundation.all24.topRight.x,
    constraints: SizesFoundation.minimumSizeForCommentPopup,
    onPop: onPop,
    direction: PopoverDirection.bottom,
  );
}
