import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledWrappedInput extends StatelessWidget {
  final Widget input;
  final String title;
  final String? popOverMessage;

  const UiKitTitledWrappedInput({
    Key? key,
    required this.input,
    required this.title,
    this.popOverMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = theme?.boldTextTheme;
    final regularTextTheme = theme?.regularTextTheme;
    final colorScheme = theme?.colorScheme;

    return UiKitCardWrapper(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SpacingFoundation.verticalSpace16,
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: boldTextTheme?.labelLarge,
                ),
              ),
              SpacingFoundation.horizontalSpace4,
              if (popOverMessage != null)
                Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: () => showUiKitPopover(
                        context,
                        showButton: false,
                        // popOverTailStart: tailStart,
                        title: Text(
                          popOverMessage!,
                          style: regularTextTheme?.body.copyWith(color: colorScheme?.surface),
                        ),
                      ),
                      child: ImageWidget(
                        iconData: ShuffleUiKitIcons.info,
                        width: 16.w,
                        color: ColorsFoundation.mutedText,
                      ),
                    );
                  },
                ),
            ],
          ),
          SpacingFoundation.verticalSpace4,
          input,
          SpacingFoundation.verticalSpace4,
        ],
      ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal4),
    );
  }
}
