import 'package:flutter/material.dart';

class ProfileAttitudeTab extends StatelessWidget {
  final String title;
  final double height;

  const ProfileAttitudeTab({
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
