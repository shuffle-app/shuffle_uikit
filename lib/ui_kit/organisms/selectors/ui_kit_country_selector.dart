import 'package:countries_flag/countries_flag.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitCountrySelector extends StatelessWidget {
  final String title;
  final ValueChanged<CountryModel>? onSelected;
  final CountryModel? selectedCountry;

  final UniqueKey contrySelectorKey = UniqueKey();

  UiKitCountrySelector({
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
      color: context.uiKitTheme?.colorScheme.surface3,
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
            child: SafeArea(
                top: false,
                child: UiKitSearchableListBody<CountryModel>(
                  key: contrySelectorKey,
                  title: title,
                  items: CountriesFoundation.instance.countries,
                  onItemSelected: (item) {
                    onSelected?.call(item);
                    Navigator.pop(context);
                  },
                )),
          ),
        ),
        child: Ink(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (selectedCountry == null)
                Expanded(
                  child: Text(
                    S.of(context).SelectOption,
                    style: boldTextTheme?.caption1Medium,
                  ),
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
                Expanded(
                  child: Text(
                    selectedCountry!.countryName,
                    style: boldTextTheme?.caption1Medium.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
              SpacingFoundation.horizontalSpace4,
              ImageWidget(
                iconData: ShuffleUiKitIcons.chevronright,
                color: context.uiKitTheme?.colorScheme.inversePrimary,
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
