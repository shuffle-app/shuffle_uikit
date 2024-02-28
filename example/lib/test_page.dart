import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with SingleTickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  final animDuration = const Duration(milliseconds: 250);

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logoWidth = 0.50625.sw;
    final logoHeight = logoWidth * 1.284;
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final isLightTheme = context.uiKitTheme?.themeMode == ThemeMode.light;

    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
          gradient: isLightTheme
              ? GradientFoundation.updatePageLightBackgroundGradient
              : GradientFoundation.updatePageDarkBackgroundGradient,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0.19375.sw * -6,
              right: 0.19375.sw * -6,
              child: UiKitRingsDecoration(
                ringsCount: 6,
              ),
            ),
            Positioned(
              top: MediaQuery.viewPaddingOf(context).top + ((1.sh - logoHeight) / 4),
              left: (1.sw - logoWidth) / 2,
              child: ImageWidget(
                svgAsset: GraphicsFoundation.instance.svg.logo,
                width: logoWidth,
                height: logoHeight,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              width: 1.sw - (SpacingFoundation.horizontalSpacing16 * 2),
              bottom: SpacingFoundation.verticalSpacing24,
              left: SpacingFoundation.horizontalSpacing16,
              child: UiKitMessageWithActionsSheet(
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradientableWidget(
                      gradient: GradientFoundation.defaultLinearGradient,
                      child: Text(
                        S.current.UpdateAppMessageTitle,
                        style: boldTextTheme?.subHeadline.copyWith(color: Colors.white),
                      ),
                    ),
                    SpacingFoundation.horizontalSpace4,
                    GradientableWidget(
                      gradient: GradientFoundation.defaultRadialGradient,
                      child: ImageWidget(
                        svgAsset: GraphicsFoundation.instance.svg.star2,
                        color: Colors.white,
                        width: 24.w,
                        height: 24.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                onAgree: () {},
                onDismiss: () => Navigator.pop(context),
                message: S.current.UpdateAppMessage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
