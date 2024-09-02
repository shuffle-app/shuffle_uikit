import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitUserTileWithCheckbox extends StatefulWidget {
  const UiKitUserTileWithCheckbox(
      {super.key,
      required this.name,
      required this.onTap,
      this.onDisabledTap,
      this.disableSelection = false,
      this.rating = 0,
      this.avatarLink,
      this.isSelected = false,
      this.date,
      this.subtitle,
      this.handShake,
      this.userTileType})
      : assert((rating >= 0 && rating <= 7), 'Rating must be between 7 and 0 points.');

  final int rating;
  final String name;
  final String? avatarLink;
  final UserTileType? userTileType;
  final bool isSelected;
  final ValueChanged<bool> onTap;
  final VoidCallback? onDisabledTap;
  final DateTime? date;
  final String? subtitle;
  final bool? handShake;
  final bool disableSelection;

  @override
  State<UiKitUserTileWithCheckbox> createState() => _UiKitUserTileWithCheckboxState();
}

class _UiKitUserTileWithCheckboxState extends State<UiKitUserTileWithCheckbox> {
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  @override
  void didUpdateWidget(covariant UiKitUserTileWithCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    _isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return GestureDetector(
      onTap: () {
        if (widget.disableSelection) {
          widget.onDisabledTap?.call();
          return;
        }
        setState(() => _isSelected = !_isSelected);
        widget.onTap.call(_isSelected);
      },
      child: Row(
        children: [
          UiKitCheckbox(
            isActive: _isSelected,
            borderColor: theme?.colorScheme.surface5,
            disabled: widget.disableSelection,
            disabledTapReaction: widget.onDisabledTap,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpacingFoundation.horizontalSpace12,
                Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        context.userAvatar(
                            size: UserAvatarSize.x48x48,
                            imageUrl: widget.avatarLink,
                            type: widget.userTileType ?? UserTileType.ordinary,
                            userName: widget.name),
                        if (widget.handShake != null)
                          Positioned(
                            bottom: -1,
                            right: 3,
                            child: DecoratedBox(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: UiKitColors.pinkDark.withOpacity(0.6),
                                    border: GradientFoundation.gradientBorder),
                                child: GradientableWidget(
                                  gradient: GradientFoundation.defaultLinearGradient,
                                  child: ImageWidget(
                                    iconData: ShuffleUiKitIcons.handshake2,
                                    color: Colors.white,
                                    fit: BoxFit.cover,
                                    height: 10.sp,
                                    width: 10.sp,
                                  ).paddingAll(3.sp),
                                )),
                          ),
                      ],
                    ),
                    SpacingFoundation.verticalSpace2,
                    SizedBox(
                      height: 4.r,
                      width: 47.w,
                      child: ListView.separated(
                        padding: EdgeInsets.only(left: EdgeInsetsFoundation.all2),
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (_, __) => SpacingFoundation.horizontalSpace2,
                        itemCount: 7,
                        itemBuilder: (_, index) => ClipRRect(
                          borderRadius: BorderRadiusFoundation.max,
                          child: widget.rating >= index + 1
                              ? GradientableWidget(
                                  gradient: GradientFoundation.defaultLinearGradient,
                                  child: SizedBox(
                                    height: 4.r,
                                    width: 4.r,
                                    child: const ColoredBox(color: Colors.white),
                                  ),
                                )
                              : SizedBox(
                                  height: 4.r,
                                  width: 4.r,
                                  child: ColoredBox(color: theme!.colorScheme.darkNeutral500),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
                SpacingFoundation.horizontalSpace12,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(widget.name, style: theme?.boldTextTheme.caption1Bold),
                          if (widget.date != null) ...[
                            const Spacer(),
                            Text(
                              DateFormat('MMM dd').format(widget.date!),
                              style: theme?.boldTextTheme.caption1Medium.copyWith(
                                color: theme.colorScheme.bodyTypography,
                              ),
                            ),
                          ],
                        ],
                      ),
                      if (widget.subtitle != null) ...[
                        SpacingFoundation.verticalSpace2,
                        Text(
                          widget.subtitle!,
                          style: theme?.regularTextTheme.caption3.copyWith(
                            color: theme.colorScheme.darkNeutral900,
                          ),
                        )
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
