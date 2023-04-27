import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/tokens/assets.gen.dart';
import 'package:shuffle_uikit/ui_kit/atoms/profile/place_tag_widget.dart';

class PlaceStats extends StatelessWidget {
  final double? rating;
  final List<PlaceTag> tags;
  final ScrollController firstHalfController = ScrollController();
  late final ScrollController secondHalfController = ScrollController()
    ..addListener(() {
      firstHalfController.jumpTo(secondHalfController.offset);
    });

  PlaceStats({
    Key? key,
    this.rating,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (rating != null)
          CardWrapper(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageWidget(svgAsset: Assets.images.svg.star),
                SpacingFoundation.horizontalSpace8,
                Text(
                  rating.toString(),
                  style: theme?.boldTextTheme.caption1.copyWith(color: Colors.white),
                ),
              ],
            ).paddingSymmetric(
              horizontal: EdgeInsetsFoundation.horizontal16,
              vertical: EdgeInsetsFoundation.vertical12,
            ),
          ),
        SpacingFoundation.horizontalSpace8,
        Expanded(
          child: Builder(
            builder: (context) {
              final firstHalf = tags.sublist(0, (tags.length ~/ 2) - 1);
              final secondHalf = tags.sublist(tags.length ~/ 2);
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SingleChildScrollView(
                    controller: firstHalfController,
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 8.w,
                      children: firstHalf
                          .map((e) => PlaceTagWidget(
                                title: e.title,
                                icon: e.iconPath,
                                showGradient: e.matching,
                              ))
                          .toList(),
                    ),
                  ),
                  SpacingFoundation.verticalSpace4,
                  SingleChildScrollView(
                    controller: secondHalfController,
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 8.w,
                      children: secondHalf
                          .map((e) => PlaceTagWidget(
                                title: e.title,
                                icon: e.iconPath,
                                showGradient: e.matching,
                              ))
                          .toList(),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
