import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BadgedInfluncerUserTile extends BadgedBaseUserTile {
  const BadgedInfluncerUserTile({
    super.key,
    required super.data,
  }) : super(
          badge: const InfluencerMemberPlate(),
          avatarBorder: const Border(),
        );
}
