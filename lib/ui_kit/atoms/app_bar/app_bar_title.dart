import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String title;
  final bool centerTitle;

  const AppBarTitle({
    Key? key,
    required this.title,
    this.centerTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineLarge,
        textAlign: centerTitle ? TextAlign.center : TextAlign.left,
      ),
    );
  }
}
