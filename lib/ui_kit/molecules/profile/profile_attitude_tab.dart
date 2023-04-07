import 'package:flutter/material.dart';

class ProfileAttitudeTab extends StatelessWidget {
  final String title;

  const ProfileAttitudeTab({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        title,
      ),
    );
  }
}
