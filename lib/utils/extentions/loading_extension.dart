import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

extension LoadingExtension on Widget {
  Widget loadingWrap(bool active) {
    if (!active) return this;

    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(opacity: 0.5, child: this),
        // const GradientableWidget(
        //   gradient: GradientFoundation.defaultRadialGradient,
        //   child:
        const CircularProgressIndicator.adaptive(),
        // )
      ],
    );
  }
}
