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
  }) : child = null;

  const UiKitCustomTab.icon({
    super.key,
    this.height = 40,
    this.active = true,
    this.child,
    this.customValue,
    this.group,
  }) : title = '';

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

  factory UiKitCustomTab.fromDataClass({
    required CustomTabData data,
    Widget? child,
  }) {
    if (child == null) {
      return UiKitCustomTab(
        title: data.title,
        height: data.height,
        group: data.group,
        active: data.active,
        customValue: data.customValue,
      );
    }
    return UiKitCustomTab.icon(
      height: data.height,
      active: data.active,
      customValue: data.customValue,
      group: data.group,
      child: child,
    );
  }

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

class CustomTabData {
  final String title;
  final double height;
  final AutoSizeGroup? group;
  final bool active;
  final String? customValue;

  const CustomTabData({
    required this.title,
    this.height = 40,
    this.group,
    this.active = true,
    this.customValue,
  });

  CustomTabData copyWith({
    String? title,
    double? height,
    AutoSizeGroup? group,
    bool? active,
    String? customValue,
  }) {
    return CustomTabData(
      title: title ?? this.title,
      height: height ?? this.height,
      group: group ?? this.group,
      active: active ?? this.active,
      customValue: customValue ?? this.customValue,
    );
  }
}
