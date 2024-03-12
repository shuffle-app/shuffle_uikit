import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class BaseUiKitSwiperCard extends StatelessWidget {
  final int id;
  final String title;
  final String subtitle;
  final String? imageLink;
  final List<UiKitTagWidget> tags;
  final VoidCallback? onTap;
  final int? pointsToGain;

  const BaseUiKitSwiperCard({
    Key? key,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.tags,
    this.imageLink,
    this.pointsToGain,
    this.onTap,
  }) : super(key: key);
}
