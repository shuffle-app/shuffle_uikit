import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class PlaceActionCard extends StatelessWidget {
  final String title;
  final String value;
  final Widget icon;
  final VoidCallback? action;

  const PlaceActionCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.uiKitTheme?.boldTextTheme.caption1Medium.copyWith(color: ColorsFoundation.solidGreyText);
    final valueStyle = context.uiKitTheme?.boldTextTheme.body.copyWith(color: Colors.white);
    return CardWrapper(
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: titleStyle,
              ),
              SpacingFoundation.verticalSpace2,
              Text(
                value,
                style: valueStyle,
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: icon,
          ),
          context.button(
            text: 'See more',
            small: true,
            onPressed: action,
          ),
        ],
      ).paddingAll(EdgeInsetsFoundation.all12),
    );
  }
}

class UpcomingEventPlaceActionCard extends PlaceActionCard {
  const UpcomingEventPlaceActionCard({
    super.key,
    required super.title,
    required super.value,
    required super.icon,
    required super.action,
  });
}

class PointBalancePlaceActionCard extends PlaceActionCard {
  const PointBalancePlaceActionCard({
    super.key,
    required super.title,
    required super.value,
    required super.icon,
    required super.action,
  });
}
