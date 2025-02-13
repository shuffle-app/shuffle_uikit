import 'package:flutter/material.dart';

class ReactionStatisticUiModel {
  final ValueNotifier<int?>? viewCount;
  final ValueNotifier<int?>? likeCount;

  ReactionStatisticUiModel({
    this.viewCount,
    this.likeCount,
  });
}
