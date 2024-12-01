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
  final Map<String, bool> claimMap = {
    S.current.ShockingContent: false,
    S.current.SexualContent: false,
    S.current.CopyrightInfringement: false,
    S.current.Misleading: false,
  };

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
        ...claimMap.keys.map(
          (e) => Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    descriptionController.clear();
                    claimMap[e] = !(claimMap[e] ?? false);
                  });
                },
                child: UiKitRadio(selected: claimMap[e] ?? false),
              ),
              SpacingFoundation.horizontalSpace12,
              Expanded(
                child: Text(
                  e,
                  style: theme?.regularTextTheme.labelLarge.copyWith(color: theme.colorScheme.inverseBodyTypography),
                ),
              )
            ],
          ).paddingOnly(bottom: e != claimMap.keys.last ? SpacingFoundation.verticalSpacing12 : 0),
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
              claimMap.forEach(
                (key, value) {
                  claimMap[key] = false;
                },
              );
            });
          },
          onTap: () {
            setState(() {
              claimMap.forEach(
                (key, value) {
                  claimMap[key] = false;
                },
              );
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
                String claim = '';
                if (descriptionController.text.isNotEmpty) {
                  claim = descriptionController.text;
                } else {
                  claimMap.forEach(
                    (key, value) {
                      if (claimMap[key] ?? false) {
                        claim += '$key ';
                      }
                    },
                  );
                }

                widget.onSubmit?.call(claim);
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
