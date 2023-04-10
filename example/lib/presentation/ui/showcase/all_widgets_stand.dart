import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AllWidgetsStand extends StatefulWidget {
  const AllWidgetsStand({super.key});

  @override
  State<AllWidgetsStand> createState() => _AllWidgetsStandState();
}

class _AllWidgetsStandState extends State<AllWidgetsStand> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Shuffle UI Kit Showcase Stand',
        centerTitle: true,
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.5,
        ),
        children: [
          UiKitInputFieldRightIcon(
            controller: _controller,
          ),
          UiKitInputFieldLeftIcon(
            controller: _controller,
          ),
          UiKitInputFieldNoIcon(
            controller: _controller,
          ),
          UiKitInputFieldNoIconCompact(
            controller: _controller,
          ),
          UiKitInputFieldNoFill(
            controller: _controller,
          ),
        ],
      ),
    );
  }
}
