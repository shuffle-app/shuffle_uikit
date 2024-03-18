import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMockAudioWave extends StatefulWidget {
  final int itemCount;
  final Color? color;
  final double? spacing;
  final double? availableWidth;
  final bool? scrollable;

  UiKitMockAudioWave({
    Key? key,
    required this.itemCount,
    this.color,
    this.spacing,
    this.availableWidth,
    this.scrollable,
  }) : super(key: key);

  @override
  State<UiKitMockAudioWave> createState() => _UiKitMockAudioWaveState();
}

class _UiKitMockAudioWaveState extends State<UiKitMockAudioWave> {
  final height = 72.0;

  final Random random = Random();

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 1), () {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 1),
          curve: Curves.linear,
        );
      });
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: widget.availableWidth ?? 1.sw,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        itemCount: widget.itemCount,
        physics: widget.scrollable == true ? const ClampingScrollPhysics() : const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => widget.spacing?.widthBox ?? SpacingFoundation.horizontalSpace8,
        itemBuilder: (context, index) {
          final randomHeight = (0.25 + random.nextDouble()) * (height - (height * 0.25));

          return Center(
            child: Container(
              width: 4,
              height: max(10, randomHeight),
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: widget.color,
                gradient: widget.color != null ? null : GradientFoundation.defaultLinearGradient,
                borderRadius: BorderRadiusFoundation.max,
              ),
            ),
          );
        },
      ),
    );
  }
}
