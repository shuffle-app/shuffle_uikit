import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class PlaceIconSelector extends StatelessWidget {
  final VoidCallback? onPressed;
  final List<String> listIconData;
  final ValueChanged<String> onIconTap;
  final ScrollController iconsScrollController;
  final TextEditingController iconTextController;

  const PlaceIconSelector({
    super.key,
    required this.onPressed,
    required this.listIconData,
    required this.onIconTap,
    required this.iconsScrollController,
    required this.iconTextController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.current.Icon,
              style: theme?.regularTextTheme.body,
            ),
            context.boxIconButton(
              data: BaseUiKitButtonData(
                fit: ButtonFit.hugContent,
                backgroundColor: ColorsFoundation.primary200.withOpacity(0.4),
                iconInfo: BaseUiKitButtonIconData(
                    iconPath: GraphicsFoundation.instance.svg.download.path,
                    color: ColorsFoundation.primary200,
                    size: 16),
                onPressed: onPressed,
              ),
            ),
          ],
        ),
        SpacingFoundation.verticalSpace10,
        UiKitInputFieldNoIcon(
          borderRadius: BorderRadiusFoundation.all12,
          controller: iconTextController,
          fillColor: theme?.colorScheme.surface2,
          textColor: theme?.colorScheme.bodyTypography,
        ),
        SizedBox(
          width: double.maxFinite,
          height: 0.35.sh,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme?.colorScheme.surface2,
              borderRadius: BorderRadiusFoundation.all12,
            ),
            child: GridView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsetsDirectional.zero,
              addAutomaticKeepAlives: false,
              controller: iconsScrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: EdgeInsetsFoundation.all16,
              ),
              children: listIconData
                  .map((icon) => InkWell(
                            onTap: () {
                              onIconTap.call(
                                icon,
                              );
                            },
                            child: ImageWidget(
                              link: icon,
                              color: theme?.colorScheme.inversePrimary,
                            ),
                          )
                      //   HoverableIconButton(
                      //   iconLink: listIconData[index],
                      //   onTap: () {
                      //     onIconTap.call(
                      //       listIconData[index],
                      //     );
                      //   },
                      // );

                      )
                  .toList(),
            ).paddingAll(EdgeInsetsFoundation.all8),
          ).paddingAll(EdgeInsetsFoundation.all8),
        ).paddingSymmetric(vertical: SpacingFoundation.verticalSpacing20)
      ],
    );
  }
}

class HoverableIconButton extends StatefulWidget {
  final VoidCallback onTap;
  final String iconLink;

  const HoverableIconButton({
    super.key,
    required this.iconLink,
    required this.onTap,
  });

  @override
  State<HoverableIconButton> createState() => _HoverableIconButtonState();
}

class _HoverableIconButtonState extends State<HoverableIconButton> {
  bool isHover = false;
  final Color _iconColor = const Color(0xff2D3645);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onTap,
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: Ink(
          child: ImageWidget(
            link: widget.iconLink,
            width: 24,
            height: 24,
            color: isHover ? _iconColor : Colors.transparent,
          ),
        ),
      ),
    );
  }
}
