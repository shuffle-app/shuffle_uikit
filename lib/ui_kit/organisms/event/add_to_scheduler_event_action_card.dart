import 'package:shuffle_uikit/localization/l10n.dart';
import 'package:shuffle_uikit/ui_kit/organisms/place/base_place_action_card.dart';

class AddToSchedulerEventActionCard extends BasePlaceActionCard {
  AddToSchedulerEventActionCard({
    super.key,
    required super.value,
    super.rasterIconAsset,
    super.buttonTitle,
    super.iconAsset,
    required super.action,
    super.group,
  }) : super(title: S.current.AddToScheduler);
}
