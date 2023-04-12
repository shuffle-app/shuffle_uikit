import 'package:example/presentation/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late bool isShuffleTheme;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final uiKitTheme = Theme.of(context).extension<UiKitThemeData>();
      setState(() {
        if (uiKitTheme != null) {
          isShuffleTheme = true;
        } else {
          isShuffleTheme = false;
        }
      });
    });
  }

  @override
  Widget build(_) {
    final theme = isShuffleTheme ? UiKitThemeFoundation.defaultTheme : ThemeData();
    return Theme(
      data: theme,
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Shuffle Theme',
                        style: Theme.of(context).extension<UiKitThemeData>()?.boldTextTheme.body.copyWith(
                              color: isShuffleTheme ? Colors.white : Colors.redAccent,
                            ),
                      ),
                      SpacingFoundation.horizontalSpace8,
                      Switch(
                        value: isShuffleTheme,
                        activeColor: Colors.white,
                        inactiveTrackColor: ColorsFoundation.solidSurface,
                        onChanged: (value) {
                          setState(() {
                            isShuffleTheme = value;
                          });
                        },
                      ),
                    ],
                  ),
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
      ),
    );
  }
}
