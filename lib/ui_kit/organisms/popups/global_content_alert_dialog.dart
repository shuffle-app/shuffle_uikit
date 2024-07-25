import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class GlobalContentAlertDialog extends StatelessWidget {
  const GlobalContentAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.uiKitTheme?.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: context.uiKitTheme!.colorScheme.surface5, width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              context.iconButtonNoPadding(
                data: BaseUiKitButtonData(
                  onPressed: () => context.pop(),
                  iconInfo: BaseUiKitButtonIconData(
                    iconData: ShuffleUiKitIcons.x,
                  ),
                ),
              )
            ],
          ),
          SpacingFoundation.verticalSpace16,
          Text(
            S.current.GlobalAlertText,
            style: context.uiKitTheme?.boldTextTheme.title2.copyWith(color: ColorsFoundation.danger),
            textAlign: TextAlign.center,
          ),
          SpacingFoundation.verticalSpace16,
          context.button(
            data: BaseUiKitButtonData(
              text: S.current.Ok,
              onPressed: () => context.pop(),
            ),
          )
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
