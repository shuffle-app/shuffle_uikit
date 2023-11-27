import 'package:shuffle_uikit/shuffle_uikit.dart';

class UpcomingEventPlaceActionCard extends BasePlaceActionCard {
  UpcomingEventPlaceActionCard({
    super.key,
    required super.value,
    super.rasterIconAsset,
    super.iconAsset,
    required super.action,
    super.group,
  }) : super(
          title: S.current.UpcomingEvent,
        );
}
