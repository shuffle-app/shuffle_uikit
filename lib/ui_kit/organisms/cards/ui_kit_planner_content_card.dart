import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPlannerContentCard extends StatefulWidget {
  final DateTime? dateTime;
  final List<UiKitTag> tags;
  final String contentTitle;
  final String avatarPath;
  final VoidCallback onTap;
  final VoidCallback? onDelete;
  final VoidCallback? onSwipe;

  //TODO add notification icon and actions

  const UiKitPlannerContentCard(
      {super.key,
      this.dateTime,
      required this.tags,
      required this.contentTitle,
      required this.avatarPath,
      required this.onTap,
      this.onDelete,
      this.onSwipe});

  @override
  State<UiKitPlannerContentCard> createState() => _UiKitPlannerContentCardState();
}

class _UiKitPlannerContentCardState extends State<UiKitPlannerContentCard> {
  bool canDelete = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final boldTextTheme = theme?.boldTextTheme;
    final regularTextTheme = theme?.regularTextTheme;
    final colorScheme = theme?.colorScheme;
    final cardColor = theme?.colorScheme.surface1;

    return SizedBox(
      height: 0.375 * 0.9.sw,
      width: 1.sw - EdgeInsetsFoundation.horizontal32,
      child: UiKitCardWrapper(
        borderRadius: BorderRadiusFoundation.all24,
        clipBehavior: Clip.hardEdge,
        color: cardColor,
        padding: EdgeInsets.all(EdgeInsetsFoundation.all16),
        child: TapRegion(
          onTapOutside: (event) {
            setState(() => canDelete = false);
          },
          child: InkWell(
            onTap: () {
              widget.onTap.call();
              setState(() => canDelete = false);
            },
            onLongPress: () {
              setState(() => canDelete = true);
            },
            child: Ink(
              child: Stack(
                children: [
                  Column(children: [
                    if (widget.dateTime != null)
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        Transform.translate(
                            offset: const Offset(0, -2),
                            child: GradientableWidget(
                                gradient: GradientFoundation.defaultLinearGradient,
                                child: ImageWidget(
                                  iconData: ShuffleUiKitIcons.calendar,
                                  height: boldTextTheme?.caption1Bold.height,
                                  fit: BoxFit.fitHeight,
                                ))),
                        SpacingFoundation.horizontalSpace4,
                        Text(
                          DateFormat('EEEE, dd.MM.yyyy').format(widget.dateTime!),
                          style: boldTextTheme?.caption1Bold.copyWith(overflow: TextOverflow.ellipsis),
                          maxLines: 1,
                        ),
                        const Spacer(),
                        Text(
                          DateFormat('HH:mm').format(widget.dateTime!),
                          style: regularTextTheme?.caption4.copyWith(
                            color: colorScheme?.darkNeutral900,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ]).paddingOnly(bottom: SpacingFoundation.verticalSpacing4),
                    SpacingFoundation.verticalSpace16,
                    Expanded(
                        child: Row(
                      children: [
                        context.userAvatar(
                          size: UserAvatarSize.x40x40,
                          type: UserTileType.ordinary,
                          userName: widget.contentTitle,
                          imageUrl: widget.avatarPath,
                        ),
                        SpacingFoundation.horizontalSpace12,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                widget.contentTitle,
                                style: boldTextTheme?.caption2Bold.copyWith(overflow: TextOverflow.ellipsis),
                                maxLines: 2,
                              ),
                            ),
                            SpacingFoundation.horizontalSpace4,
                            Row(
                                children: widget.tags
                                    .map((e) => e.widget.paddingOnly(right: SpacingFoundation.horizontalSpacing2))
                                    .toList())
                          ],
                        ),
                      ],
                    ))
                  ]),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: canDelete
                        ? ColoredBox(
                            color: ColorsFoundation.neutral48,
                            child: Center(
                              child: context
                                  .button(
                                    data: BaseUiKitButtonData(
                                      backgroundColor: colorScheme?.surface3,
                                      iconInfo: BaseUiKitButtonIconData(
                                        iconData: ShuffleUiKitIcons.trash,
                                        size: 18.h,
                                        color: colorScheme?.inverseSurface,
                                      ),
                                      borderColor: colorScheme?.inverseSurface,
                                      onPressed: widget.onDelete,
                                    ),
                                    // blurred: true,
                                  )
                                  .paddingSymmetric(vertical: EdgeInsetsFoundation.vertical24),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
