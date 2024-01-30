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
    Key? key,
    required this.title,
    this.height = 40,
    this.active = true,
    this.group,
    this.customValue,
  })  : child = null,
        super(key: key);

  const UiKitCustomTab.icon({
    Key? key,
    this.height = 40,
    this.active = true,
    this.child,
  })  : title = '',
        customValue = '',
        group = null,
        super(key: key);

  factory UiKitCustomTab.small({
    required String title,
    double height = 24,
    AutoSizeGroup? group,
  }) =>
      UiKitCustomTab(
        title: title,
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
