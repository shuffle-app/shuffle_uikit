import 'package:flutter/cupertino.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class DonationMapPreview extends StatelessWidget {
  const DonationMapPreview({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Stack(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints.expand(height: 170.h),
            child: ImageWidget(
              rasterAsset: GraphicsFoundation.instance.png.mapMock,
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            child: Center(
              child: UiKitBlurWrapper(
                border: const Border.fromBorderSide(BorderSide.none),
                child: Text(
                  'Tap to see more',
                  style: context.uiKitTheme?.boldTextTheme.caption1Bold.copyWith(
                    color: ColorsFoundation.darkNeutral100,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
