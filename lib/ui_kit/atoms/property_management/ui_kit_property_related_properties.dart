import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPropertyRelatedProperties extends StatelessWidget {
  final List<RelatedPropertiesItemUiModel> listRelatedPropertiesItem;

  UiKitPropertyRelatedProperties({
    super.key,
    required this.listRelatedPropertiesItem,
  });

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UiKitInputFieldRightIcon(
          hintColor: context.uiKitTheme?.colorScheme.darkNeutral600,
          borderRadius: BorderRadiusFoundation.all12,
          controller: _textEditingController,
          fillColor: ColorsFoundation.lightSurface4,
          icon: GestureDetector(
            onTap: () {},
            child: const ImageWidget(
              iconData: ShuffleUiKitIcons.chevrondown,
              color: ColorsFoundation.lightBodyTypographyColor,
            ),
          ),
          hintText: S.of(context).SearchProperty,
        ),
        Container(
          decoration: BoxDecoration(
            color: ColorsFoundation.lightSurface2,
            borderRadius: BorderRadiusFoundation.all12,
          ),
          child: Column(
            children: List.generate(
              listRelatedPropertiesItem.length,
              (index) {
                double padding = 0.0;
                if (index != listRelatedPropertiesItem.length - 1) padding = SpacingFoundation.verticalSpacing12;
                final relatedPropertiesItem = listRelatedPropertiesItem[index];

                return RelatedPropertiesItem(
                  uiModel: RelatedPropertiesItemUiModel(
                    iconData: relatedPropertiesItem.iconData,
                    propertiesList: relatedPropertiesItem.propertiesList,
                    title: relatedPropertiesItem.title,
                  ),
                ).paddingOnly(bottom: padding);
              },
            ),
          ).paddingAll(24.0),
        ).paddingSymmetric(vertical: SpacingFoundation.verticalSpacing16),
      ],
    );
  }
}

class RelatedPropertiesItem extends StatelessWidget {
  final RelatedPropertiesItemUiModel uiModel;
  const RelatedPropertiesItem({
    super.key,
    required this.uiModel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final String properties = uiModel.propertiesList.toString().replaceAll(RegExp(r'\[|\]'), '');

    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusFoundation.all6,
              border: Border.all(
                color: theme?.colorScheme.darkNeutral900 ?? Colors.black,
              ),
            ),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ImageWidget(
                  iconData: uiModel.iconData,
                ),
                SpacingFoundation.horizontalSpace4,
                Text(
                  //TODO
                  uiModel.title,
                  style: theme?.boldTextTheme.caption2Bold.copyWith(color: theme.colorScheme.primary),
                ),
              ],
            ).paddingAll(EdgeInsetsFoundation.all4),
          ),
        ),
        SpacingFoundation.horizontalSpace12,
        Flexible(
          child: Text(
            properties,
            style: theme?.regularTextTheme.labelSmall.copyWith(
              color: theme.colorScheme.darkNeutral600,
            ),
          ),
        )
      ],
    );
  }
}

class RelatedPropertiesItemUiModel {
  final String title;
  final IconData iconData;
  final List<String> propertiesList;

  RelatedPropertiesItemUiModel({
    required this.title,
    required this.iconData,
    required this.propertiesList,
  });
}
