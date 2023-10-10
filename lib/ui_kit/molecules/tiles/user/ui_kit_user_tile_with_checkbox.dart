import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitUserTileWithCheckbox extends StatefulWidget {
  const UiKitUserTileWithCheckbox({
    super.key,
    required this.title,
    required this.onTap,
    required this.rating,
    required this.avatarLink,
    this.isSelected = false,
    this.date,
    this.subtitle,
    this.handShake,
  }) : assert((rating >= 0 && rating <= 7), 'Rating must be between 7 and 0 points.');

  final int rating;
  final String title;
  final String avatarLink;
  final bool isSelected;
  final VoidCallback onTap;
  final DateTime? date;
  final String? subtitle;
  final bool? handShake;

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
        setState(() => _isSelected = !_isSelected);
        if (_isSelected) {
          widget.onTap.call();
        }
      },
      child: Row(
        children: [
          UiKitCheckbox(isActive: _isSelected, borderColor: theme?.colorScheme.surface5),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpacingFoundation.horizontalSpace12,
                Column(
                  children: [
                    Stack(
                      children: [
                        BorderedUserCircleAvatar(imageUrl: widget.avatarLink, size: 45.w),
                        if (widget.handShake != null)
                          Positioned(
                            bottom: 0,
                            right: 0,
                            height: 15.h,
                            width: 15.w,
                            child: GradientableWidget(
                              gradient: GradientFoundation.defaultLinearGradient,
                              child: ImageWidget(
                                svgAsset: GraphicsFoundation.instance.svg.handShake2,
                                color: Colors.white,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      ],
                    ),
                    SpacingFoundation.verticalSpace2,
                    SizedBox(
                      height: 4.h,
                      width: 45.w,
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
                                    height: 4.w,
                                    width: 4.w,
                                    child: const ColoredBox(color: Colors.white),
                                  ),
                                )
                              : SizedBox(
                                  height: 4.w,
                                  width: 4.w,
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
                          Text(widget.title, style: theme?.boldTextTheme.caption1Bold),
                          if (widget.date != null) ...[
                            const Spacer(),
                            Text(
                              DateFormat('MMM dd').format(widget.date!),
                              style: theme?.boldTextTheme.caption1Medium.copyWith(
                                color: theme.colorScheme.darkNeutral100,
                              ),
                            ),
                          ],
                        ],
                      ),
                      if (widget.subtitle != null) ...[
                        SpacingFoundation.verticalSpace2,
                        Text(
                          widget.subtitle!,
                          style: theme?.boldTextTheme.caption1Medium.copyWith(
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
