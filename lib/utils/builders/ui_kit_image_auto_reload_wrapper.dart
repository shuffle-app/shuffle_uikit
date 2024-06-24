import 'package:flutter/material.dart';

class UiKitImageAutoReloadWrapper extends InheritedWidget {
  @override
  Widget get child => SizedBox(key: _imageKey.value, child: super.child);

  final ValueNotifier<ValueKey<bool>> _imageKey = ValueNotifier(const ValueKey<bool>(true));

  UiKitImageAutoReloadWrapper({
    super.key,
    required super.child,
  });

  static UiKitImageAutoReloadWrapper? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UiKitImageAutoReloadWrapper>();
  }

  void reloadImage() {
    _imageKey.value = ValueKey<bool>(!_imageKey.value.value);
  }

  @override
  bool updateShouldNotify(covariant UiKitImageAutoReloadWrapper oldWidget) {
    return false;
  }
}
