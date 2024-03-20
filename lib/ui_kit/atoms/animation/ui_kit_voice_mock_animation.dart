import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitVoiceMockAnimation extends StatefulWidget {
  const UiKitVoiceMockAnimation({Key? key}) : super(key: key);

  @override
  State<UiKitVoiceMockAnimation> createState() => _UiKitVoiceMockAnimationState();
}

class _UiKitVoiceMockAnimationState extends State<UiKitVoiceMockAnimation> {
  double decoratedButtonScale = 1.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 250), () {
        setState(() => decoratedButtonScale = 1.05);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      fit: StackFit.expand,
      children: [
        Positioned(
          top: -0.075.sh,
          left: 0.05.sw,
          child: SizedBox(
            child: AnimatedScale(
              duration: const Duration(milliseconds: 250),
              scale: decoratedButtonScale,
              child: UiKitGradientedDecoratedButton(
                iconPath: GraphicsFoundation.instance.svg.record.path,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0.05.sh,
          child: const Center(
            child: UiKitMockAudioWave(
              itemCount: 32,
              scrollable: true,
            ),
          ),
        ),
      ],
    );
  }
}
