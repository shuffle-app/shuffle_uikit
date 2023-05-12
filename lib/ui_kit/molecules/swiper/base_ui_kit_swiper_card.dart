import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class BaseUiKitSwiperCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imageLink;
  final List<UiKitTagWidget> tags;

  const BaseUiKitSwiperCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.tags,
    this.imageLink,
  }) : super(key: key);
}
