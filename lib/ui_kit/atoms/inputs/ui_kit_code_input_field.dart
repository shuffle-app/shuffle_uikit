import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCodeInputField extends StatelessWidget {
  /// [codeDigitsCount] is a required parameter
  /// because it is necessary to know how many digits
  /// the user should enter
  final int codeDigitsCount;
  final ValueChanged<String>? onDone;
  final TextEditingController? controller;
  final String? errorText;
  final bool autofocus;

  const UiKitCodeInputField({
    super.key,
    required this.codeDigitsCount,
    this.controller,
    this.errorText,
    this.onDone,
    this.autofocus = true,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return LayoutBuilder(builder: (context, size) {
      final availableWidth = size.maxWidth - (SpacingFoundation.horizontalSpacing12 * codeDigitsCount);
      final pinWidth = (availableWidth / codeDigitsCount);

      final pinHeight = pinWidth * 1.6129;
      TextStyle? style = textTheme?.titleLarge;
      BorderRadius? borderRadius = BorderRadiusFoundation.all24;
      if (codeDigitsCount > 5) {
        style = textTheme?.subHeadline;
        borderRadius = BorderRadiusFoundation.all16;
      }
      if (codeDigitsCount > 8) {
        style = textTheme?.caption2Bold;
        borderRadius = BorderRadiusFoundation.all8;
      }

      return Pinput(
        controller: controller,
        separatorBuilder: (_) => SpacingFoundation.horizontalSpace12,
        length: codeDigitsCount,
        autofocus: autofocus,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onCompleted: (value) => onDone?.call(value),
        showCursor: false,
        cursor: const VerticalDivider(
          color: Colors.white,
          thickness: 2,
          width: 2,
        ).paddingSymmetric(
          vertical: EdgeInsetsFoundation.vertical24,
        ),
        forceErrorState: errorText != null,
        mainAxisAlignment: MainAxisAlignment.center,
        keyboardType: TextInputType.number,
        errorText: errorText,
        errorTextStyle: textTheme?.subHeadline,
        errorPinTheme: PinTheme(
          height: pinHeight,
          width: pinWidth,
          textStyle: style,
          decoration: BoxDecoration(
            border: Border.all(color: UiKitColors.error, width: 2),
            borderRadius: borderRadius,
            color: colorScheme!.surface3,
          ),
        ),
        focusedPinTheme: PinTheme(
          height: pinHeight,
          width: pinWidth,
          textStyle: style,
          decoration: BoxDecoration(
            border: GradientFoundation.gradientBorder,
            borderRadius: borderRadius,
            color: colorScheme.surface3,
          ),
        ),
        submittedPinTheme: PinTheme(
          height: pinHeight,
          width: pinWidth,
          textStyle: style,
          decoration: BoxDecoration(
            border: GradientFoundation.gradientBorder,
            borderRadius: borderRadius,
            color: colorScheme.surface3,
          ),
        ),
        defaultPinTheme: PinTheme(
          height: pinHeight,
          width: pinWidth,
          textStyle: style,
          decoration: BoxDecoration(
            border: Border.all(color: colorScheme.inversePrimary, width: 2),
            borderRadius: borderRadius,
            color: colorScheme.surface3,
          ),
        ),
      );
    });
  }
}
