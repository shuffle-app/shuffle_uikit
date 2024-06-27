import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledWrappedInput extends StatelessWidget {
  final Widget input;
  final String title;
  final String? popOverMessage;
  final double? padding;

  const UiKitTitledWrappedInput({
    super.key,
    required this.input,
    required this.title,
    this.padding,
    this.popOverMessage,
  });

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
                        customMinHeight: 40.h,
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
        ],
      ).paddingAll(EdgeInsetsFoundation.all16),
    );
  }
}
