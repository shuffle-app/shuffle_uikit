import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCountrySelector extends StatelessWidget {
  final String title;
  final ValueChanged<CountryModel>? onSelected;
  final CountryModel? selectedCountry;

  const UiKitCountrySelector({
    super.key,
    required this.title,
    this.onSelected,
    this.selectedCountry,
  });

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Material(
      clipBehavior: Clip.hardEdge,
      color: ColorsFoundation.surface3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusFoundation.all24,
        side: BorderSide(
          color: selectedCountry == null ? Colors.transparent : Colors.white,
          width: 2,
        ),
      ),
      child: InkWell(
        child: Ink(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (selectedCountry == null)
                Text(
                  'Select option',
                  style: boldTextTheme?.caption1Medium,
                ),
              if (selectedCountry != null) ...[],
              const Spacer(),
              ImageWidget(
                svgAsset: GraphicsFoundation.instance.svg.chevronRight,
                color: Colors.white,
              ),
            ],
          ).paddingSymmetric(
            horizontal: EdgeInsetsFoundation.horizontal16,
            vertical: EdgeInsetsFoundation.vertical12,
          ),
        ),
      ),
    );
  }
}
