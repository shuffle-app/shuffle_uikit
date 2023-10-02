import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BadgedPremiumUserTile extends BadgedBaseUserTile {
  const BadgedPremiumUserTile({
    Key? key,
    required super.data,
  }) : super(
          badge: const PremiumUserBadge(),
        );
}
