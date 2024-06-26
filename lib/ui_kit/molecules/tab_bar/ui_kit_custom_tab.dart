import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class UiKitCustomTab extends StatelessWidget {
  final String title;
  final double height;
  final AutoSizeGroup? group;
  final bool active;
  final String? customValue;
  final Widget? child;

  const UiKitCustomTab({
    super.key,
    required this.title,
    this.height = 40,
    this.active = true,
    this.group,
    this.customValue,
  })  : child = null;

  const UiKitCustomTab.icon({
    super.key,
    this.height = 40,
    this.active = true,
    this.child,
    this.customValue,
  })  : title = '',
        group = null;

  factory UiKitCustomTab.small({
    required String title,
    String? customValue,
    double height = 24,
    AutoSizeGroup? group,
  }) =>
      UiKitCustomTab(
        title: title,
        customValue: customValue,
        height: height,
        group: group,
      );

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: height,
      child: Opacity(
          opacity: active ? 1.0 : 0.5,
          child: Center(
            child: child ??
                (group != null
                    ? AutoSizeText(
                        title,
                        maxLines: 1,
                        group: group,
                      )
                    : Text(title)),
          )),
    );
  }
}
