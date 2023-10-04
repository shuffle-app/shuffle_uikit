import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitUserTileWithCheckbox extends StatefulWidget {
  const UiKitUserTileWithCheckbox({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onCheckboxTap,
    required this.rating,
    required this.avatarLink,
    this.isSelected = false,
    this.date,
    this.handShake,
  }) : assert((rating >= 0 && rating <= 7), 'Rating must be between 7 and 0 points.');

  final int rating;
  final String title;
  final String subtitle;
  final String avatarLink;
  final bool isSelected;
  final VoidCallback onCheckboxTap;
  final DateTime? date;
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
        widget.onCheckboxTap.call();
      },
      child: Row(
        children: [
          UiKitCheckbox(isActive: _isSelected, borderColor: theme?.colorScheme.surface5),
          SpacingFoundation.horizontalSpace12,
          Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 45.h, maxWidth: 40.w),
                child: Stack(
                  children: [
                    BorderedUserCircleAvatar(imageUrl: widget.avatarLink),
                    if (widget.handShake != null)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        height: 12.h,
                        width: 12.w,
                        child: GradientableWidget(
                          gradient: GradientFoundation.defaultLinearGradient,
                          child: ImageWidget(
                            svgAsset: GraphicsFoundation.instance.svg.handShake,
                            color: Colors.white,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SpacingFoundation.verticalSpace2,
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 4.h, maxWidth: 45.w),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) => SpacingFoundation.horizontalSpace2,
                  itemCount: 7,
                  itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadiusFoundation.max,
                    child: widget.rating >= index + 1
                        ? GradientableWidget(
                            gradient: GradientFoundation.defaultLinearGradient,
                            child: SizedBox(
                              height: 4.h,
                              width: 4.w,
                              child: const ColoredBox(color: Colors.white),
                            ),
                          )
                        : SizedBox(
                            height: 4.h,
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
                        style: theme?.boldTextTheme.caption1Medium,
                      ),
                    ],
                  ],
                ),
                Text(
                  widget.subtitle,
                  style: theme?.boldTextTheme.caption1Medium.copyWith(
                    color: theme.colorScheme.darkNeutral900,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
