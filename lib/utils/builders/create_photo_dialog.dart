import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<void> createPhotoDialog(
  BuildContext context, {
  required TextEditingController controller,
  required ValueNotifier<bool> imageIsLoading,
  VoidCallback? onYesTap,
  VoidCallback? onCancelTap,
}) async {
  final theme = context.uiKitTheme;
  final colorsScheme = theme?.colorScheme;

  final formKey = GlobalKey<FormState>();

  await showUiKitAlertDialog(
    context,
    AlertDialogData(
      defaultButtonText: '',
      title: ValueListenableBuilder(
        valueListenable: imageIsLoading,
        builder: (_, value, child) {
          return Text(
            value ? S.current.Wait : S.current.PhotoTitle,
            style: theme?.boldTextTheme.title2.copyWith(
              color: colorsScheme?.inverseBodyTypography,
            ),
            textAlign: TextAlign.center,
          );
        },
      ),
      content: ValueListenableBuilder(
        valueListenable: imageIsLoading,
        builder: (_, value, child) {
          if (value) {
            return SizedBox(
              width: 32.w,
              height: 32.w,
              child: Center(child: CircularProgressIndicator(color: colorsScheme?.primary)),
            );
          } else {
            return child!;
          }
        },
        child: Form(
          key: formKey,
          child: SizedBox(
            width: 0.75.sw,
            child: UiKitInputFieldNoFill(
              controller: controller,
              label: S.current.Title,
              maxSymbols: 25,
              customLabelColor: colorsScheme?.inverseBodyTypography,
              customEnabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: colorsScheme?.darkNeutral400 ?? ColorsFoundation.darkNeutral400,
                ),
              ),
              customFocusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: colorsScheme?.darkNeutral400 ?? ColorsFoundation.darkNeutral400,
                ),
              ),
              customInputTextColor: colorsScheme?.inverseHeadingTypography,
              cursorColor: colorsScheme?.inverseHeadingTypography,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.current.AddTitle;
                }
                return null;
              },
              onChanged: (value) {
                formKey.currentState?.validate();
              },
            ),
          ),
        ),
      ),
      actions: [
        ValueListenableBuilder(
          valueListenable: imageIsLoading,
          builder: (context, value, child) {
            if (value) {
              return SizedBox.shrink();
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  context.dialogButton(
                    small: true,
                    dialogButtonType: DialogButtonType.buttonBlack,
                    data: BaseUiKitButtonData(
                      text: S.of(context).Yes,
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) onYesTap?.call();
                      },
                    ),
                  ),
                  context.smallButton(
                    data: BaseUiKitButtonData(
                      text: S.current.Cancel,
                      onPressed: onCancelTap,
                      backgroundColor: Colors.transparent,
                    ),
                  )
                ],
              );
            }
          },
        ),
      ],
    ),
  );
}
