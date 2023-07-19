import 'package:countries_flag/countries_flag.dart';
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
        onTap: () => showUiKitGeneralFullScreenDialog(
          context,
          GeneralDialogData(
            useRootNavigator: false,
            child: UiKitSearchableListBody<CountryModel>(
              title: title,
              items: CountriesFoundation.instance.countries,
              onItemSelected: (item) {
                onSelected?.call(item);
                Navigator.pop(context);
              },
            ),
          ),
        ),
        child: Ink(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (selectedCountry == null)
                Text(
                  'Select option',
                  style: boldTextTheme?.caption1Medium,
                ),
              if (selectedCountry != null) ...[
                ClipRRect(
                  borderRadius: BorderRadiusFoundation.all24,
                  child: CountriesFlag(
                    selectedCountry!.flag,
                    width: 0.1.sw,
                    height: 0.1.sw * 0.625,
                  ),
                ),
                SpacingFoundation.horizontalSpace8,
                Text(
                  selectedCountry!.countryName,
                  style: boldTextTheme?.caption1Medium,
                ),
              ],
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
