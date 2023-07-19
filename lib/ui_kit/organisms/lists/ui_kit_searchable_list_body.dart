import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitSearchableListBody<T extends UiKitSearchableListBodyItem> extends StatelessWidget {
  final List<T> items;
  final ValueChanged<T> onItemSelected;
  final String title;

  late final TextEditingController searchController = TextEditingController()
    ..addListener(() {
      final text = searchController.text;
      _itemsNotifier.value =
          text.length >= 3 ? items.where((element) => element.title.toLowerCase().contains(text.toLowerCase())).toList() : items;
    });

  late final ValueNotifier<List<T>> _itemsNotifier = ValueNotifier(items);

  UiKitSearchableListBody({
    super.key,
    required this.title,
    required this.items,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SpacingFoundation.verticalSpace16,
        Text(
          title,
          style: boldTextTheme?.subHeadline,
          textAlign: TextAlign.center,
        ),
        SpacingFoundation.verticalSpace12,
        UiKitInputFieldRightIcon(
          controller: searchController,
          hintText: 'SEARCH',
          icon: ImageWidget(
            svgAsset: GraphicsFoundation.instance.svg.search,
            color: Colors.white.withOpacity(0.48),
          ),
        ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
        SpacingFoundation.verticalSpace16,
        UiKitCardWrapper(
          borderRadius: BorderRadius.zero,
          child: ValueListenableBuilder(
            valueListenable: _itemsNotifier,
            builder: (context, value, child) {
              return ListView.separated(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => SpacingFoundation.verticalSpace16,
                itemCount: value.length,
                itemBuilder: (context, index) {
                  final item = value[index];

                  return UiKitSearchableListBodyItemTile(
                    item: item,
                    onTap: () => onItemSelected.call(item),
                  );
                },
              ).paddingSymmetric(
                horizontal: EdgeInsetsFoundation.horizontal16,
                vertical: EdgeInsetsFoundation.vertical4,
              );
            },
          ),
        ),
      ],
    );
  }
}
