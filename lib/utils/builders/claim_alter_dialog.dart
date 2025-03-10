import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<void> claimAlterDialog(BuildContext context, {ValueChanged<String>? onSubmit}) {
  return showUiKitAlertDialog(
    context,
    AlertDialogData(
      actionsPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.all(EdgeInsetsFoundation.all24),
      titlePadding: EdgeInsets.zero,
      insetPadding: REdgeInsets.symmetric(horizontal: SpacingFoundation.horizontalSpacing12),
      content: ClaimAlterDialogWidget(
        onSubmit: onSubmit,
      ),
      defaultButtonText: '',
    ),
  );
}

class ClaimAlterDialogWidget extends StatefulWidget {
  final ValueChanged<String>? onSubmit;

  const ClaimAlterDialogWidget({
    super.key,
    this.onSubmit,
  });

  @override
  State<ClaimAlterDialogWidget> createState() => _ClaimAlterDialogWidgetState();
}

class _ClaimAlterDialogWidgetState extends State<ClaimAlterDialogWidget> {
  bool myClaim = false;
  final TextEditingController descriptionController = TextEditingController();

  String selectedClaim = '';
  final List<String> claims = [
    S.current.ShockingContent,
    S.current.SexualContent,
    S.current.CopyrightInfringement,
    S.current.Misleading,
  ];

  String? errorText;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          S.of(context).DescribeYourClaim,
          style: theme?.boldTextTheme.title2.copyWith(color: theme.colorScheme.inverseHeadingTypography),
          textAlign: TextAlign.center,
        ),
        SpacingFoundation.verticalSpace16,
        ...claims.map(
          (e) => InkWell(
            splashFactory: NoSplash.splashFactory,
            onTap: () {
              setState(() {
                myClaim = false;
                errorText = null;
                descriptionController.clear();
                if (selectedClaim.contains(e)) {
                  selectedClaim = selectedClaim.replaceFirst(e, '');
                } else {
                  selectedClaim += '$e ';
                }
              });
            },
            child: Row(
              children: [
                UiKitRadio(selected: selectedClaim.contains(e)),
                SpacingFoundation.horizontalSpace12,
                Expanded(
                  child: Text(
                    e,
                    style: theme?.regularTextTheme.labelLarge.copyWith(color: theme.colorScheme.inverseBodyTypography),
                  ),
                )
              ],
            ).paddingOnly(bottom: e != claims.last ? SpacingFoundation.verticalSpacing12 : 0),
          ),
        ),
        Divider(
          thickness: 1.w,
          color: ColorsFoundation.darkNeutral400,
        ).paddingSymmetric(vertical: SpacingFoundation.verticalSpacing6),
        InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () {
            setState(() {
              myClaim = !myClaim;
              selectedClaim = '';
              if (myClaim == false) descriptionController.clear();
            });
          },
          child: Row(
            children: [
              UiKitRadio(selected: myClaim),
              SpacingFoundation.horizontalSpace12,
              Expanded(
                child: Text(
                  S.of(context).AnotherReason,
                  style: theme?.regularTextTheme.labelLarge.copyWith(color: theme.colorScheme.inverseBodyTypography),
                ),
              )
            ],
          ),
        ),
        SpacingFoundation.verticalSpace12,
        UiKitInputFieldNoFill(
          enabled: myClaim,
          customLabelColor: theme?.colorScheme.inverseBodyTypography ?? Colors.black,
          controller: descriptionController,
          customFocusedBorder:
              const UnderlineInputBorder(borderSide: BorderSide(color: ColorsFoundation.darkNeutral400)),
          customEnabledBorder:
              const UnderlineInputBorder(borderSide: BorderSide(color: ColorsFoundation.darkNeutral400)),
          cursorColor: theme?.colorScheme.inverseBodyTypography ?? Colors.black,
          hintText: S.of(context).YourClaim,
          customHintColor: Colors.grey,
          customInputTextColor: theme?.colorScheme.inverseBodyTypography ?? Colors.black,
          label: S.current.Description,
        ),
        SpacingFoundation.verticalSpace16,
        if (errorText != null && errorText!.isNotEmpty) ...[
          Text(
            errorText!,
            style: theme?.regularTextTheme.labelLarge.copyWith(color: ColorsFoundation.error),
          ).paddingOnly(bottom: SpacingFoundation.verticalSpacing16)
        ],
        SizedBox(
          width: 1.sw,
          child: context.button(
            data: BaseUiKitButtonData(
              textColor: theme?.colorScheme.inversePrimary,
              backgroundColor: theme?.colorScheme.surface,
              onPressed: () {
                if (descriptionController.text.isEmpty && myClaim) {
                  setState(() {
                    errorText = S.of(context).XIsRequired(S.of(context).Description);
                  });
                  return;
                } else if (descriptionController.text.isNotEmpty) {
                  selectedClaim = descriptionController.text;
                }

                widget.onSubmit?.call(selectedClaim.trim());
                context.pop();
              },
              text: S.current.Send,
            ),
          ),
        )
      ],
    );
  }
}
