import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlurredBottomNavigationBar extends StatefulWidget {
  final ValueChanged<int> onItemSelected;
  final List<Widget> items;

  const BlurredBottomNavigationBar({
    Key? key,
    required this.onItemSelected,
    required this.items,
  }) : super(key: key);

  @override
  State<BlurredBottomNavigationBar> createState() => _BlurredBottomNavigationBarState();
}

class _BlurredBottomNavigationBarState extends State<BlurredBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        height: kBottomNavigationBarHeight.h,
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                color: Colors.red,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.yellow,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.greenAccent,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.tealAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
