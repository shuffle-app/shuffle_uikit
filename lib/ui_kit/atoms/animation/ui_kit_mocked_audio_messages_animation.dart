import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitMockedAudioMessagesAnimation extends StatefulWidget {
  const UiKitMockedAudioMessagesAnimation({Key? key}) : super(key: key);

  @override
  State<UiKitMockedAudioMessagesAnimation> createState() => _UiKitMockedAudioMessagesAnimationState();
}

class _UiKitMockedAudioMessagesAnimationState extends State<UiKitMockedAudioMessagesAnimation> {
  final animDuration = const Duration(milliseconds: 1000);
  double topTileOffset = 1.sw;
  double bottomTileOffset = 0.5.sh;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        topTileOffset = SpacingFoundation.horizontalSpacing32;
        bottomTileOffset =
            SpacingFoundation.verticalSpacing32 + 48.w + EdgeInsetsFoundation.all4 + SpacingFoundation.verticalSpacing24;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: animDuration,
          top: SpacingFoundation.verticalSpacing32,
          left: topTileOffset,
          child: _UiKitMockedAudioMessageTile(),
        ),
        AnimatedPositioned(
          duration: animDuration,
          left: SpacingFoundation.horizontalSpacing32,
          top: bottomTileOffset,
          child: _UiKitMockedAudioMessageTile(),
        ),
      ],
    );
  }
}

class _UiKitMockedAudioMessageTile extends StatelessWidget {
  const _UiKitMockedAudioMessageTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return UiKitCardWrapper(
      borderRadius: BorderRadiusFoundation.max,
      padding: EdgeInsets.all(EdgeInsetsFoundation.all4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 48.w,
            width: 48.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
            ),
            child: Center(
              child: ImageWidget(
                iconData: ShuffleUiKitIcons.playfill,
                color: Colors.white,
                height: 20.h,
              ),
            ),
          ),
          SpacingFoundation.horizontalSpace12,
          UiKitMockAudioWave(
            itemCount: 20,
            spacing: 2,
            color: ColorsFoundation.darkNeutral700,
            availableWidth: 0.4.sw,
            scrollable: false,
          ),
          SpacingFoundation.horizontalSpace12,
          Text(
            '1:15',
            style: boldTextTheme?.caption1Medium.copyWith(color: ColorsFoundation.darkNeutral700),
          ),
        ],
      ),
    );
  }
}
