import 'package:example/presentation/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isShuffleTheme = false;
  bool isFallbackTheme = false;
  bool isDefaultTheme = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final uiKitTheme = Theme.of(context).extension<UiKitThemeData>();
      setState(() {
        if (uiKitTheme != null) {
          isShuffleTheme = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ToggleButtons(
              borderWidth: 2,
              borderColor: Colors.black,
              borderRadius: BorderRadiusFoundation.all24,
              selectedColor: Colors.white,
              selectedBorderColor: Colors.black,
              disabledBorderColor: Colors.black,
              isSelected: [isShuffleTheme, isFallbackTheme, isDefaultTheme],
              onPressed: (index) {
                if (index == 0) {
                  UiKitTheme.of(context).updateTheme(UiKitThemeFoundation.defaultTheme);
                  setState(() {
                    isShuffleTheme = true;
                    isFallbackTheme = false;
                    isDefaultTheme = false;
                  });
                } else if (index == 1) {
                  UiKitTheme.of(context).updateTheme(UiKitThemeFoundation.fallbackTheme);
                  setState(() {
                    isShuffleTheme = false;
                    isFallbackTheme = true;
                    isDefaultTheme = false;
                  });
                } else if (index == 2) {
                  UiKitTheme.of(context).updateTheme(ThemeData());
                  setState(() {
                    isShuffleTheme = false;
                    isFallbackTheme = false;
                    isDefaultTheme = true;
                  });
                }
              },
              children: [
                Text(
                  'Shuffle Theme',
                  style: context.uiKitTheme?.boldTextTheme.body.copyWith(
                        color: isDefaultTheme ? Colors.black : Colors.white,
                      ) ??
                      TextStyle(color: isDefaultTheme ? Colors.black : Colors.white),
                ).paddingAll(EdgeInsetsFoundation.all16),
                Text(
                  'Fallback Theme',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isDefaultTheme ? Colors.black : Colors.white,
                      ),
                ).paddingAll(EdgeInsetsFoundation.all16),
                Text(
                  'Default Theme',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isDefaultTheme ? Colors.black : Colors.white,
                      ),
                ).paddingAll(EdgeInsetsFoundation.all16),
              ],
            ),
            SpacingFoundation.verticalSpace24,
            GeneralPurposeButton(
              text: 'UI Kit Showcase Stand',
              onPressed: () => Navigator.pushNamed(context, AppRoutes.stand),
            ),
            SpacingFoundation.verticalSpace16,
            GeneralPurposeButton(
              text: 'Influencer Profile',
              onPressed: () => Navigator.pushNamed(context, AppRoutes.influencerProfile),
            ),
          ],
        ),
      ),
    );
  }
}
