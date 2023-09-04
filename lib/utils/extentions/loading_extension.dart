import 'package:flutter/cupertino.dart';

extension LoadingExtension on Widget {
  Widget loadingWrap(bool active, {Color? color, double? opacity}) {
    if (!active) return this;

    return Stack(
      fit: StackFit.passthrough,
      alignment: Alignment.center,
      children: [
        Opacity(opacity: opacity ?? 0, child: this),
        SizedBox(
          width: 20,
          height: 20,
          child: CupertinoActivityIndicator(
            color: color ?? CupertinoColors.black,
          ),
        ),
      ],
    );
  }
}
