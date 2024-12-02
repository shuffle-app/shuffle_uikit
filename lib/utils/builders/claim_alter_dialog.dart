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
  final TextEditingController descriptionController = TextEditingController();

  String selectedClaim = '';
  final List<String> claims = [
    S.current.ShockingContent,
    S.current.SexualContent,
    S.current.CopyrightInfringement,
    S.current.Misleading,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          S.of(context).DescribeYourClaim,
          style: theme?.boldTextTheme.title2.copyWith(color: theme.colorScheme.inverseHeadingTypography),
        ),
        SpacingFoundation.verticalSpace16,
        ...claims.map(
          (e) => Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    descriptionController.clear();
                    selectedClaim += '$e ';
                  });
                },
                child: UiKitRadio(selected: selectedClaim.contains(e)),
              ),
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
        SpacingFoundation.verticalSpace12,
        UiKitInputFieldNoFill(
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
          onChanged: (value) {
            setState(() {
              if (selectedClaim.isNotEmpty) {
                selectedClaim = '';
              }
            });
          },
          onTap: () {
            setState(() {
              if (selectedClaim.isNotEmpty) {
                selectedClaim = '';
              }
            });
          },
        ),
        SpacingFoundation.verticalSpace16,
        SizedBox(
          width: 1.sw,
          child: context.button(
            data: BaseUiKitButtonData(
              textColor: theme?.colorScheme.inversePrimary,
              backgroundColor: theme?.colorScheme.surface,
              onPressed: () {
                if (descriptionController.text.isNotEmpty) {
                  selectedClaim = descriptionController.text;
                }

                widget.onSubmit?.call(selectedClaim);
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
