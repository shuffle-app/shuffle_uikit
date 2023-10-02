import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/molecules/tiles/user/badged_base_user_tile.dart';

class BadgedProUserTile extends BadgedBaseUserTile {
  const BadgedProUserTile({
    super.key,
    required super.data,
  }) : super(
          badge: const ProUserBadge(),
        );
}
