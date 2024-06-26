import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitSwiperCardWrapper extends StatelessWidget implements BaseUiKitSwiperCard {
  final Widget child;
  final double? width;
  final VoidCallback? onTap;

  const UiKitSwiperCardWrapper({
    Key? key,
    required this.child,
    this.width,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: IgnorePointer(child: child),
    );
  }

  @override
  int get id => 0;

  @override
  String? get imageLink => null;

  @override
  int? get pointsToGain => null;

  @override
  String get subtitle => 'throw UnimplementedError()';

  @override
  List<UiKitTagWidget> get tags => [];

  @override
  // TODO: implement title
  String get title => 'throw UnimplementedError()';
}
