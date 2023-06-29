import 'package:flutter/material.dart';

class SingleWidgetViewPage extends StatelessWidget {
  const SingleWidgetViewPage({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget,
    );
  }
}
