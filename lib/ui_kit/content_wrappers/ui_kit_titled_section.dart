import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitTitledSection extends StatelessWidget {
  final String title;
  final Widget child;
  final bool? hasError;
  final String? errorText;

  const UiKitTitledSection({
    Key? key,
    this.hasError,
    this.errorText,
    required this.title,
    required this.child,
  })  : assert((hasError ?? false) && errorText != null, 'When has error is true, error text must be provided'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        UiKitCardWrapper(
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
          ),
        ],
      ],
    );
  }
}
