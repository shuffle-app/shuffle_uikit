import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class BadgedProUserTile extends BadgedBaseUserTile {
  const BadgedProUserTile({
    super.key,
    required super.data,
  }) : super(
          badge: const ProMemberPlate(),
          avatarBorder: const Border(),
        );
}
