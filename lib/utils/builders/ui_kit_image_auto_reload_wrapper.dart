import 'package:flutter/material.dart';

class UiKitImageAutoReloadWrapper extends InheritedWidget {
  @override
  Widget get child => SizedBox(key: _imageKey, child: super.child);

  ValueKey<bool> _imageKey = const ValueKey<bool>(true);

  UiKitImageAutoReloadWrapper({
    Key? key,
    required super.child,
  }) : super(key: key);

  static UiKitImageAutoReloadWrapper? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UiKitImageAutoReloadWrapper>();
  }

  void reloadImage() {
    _imageKey = ValueKey<bool>(!_imageKey.value);
  }

  @override
  bool updateShouldNotify(covariant UiKitImageAutoReloadWrapper oldWidget) {
    return false;
  }
}
