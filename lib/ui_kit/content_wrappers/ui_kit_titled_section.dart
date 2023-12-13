import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledSection extends StatelessWidget {
  final String title;
  final Widget child;
  final bool? hasError;
  final String? errorText;
  final Color? color;
  final String? infoText;

  const UiKitTitledSection({
    Key? key,
    this.hasError,
    this.color,
    this.infoText,
    this.errorText,
    required this.title,
    required this.child,
  })  : assert(!((hasError ?? false) && errorText == null), 'When has error is $hasError, error text must be provided'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        UiKitCardWrapper(
          color: color,
          border: hasError == true
              ? const BorderSide(
                  color: ColorsFoundation.error,
                  width: 1,
                )
              : null,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(children: [
                Flexible(
                    child: Text(
                  title,
                  style: context.uiKitTheme?.boldTextTheme.labelLarge,
                )),
                if (infoText != null && infoText!.isNotEmpty) ...[
                  SpacingFoundation.horizontalSpace4,
                  Builder(
                      builder: (context) => InkWell(
                          child: ImageWidget(
                            iconData: ShuffleUiKitIcons.info,
                            color: theme?.colorScheme.darkNeutral800,
                          ),
                          onTap: () {
                            showUiKitPopover(context,
                                title: Text(
                                  infoText!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Unbounded',
                                    fontSize: 16.w,
                                    fontWeight: FontWeight.w300,
                                    color: theme?.colorScheme.primary,
                                    package: 'shuffle_uikit',
                                  ),
                                ),
                                customMinHeight: 40.h,
                                showButton: false);
                          })),
                ]
              ]).paddingOnly(
                top: EdgeInsetsFoundation.vertical16,
                left: EdgeInsetsFoundation.horizontal16,
              ),
              SpacingFoundation.verticalSpace12,
              child,
            ],
          ),
        ),
        if (hasError ?? false) ...[
          SpacingFoundation.verticalSpace2,
          Text(
            errorText!,
            style: context.uiKitTheme?.regularTextTheme.caption2.copyWith(
              color: ColorsFoundation.error,
            ),
          ).paddingSymmetric(horizontal: context.uiKitTheme?.cardTheme.margin?.horizontal ?? 4),
        ],
      ],
    );
  }
}
