import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class PlaceIconSelector extends StatelessWidget {
  final Function() onPressed;
  final List<IconData> listIconData;

  const PlaceIconSelector({
    super.key,
    required this.onPressed,
    required this.listIconData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.current.Icon,
                  style: context.uiKitTheme?.regularTextTheme.body,
                ),
                DecoratedBox(
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
                        size: 16.sp
                      ),
                      onPressed: onPressed,
                    ),
                  ),
                ),
              ],
            ),
            SpacingFoundation.verticalSpace10,
            UiKitInputFieldNoIcon(
              borderRadius: BorderRadiusFoundation.all12,
              controller: TextEditingController(),
              fillColor: ColorsFoundation.lightSurface4,
              textColor: context.uiKitTheme?.colorScheme.bodyTypography,
            ),
          ],
        ),
        Container(
          width: double.maxFinite,
          height: 0.4.sh,
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
              itemCount: listIconData.length,
              itemBuilder: (context, index) {
                return HoverableIconButton(
                  iconData: listIconData[index],
                  onTap: () {},
                );
              },
            ).paddingAll(EdgeInsetsFoundation.all8),
          ).paddingAll(EdgeInsetsFoundation.all8),
        ).paddingSymmetric(vertical: SpacingFoundation.verticalSpacing20)
      ],
    );
  }
}

class HoverableIconButton extends StatefulWidget {
  final Function() onTap;
  final IconData iconData;

  const HoverableIconButton({
    super.key,
    required this.iconData,
    required this.onTap,
  });

  @override
  _HoverableIconButtonState createState() => _HoverableIconButtonState();
}

class _HoverableIconButtonState extends State<HoverableIconButton> {
  Color _backgroundColor = Colors.transparent;
  Color _iconColor = const Color(0xff2D3645);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _backgroundColor = const Color(0xFF0A84FF);
          _iconColor = Colors.white;
        });
      },
      onExit: (_) {
        setState(() {
          _backgroundColor = Colors.transparent;
          _iconColor = const Color(0xff2D3645);
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: context.boxIconButton(
          data: BaseUiKitButtonData(
            backgroundColor: _backgroundColor,
            iconInfo: BaseUiKitButtonIconData(
              iconData: widget.iconData,
              color: _iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
