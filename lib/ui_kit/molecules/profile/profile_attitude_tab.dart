import 'package:flutter/material.dart';

class ProfileAttitudeTab extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ProfileAttitudeTab({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Tab(
        text: title,
      ),
    );
  }
}
