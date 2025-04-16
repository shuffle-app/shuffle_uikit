import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

Future<void> selectPaymentMethodBottomsheet(
  BuildContext context, {
  List<String> paymentTypes = const [],
  ValueChanged<String>? onConfirmTap,
}) async {
  // : 0.47.sh
  final double topPadding = 1.sw <= 380
      ? paymentTypes.length > 3
          ? 0.32.sh
          : paymentTypes.length > 2
              ? 0.37.sh
              : paymentTypes.length > 1
                  ? 0.42.sh
                  : 0.42.sh
      : paymentTypes.length > 3
          ? 0.47.sh
          : paymentTypes.length > 2
              ? 0.52.sh
              : paymentTypes.length > 1
                  ? 0.57.sh
                  : 0.5.sh;

  await showUiKitGeneralFullScreenDialog(
    context,
    GeneralDialogData(
      topPadding: topPadding,
      useRootNavigator: false,
      isWidgetScrollable: true,
      child: SelectPaymentMethodWidget(
        paymentTypes: paymentTypes,
        onConfirmTap: onConfirmTap,
      ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing16),
    ),
  );
}

class SelectPaymentMethodWidget extends StatefulWidget {
  final List<String> paymentTypes;
  final ValueChanged<String>? onConfirmTap;

  const SelectPaymentMethodWidget({
    super.key,
    this.paymentTypes = const [],
    this.onConfirmTap,
  });

  @override
  State<SelectPaymentMethodWidget> createState() => _SelectPaymentMethodWidgetState();
}

class _SelectPaymentMethodWidgetState extends State<SelectPaymentMethodWidget> {
  String selectedPayment = '';

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SpacingFoundation.verticalSpace16,
        Text(
          S.of(context).SelectPaymentMethod,
          style: theme?.boldTextTheme.title1,
          textAlign: TextAlign.center,
        ),
        SpacingFoundation.verticalSpace24,
        ...widget.paymentTypes.map(
          (type) {
            return GestureDetector(
              onTap: () {
                selectedPayment = type;
                setState(() {});
              },
              child: Row(
                children: [
                  UiKitRadio(selected: type == selectedPayment),
                  SpacingFoundation.horizontalSpace12,
                  Text(
                    type,
                    style: theme?.boldTextTheme.labelLarge,
                  ),
                ],
              ).paddingOnly(bottom: type == widget.paymentTypes.last ? 0 : SpacingFoundation.verticalSpacing12),
            );
          },
        ),
        SpacingFoundation.verticalSpace24,
        context.gradientButton(
          data: BaseUiKitButtonData(
            fit: ButtonFit.fitWidth,
            text: S.of(context).Confirm,
            onPressed: selectedPayment.isEmpty ? null : () => widget.onConfirmTap?.call(selectedPayment),
          ),
        ),
        SpacingFoundation.verticalSpace24,
      ],
    );
  }
}
