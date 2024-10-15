import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPropertyIcons extends StatefulWidget {
  final Function() onPressed;
  final List<String> listIconPath;
  final String textFieldHintText;

  const UiKitPropertyIcons({
    super.key,
    required this.onPressed,
    required this.listIconPath,
    required this.textFieldHintText,
  });

  @override
  UiKitPropertyIconsState createState() => UiKitPropertyIconsState();
}

class UiKitPropertyIconsState extends State<UiKitPropertyIcons> {
  final TextEditingController _textEditingController = TextEditingController();
  String? selectedIcon;

  void _onIconSelected(String iconPath, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedIcon = iconPath;
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
                hintText: widget.textFieldHintText,
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
                    iconData: ShuffleUiKitIcons.download,
                    color: ColorsFoundation.primary200,
                  ),
                  onPressed: widget.onPressed,
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
                mainAxisSpacing: EdgeInsetsFoundation.all16,
              ),
              itemCount: widget.listIconPath.length,
              itemBuilder: (context, index) {
                return HoverableImageWidget(
                  iconPath: widget.listIconPath[index],
                  isSelected: selectedIcon == widget.listIconPath[index],
                  onSubmit: (isSelected) {
                    _onIconSelected(widget.listIconPath[index], isSelected);
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
  final String iconPath;
  final bool isSelected;

  const HoverableImageWidget({
    super.key,
    required this.iconPath,
    required this.onSubmit,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSelected ? ColorsFoundation.info : Colors.transparent;
    final iconColor = isSelected ? Colors.white : ColorsFoundation.lightBodyTypographyColor;

    return GestureDetector(
      onTap: () {
        onSubmit(!isSelected);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadiusFoundation.all4,
        ),
        child: ImageWidget(
          link: iconPath,
          color: iconColor,
        ),
      ),
    );
  }
}
