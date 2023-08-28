import 'package:flutter/material.dart';

extension SliverExtention on Widget {
  Widget get wrapSliverBox => SliverToBoxAdapter(child: this);

  // Widget get wrapSliverFillViewport => SliverFillViewport(delegate: SliverChildBuilderDelegate() this);
  Widget get wrapSliverFillRemaining =>
      SliverFillRemaining(hasScrollBody: true, child: this);
}
