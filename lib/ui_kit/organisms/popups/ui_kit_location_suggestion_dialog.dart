import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitLocationSuggestionDialog extends StatefulWidget {
  final String title;
  final Widget? bodyText;
  final ValueChanged<String?>? onLocationNameLoaded;
  final Future<String?> Function()? onLocationFieldTapped;
  final VoidCallback? onContinue;
  const UiKitLocationSuggestionDialog({
    super.key,
    required this.title,
    this.onLocationFieldTapped,
    this.bodyText,
    this.onLocationNameLoaded,
    this.onContinue,
  });

  @override
  State<UiKitLocationSuggestionDialog> createState() => _UiKitLocationSuggestionDialogState();
}

class _UiKitLocationSuggestionDialogState extends State<UiKitLocationSuggestionDialog> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;
    final textTheme = theme?.boldTextTheme;

    return Dialog(
      backgroundColor: colorScheme?.inverseSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusFoundation.all24,
      ),
      insetPadding: EdgeInsets.all(EdgeInsetsFoundation.all16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.title,
            style: textTheme?.title2.copyWith(color: colorScheme?.surface),
            textAlign: TextAlign.center,
          ),
          if (widget.bodyText != null) ...[
            SpacingFoundation.verticalSpace16,
            widget.bodyText!,
          ],
          SpacingFoundation.verticalSpace16,
          UiKitInputFieldNoFill(
            label: S.current.Address,
            controller: controller,
            customInputTextColor: colorScheme?.inverseBodyTypography,
            customFocusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorsFoundation.darkNeutral400,
              ),
            ),
            customEnabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorsFoundation.darkNeutral400,
              ),
            ),
            customHintColor: ColorsFoundation.placeHolderTextColor,
            hintText: 'Burj Khalifa 127th floor, Dubai, UAE',
            customLabelColor: colorScheme?.inverseBodyTypography,
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ImageWidget(
                  iconData: ShuffleUiKitIcons.landmark,
                  color: colorScheme?.inverseHeadingTypography,
                  height: 15.h,
                ),
                SpacingFoundation.verticalSpace2,
              ],
            ),
            onTap: () {
              widget.onLocationFieldTapped?.call().then((value) {
                debugPrint('fsd with $value');
                controller.text = value ?? '';
                setState(() {});
                widget.onLocationNameLoaded?.call(value);
              });
            },
          ),
          SpacingFoundation.verticalSpace16,
          ValueListenableBuilder(
            valueListenable: controller,
            builder: (context, controller, child) {
              return context.gradientButton(
                data: BaseUiKitButtonData(
                  text: S.current.Continue,
                  onPressed: controller.text.isEmpty ? null : widget.onContinue,
                ),
              );
            },
          ),
        ],
      ).paddingAll(EdgeInsetsFoundation.all24),
    );
  }
}
