import 'package:flutter/material.dart';

extension SliverExt on Widget {
  Widget get wrapSliverBox => SliverToBoxAdapter(child: this);
}