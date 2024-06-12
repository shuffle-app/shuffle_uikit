import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPropertyIcons extends StatefulWidget {
  final Function() onPressed;
  final List<IconData> listIconData;

  const UiKitPropertyIcons({
    super.key,
    required this.onPressed,
    required this.listIconData,
  });

  @override
  UiKitPropertyIconsState createState() => UiKitPropertyIconsState();
}

class UiKitPropertyIconsState extends State<UiKitPropertyIcons> {
  final TextEditingController _textEditingController = TextEditingController();
  IconData? selectedIcon;

  void _onIconSelected(IconData iconData, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedIcon = iconData;
      } else {
        selectedIcon = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: UiKitInputFieldNoIcon(
                borderRadius: BorderRadiusFoundation.all12,
                controller: _textEditingController,
                fillColor: ColorsFoundation.lightSurface4,
                textColor: ColorsFoundation.lightBodyTypographyColor,
                hintText: S.of(context).Weather,
                hintTextColor: ColorsFoundation.lightBodyTypographyColor,
              ),
            ),
            SpacingFoundation.horizontalSpace16,
            Container(
              padding: EdgeInsets.all(EdgeInsetsFoundation.all8),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusFoundation.all12,
                color: ColorsFoundation.primary200.withOpacity(0.4),
              ),
              child: context.boxIconButton(
                data: BaseUiKitButtonData(
                  fit: ButtonFit.hugContent,
                  backgroundColor: Colors.transparent,
                  iconInfo: BaseUiKitButtonIconData(
                    iconPath: GraphicsFoundation.instance.svg.download.path,
                    color: ColorsFoundation.primary200,
                  ),
                  onPressed: () {
                    log('IS SELECTED ${selectedIcon?.codePoint}');
                  },
                ),
              ),
            )
          ],
        ),
        Container(
          width: double.maxFinite,
          height: 0.3.sh,
          decoration: BoxDecoration(
            color: ColorsFoundation.lightSurface2,
            borderRadius: BorderRadiusFoundation.all12,
          ),
          child: Scrollbar(
            thumbVisibility: true,
            child: GridView.builder(
              padding: EdgeInsetsDirectional.zero,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: EdgeInsetsFoundation.all16,
              ),
              itemCount: widget.listIconData.length,
              itemBuilder: (context, index) {
                return HoverableImageWidget(
                  iconData: widget.listIconData[index],
                  isSelected: selectedIcon == widget.listIconData[index],
                  onSubmit: (isSelected) {
                    _onIconSelected(widget.listIconData[index], isSelected);
                  },
                );
              },
            ).paddingAll(EdgeInsetsFoundation.all8),
          ).paddingAll(EdgeInsetsFoundation.all8),
        ).paddingSymmetric(vertical: SpacingFoundation.verticalSpacing20)
      ],
    );
  }
}

class HoverableImageWidget extends StatelessWidget {
  final Function(bool isSelected) onSubmit;
  final IconData iconData;
  final bool isSelected;

  const HoverableImageWidget({
    super.key,
    required this.iconData,
    required this.onSubmit,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSelected ? ColorsFoundation.info : Colors.transparent;
    final iconColor = isSelected ? Colors.white : ColorsFoundation.lightBodyTypographyColor;

    return context.boxIconButton(
      data: BaseUiKitButtonData(
        onPressed: () {
          onSubmit(!isSelected);
        },
        backgroundColor: backgroundColor,
        iconInfo: BaseUiKitButtonIconData(
          iconData: iconData,
          color: iconColor,
        ),
      ),
    );
  }
}
