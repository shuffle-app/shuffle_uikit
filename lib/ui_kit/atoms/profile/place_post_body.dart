import 'package:flutter/material.dart';

class PlacePostBody extends StatelessWidget {
  final String text;

  const PlacePostBody({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
