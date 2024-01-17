import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BadgedPremiumUserTile extends BadgedBaseUserTile {
  const BadgedPremiumUserTile({
    super.key,
    Key? badgeKey,
    required super.data,
  }) : super(
          badge: const PremiumMemberPlate(),
          avatarBorder: const Border(
            top: BorderSide(color: Colors.white, width: 2),
            right: BorderSide(color: Colors.white, width: 2),
            bottom: BorderSide(color: Colors.white, width: 2),
            left: BorderSide(color: Colors.white, width: 2),
          ),
        );
}
