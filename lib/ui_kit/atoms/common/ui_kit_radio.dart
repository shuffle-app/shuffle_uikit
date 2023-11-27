import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitRadio extends StatefulWidget {
  final bool selected;

  const UiKitRadio({
    super.key,
    this.selected = false,
  });

  @override
  State<UiKitRadio> createState() => _UiKitRadioState();
}

class _UiKitRadioState extends State<UiKitRadio> {
  bool _selected = false;
  final offKey = UniqueKey();
  final onKey = UniqueKey();

  @override
  void initState() {
    _selected = widget.selected;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant UiKitRadio oldWidget) {
    _selected = widget.selected;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 125),
      transitionBuilder: (child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
      child: _selected
          ? ImageWidget(
              key: onKey,
              iconData: ShuffleUiKitIcons.filledRadio,
            )
          : ImageWidget(
              key: offKey,
              iconData: ShuffleUiKitIcons.emptyRadio,
            ),
    );

    // if (_selected) {
    //   return ImageWidget(
    //     iconData: ShuffleUiKitIcons.filledRadio,
    //   );
    // }
    //
    // return ImageWidget(
    //   iconData: ShuffleUiKitIcons.emptyRadio,
    // );
  }
}
