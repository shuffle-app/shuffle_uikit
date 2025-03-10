import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPlannerContentCard extends StatefulWidget {
  final DateTime? dateTime;
  final List<UiKitTag> tags;
  final String contentTitle;
  final String avatarPath;
  final VoidCallback onTap;
  final VoidCallback? onNotification;
  final bool showNotificationSet;

  const UiKitPlannerContentCard(
      {super.key,
      this.dateTime,
      required this.tags,
      required this.contentTitle,
      required this.avatarPath,
      required this.onTap,
      this.onNotification,
      this.showNotificationSet = false});

  @override
  State<UiKitPlannerContentCard> createState() => _UiKitPlannerContentCardState();
}

class _UiKitPlannerContentCardState extends State<UiKitPlannerContentCard> {
  bool showNotificationSetOverlay = false;

  @override
  void didUpdateWidget(covariant UiKitPlannerContentCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    showNotificationSetOverlay = false;
  }

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
        clipBehavior: Clip.none,
        color: cardColor,
        child: TapRegion(
          onTapOutside: (event) {
            setState(() => showNotificationSetOverlay = false);
          },
          child: InkWell(
            borderRadius: BorderRadiusFoundation.all24,
            onTap: () {
              widget.onTap.call();
              setState(() => showNotificationSetOverlay = false);
            },
            onLongPress: (widget.dateTime != null && widget.dateTime!.isAfter(DateTime.now()))
                ? () {
                    setState(() => showNotificationSetOverlay = true);
                  }
                : null,
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
                  ]).paddingAll(EdgeInsetsFoundation.all16),
                  if (widget.showNotificationSet)
                    Positioned(
                        right: -5,
                        top: -5,
                        child: GradientableWidget(
                            gradient: GradientFoundation.defaultLinearGradient,
                            child: Icon(
                              ShuffleUiKitIcons.bell,
                              color: Colors.white,
                            ))),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: showNotificationSetOverlay
                        ? ColoredBox(
                            color: ColorsFoundation.neutral48,
                            child: Center(
                              child: context
                                  .button(
                                    data: BaseUiKitButtonData(
                                        iconInfo: BaseUiKitButtonIconData(
                                          iconData: ShuffleUiKitIcons.bell,
                                          color: colorScheme?.inverseSurface,
                                        ),
                                        borderColor: colorScheme?.inverseSurface,
                                        onPressed: widget.onNotification,
                                        backgroundColor: ColorsFoundation.neutral8),
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
