import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OrdinaryUserTile extends BaseUserTile {
  const OrdinaryUserTile({
    super.key,
    super.name,
    super.avatarUrl,
    super.username,
    super.onTap,
  }) : super(
          avatarBorder: const Border(
            top: BorderSide(color: Colors.white, width: 2),
            right: BorderSide(color: Colors.white, width: 2),
            bottom: BorderSide(color: Colors.white, width: 2),
            left: BorderSide(color: Colors.white, width: 2),
          ),
        );
}
