import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class CustomBarcode extends StatelessWidget {
  final String barcodeNumber;
  final double? width;
  final double? height;
  final Color? color;

  const CustomBarcode({
    super.key,
    required this.barcodeNumber,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return UiKitCardWrapper(
      width: width ?? 0.85.sw,
      height: height ?? 0.24.sh,
      color: color ?? theme?.colorScheme.inversePrimary,
      borderRadius: BorderRadiusFoundation.all24r,
      child: BarcodeWidget(
        barcode: Barcode.code128(escapes: true),
        data: barcodeNumber,
        style: theme?.regularTextTheme.caption2.copyWith(color: theme.colorScheme.primary),
        textPadding: SpacingFoundation.verticalSpacing8,
      ).paddingOnly(
        top: SpacingFoundation.verticalSpacing10,
        bottom: SpacingFoundation.verticalSpacing6,
        left: SpacingFoundation.horizontalSpacing12,
        right: SpacingFoundation.horizontalSpacing12,
      ),
    );
  }
}
