import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledSection extends StatelessWidget {
  final String title;
  final Widget child;
  final bool? hasError;
  final String? errorText;
  final Color? color;

  const UiKitTitledSection({
    Key? key,
    this.hasError,
    this.color,
    this.errorText,
    required this.title,
    required this.child,
  })
      : assert(!((hasError ?? false) && errorText ==
      null), 'When has error is $hasError, error text must be provided'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Text(
                title,
                style: context.uiKitTheme?.boldTextTheme.labelLarge,
              ).paddingOnly(
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
          ).paddingSymmetric(horizontal:  context.uiKitTheme?.cardTheme?.margin?.horizontal ?? 4),
        ],
      ],
    );
  }
}
