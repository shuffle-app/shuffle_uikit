import 'package:flutter/material.dart';

class UserCircleAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;
  final Border border;

  const UserCircleAvatar({
    Key? key,
    required this.imageUrl,
    required this.size,
    required this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: border,
      ),
      child: ClipOval(
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          package: 'shuffle_uikit',
        ),
      ),
    );
  }
}
