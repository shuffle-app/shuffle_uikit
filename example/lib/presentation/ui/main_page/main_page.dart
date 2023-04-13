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
  Widget build(_) {
    return Builder(
      builder: (context) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ToggleButtons(
                  fillColor: Colors.black,
                  borderWidth: 2,
                  borderColor: Colors.black,
                  borderRadius: BorderRadiusFoundation.all24,
                  selectedColor: Colors.transparent,
                  selectedBorderColor: Colors.redAccent,
                  disabledBorderColor: Colors.black,
                  isSelected: [isShuffleTheme, isFallbackTheme, isDefaultTheme],
                  onPressed: (index) {
                    if (index == 0) {
                      UiKitThemeProvider.of(context).updateTheme(UiKitThemeFoundation.defaultTheme);
                      setState(() {
                        isShuffleTheme = true;
                        isFallbackTheme = false;
                        isDefaultTheme = false;
                      });
                    } else if (index == 1) {
                      UiKitThemeProvider.of(context).updateTheme(UiKitThemeFoundation.fallbackTheme);
                      setState(() {
                        isShuffleTheme = false;
                        isFallbackTheme = true;
                        isDefaultTheme = false;
                      });
                    } else if (index == 2) {
                      UiKitThemeProvider.of(context).updateTheme(ThemeData());
                      setState(() {
                        isShuffleTheme = false;
                        isFallbackTheme = false;
                        isDefaultTheme = true;
                      });
                    }
                  },
                  children: [
                    Padding(
                      padding: EdgeInsetsFoundation.all16,
                      child: Text(
                        'Shuffle Theme',
                        style: Theme.of(context).extension<UiKitThemeData>()?.boldTextTheme.body.copyWith(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsFoundation.all16,
                      child: Text(
                        'Fallback Theme',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: isFallbackTheme
                                  ? Colors.white
                                  : isShuffleTheme
                                      ? Colors.white
                                      : Colors.black,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsFoundation.all16,
                      child: Text(
                        'Default Theme',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: isShuffleTheme || isDefaultTheme ? Colors.white : Colors.black,
                            ),
                      ),
                    ),
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
      },
    );
  }
}
