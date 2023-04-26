import 'package:flutter/material.dart';

class CircularAvatar extends StatelessWidget {
  final String avatarUrl;
  const CircularAvatar({Key? key, required this.avatarUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        avatarUrl,
        package: 'shuffle_uikit',
        fit: BoxFit.cover,
      ),
    );
  }
}
