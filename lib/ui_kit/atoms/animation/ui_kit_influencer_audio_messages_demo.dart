import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInfluencerAudioMessagesDemo extends StatefulWidget {
  const UiKitInfluencerAudioMessagesDemo({Key? key}) : super(key: key);

  @override
  State<UiKitInfluencerAudioMessagesDemo> createState() => _UiKitInfluencerAudioMessagesDemoState();
}

class _UiKitInfluencerAudioMessagesDemoState extends State<UiKitInfluencerAudioMessagesDemo> {
  bool showAudioTiles = false;
  final animDuration = const Duration(milliseconds: 250);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((time) {
      Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
        setState(() => showAudioTiles = true);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.3.sh,
      width: 0.85.sw,
      child: Center(
        child: AnimatedSwitcher(
          duration: animDuration,
          child: showAudioTiles ? const UiKitMockedAudioMessagesAnimation() : const UiKitVoiceMockAnimation(),
        ),
      ),
    );
  }
}
