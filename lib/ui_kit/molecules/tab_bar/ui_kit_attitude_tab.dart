import 'package:flutter/material.dart';

class UiKitAttitudeTab extends StatelessWidget {
  final String title;
  final double height;

  const UiKitAttitudeTab({
    Key? key,
    required this.title,
    this.height = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: height,
      child: Text(
        title,
      ),
    );
  }
}
