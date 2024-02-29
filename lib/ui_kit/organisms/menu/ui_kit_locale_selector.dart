import 'package:flutter/widgets.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitLocaleSelector extends StatelessWidget {
  const UiKitLocaleSelector({
    super.key,
    required this.selectedLocale,
    required this.availableLocales,
    required this.onLocaleChanged,
  });

  final LocaleModel selectedLocale;
  final List<LocaleModel> availableLocales;
  final ValueChanged<LocaleModel> onLocaleChanged;

  List<LocaleModel> get _sortedLocales => List.from(availableLocales..sort((a, b) => a.sortNumber.compareTo(b.sortNumber)));

  @override
  Widget build(BuildContext context) {
    return UiKitMenu<LocaleModel>(
      useCustomTiles: true,
      separator: SpacingFoundation.verticalSpace16,
      title: S.of(context).SelectLanguage,
      borderRadius: BorderRadiusFoundation.max,
      tilesColor: context.uiKitTheme?.colorScheme.surface1,
      selectedItem: UiKitMenuItem<LocaleModel>(
        title: selectedLocale.name,
        value: selectedLocale,
        iconLink: selectedLocale.iconLink,
      ),
      customTopPadding: 0.3.sh,
      items: List.generate(
        _sortedLocales.length,
        (index) => UiKitMenuItem(
          title: _sortedLocales[index].name,
          value: _sortedLocales[index],
          iconLink: _sortedLocales[index].iconLink,
          enabled: _sortedLocales[index].enabled,
        ),
      ),
      onSelected: (menuItem) {
        if (menuItem.value != null) {
          onLocaleChanged(menuItem.value!);
          Navigator.pop(context);
        }
      },
    );
  }
}
