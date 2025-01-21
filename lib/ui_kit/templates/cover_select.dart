import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:video_editor/src/models/cover_data.dart';

class CoverSelect extends StatelessWidget {
  final List<CoverData> covers;
  final Function(CoverData?) onCoverSelected;
  final CoverData? selectedCover;
  final VoidCallback onNextPressed;
  final VoidCallback onBackPressed;

  const CoverSelect(
      {super.key,
      required this.covers,
      required this.onCoverSelected,
      required this.onBackPressed,
      this.selectedCover,
      required this.onNextPressed});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;
    return SafeArea(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            context.smallOutlinedButton(
              data: BaseUiKitButtonData(
                text: S.current.Back,
                onPressed: onBackPressed,
                iconInfo: BaseUiKitButtonIconData(
                  iconData: ShuffleUiKitIcons.chevronleft,
                  iconAlignment: Alignment.centerLeft,
                ),
              ),
            ),
            context.smallButton(
              data: BaseUiKitButtonData(
                text: S.current.Next,
                onPressed: onNextPressed,
                iconInfo: BaseUiKitButtonIconData(
                  iconData: ShuffleUiKitIcons.chevronright,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
            width: 0.44.sw,
            height: 0.35.sh,
            child: Stack(fit: StackFit.expand, clipBehavior: Clip.none, alignment: Alignment.center, children: [
              UiKitCardWrapper(
                  borderRadius: BorderRadiusFoundation.all12,
                  clipBehavior: Clip.none,
                  border: BorderSide(width: 1, color: (colorScheme?.inversePrimary ?? Colors.white).withOpacity(0.3)),
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Center(
                          child: Text(
                        S.current.SelectType(S.current.Cover),
                        textAlign: TextAlign.center,
                        style: theme?.boldTextTheme.body.copyWith(color: ColorsFoundation.darkNeutral900),
                      )),
                      if (selectedCover != null)
                        ImageWidget(
                          width: double.infinity,
                          height: double.infinity,
                          imageBytes: selectedCover!.thumbData,
                          fit: BoxFit.cover,
                        ),
                    ],
                  )),
              if (selectedCover != null)
                Positioned(
                    top: -5,
                    right: -5,
                    child: context.outlinedButton(
                      hideBorder: true,
                      data: BaseUiKitButtonData(
                        onPressed: () => onCoverSelected.call(null),
                        iconInfo: BaseUiKitButtonIconData(
                          iconData: ShuffleUiKitIcons.x,
                          size: 10,
                        ),
                      ),
                    )),
            ]).paddingAll(EdgeInsetsFoundation.all16)),
        SizedBox(
            width: 1.sw,
            height: 0.5.sh,
            child: ColoredBox(
                color: colorScheme?.surface1 ?? ColorsFoundation.surface1,
                child: SingleChildScrollView(
                  child: Wrap(
                    // alignment: WrapAlignment.spaceAround,
                    spacing: SpacingFoundation.horizontalSpacing2,
                    runSpacing: SpacingFoundation.horizontalSpacing2,
                    children: covers
                        .map((e) => SizedBox(
                              width: 46.w,
                              height: 78.h,
                              child: ClipRRect(
                                  borderRadius: BorderRadiusFoundation.all4,
                                  clipBehavior: Clip.hardEdge,
                                  child: InkWell(
                                      borderRadius: BorderRadiusFoundation.all4,
                                      onTap: () => onCoverSelected.call(e),
                                      child: Stack(fit: StackFit.expand, alignment: Alignment.center, children: [
                                        ImageWidget(
                                          imageBytes: e.thumbData,
                                          fit: BoxFit.cover,
                                        ),
                                        if (e.timeMs == selectedCover?.timeMs)
                                          ColoredBox(
                                            color: Colors.black38,
                                            child: Icon(
                                              ShuffleUiKitIcons.checkcircle,
                                              color: Colors.white,
                                              size: 40.sp,
                                            ),
                                          )
                                      ]))),
                            ))
                        .toList(),
                  ),
                )))
      ],
    ).paddingAll(EdgeInsetsFoundation.all16));
  }
}
