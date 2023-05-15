import 'package:flutter/material.dart';

extension SliverExtention on Widget {
  Widget get wrapSliverBox => SliverToBoxAdapter(child: this);
}
