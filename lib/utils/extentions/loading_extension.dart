import 'package:flutter/material.dart';

extension LoadingExtension on Widget {
  Widget loadingWrap(bool active) {
    if (!active) return this;

    return Stack(
      fit: StackFit.passthrough,
      alignment: Alignment.center,
      children: [
        Opacity(opacity: 0.5, child: this),
        const SizedBox(
            width: 20, height: 20, child: CircularProgressIndicator.adaptive()),
      ],
    );
  }
}
