import 'package:flutter/cupertino.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitFieldWithTagList extends StatelessWidget {
  final FieldData fieldData;
  const UiKitFieldWithTagList({
    super.key,
    required this.fieldData,
  });

  @override
  Widget build(BuildContext context) {
    return fieldData is SingleValueFieldData
        ? Column(
            children: [
              Row(
                children: [
                  Text(
                    (fieldData as SingleValueFieldData).value.valueMask,
                    style: context.uiKitTheme?.regularTextTheme.body,
                  ),
                  const Spacer(),
                  context.outlinedButton(
                    data: BaseUiKitButtonData(
                      onPressed: () {},
                      iconInfo: BaseUiKitButtonIconData(
                        iconData: CupertinoIcons.chevron_forward,
                        size: 16.h,
                      ),
                    ),
                  )
                ],
              ),
              SpacingFoundation.verticalSpace8,
              UiKitTagsWidget(
                baseTags: (fieldData as SingleValueFieldData).value.value,
              ),
            ],
          )
        : UiKitExpandableList(
            items: List.generate(
              (fieldData as ListValueFieldData).value.length,
              (index) {
                return BuisnessItem(filedValue: (fieldData as ListValueFieldData).value[index]);
              },
            ),
          );
  }
}

class BuisnessItem extends StatelessWidget {
  const BuisnessItem({
    super.key,
    required this.filedValue,
  });

  final FiledValue filedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              filedValue.valueMask,
              style: context.uiKitTheme?.regularTextTheme.body,
            ),
            const Spacer(),
            context.outlinedButton(
              data: BaseUiKitButtonData(
                onPressed: () {},
                iconInfo: BaseUiKitButtonIconData(
                  iconData: CupertinoIcons.chevron_forward,
                  size: 16.h,
                ),
              ),
            )
          ],
        ),
        SpacingFoundation.verticalSpace8,
        UiKitTagsWidget(
          baseTags: filedValue.value,
        ),
      ],
    );
  }
}

abstract class FieldData {}

class FiledValue<T> {
  final T value;
  final String valueMask;

  FiledValue({
    required this.value,
    required this.valueMask,
  });
}

class ListValueFieldData<T> extends FieldData {
  final List<FiledValue<T>> value;

  ListValueFieldData({required this.value});
}

class SingleValueFieldData<T> extends FieldData {
  final FiledValue<T> value;

  SingleValueFieldData({required this.value});
}
