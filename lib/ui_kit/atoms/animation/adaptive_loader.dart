import 'package:flutter/material.dart';

class AdaptiveLoader extends StatelessWidget {
  const AdaptiveLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive());
  }
}
