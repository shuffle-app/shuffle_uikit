import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  group('Place card', () {
    ThemeData _theme = UiKitThemeFoundation.defaultTheme;

    testGoldens('Slider Place card', (tester) async {
      debugDisableShadows = false;

      final builder = GoldenBuilder.grid(
        columns: 2,
        widthToHeightRatio: 1.3,
        bgColor: _theme.scaffoldBackgroundColor,
        wrap: (child) => child,
      )
        ..addScenario(
          'Like in stand',
          SliderPlaceCard(
            slidablePlaceCardData: SlidablePlaceCardData(
              media: [
                UiKitMediaVideo(
                    link: GraphicsFoundation.instance.png.place.path),
                UiKitMediaPhoto(
                    link: GraphicsFoundation.instance.png.place.path),
                UiKitMediaPhoto(
                    link: GraphicsFoundation.instance.png.place.path),
                UiKitMediaPhoto(
                    link: GraphicsFoundation.instance.png.place.path),
                UiKitMediaPhoto(
                    link: GraphicsFoundation.instance.png.place.path),
              ],
              title: 'Virgins on the beach',
              placeTags: [
                UiKitTag(
                    title: '',
                    iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                UiKitTag(
                    title: 'C',
                    iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                UiKitTag(
                    title: 'Ch',
                    iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                UiKitTag(
                    title: 'Che',
                    iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                UiKitTag(
                    title: 'Chea',
                    iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                UiKitTag(
                    title: 'Cheap',
                    iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                UiKitTag(
                    title: 'CheapC',
                    iconPath: GraphicsFoundation.instance.svg.cocktail.path),
              ],
            ),
          ),
        )
        ..addScenario(
          'Title is null',
          SliderPlaceCard(
            slidablePlaceCardData: SlidablePlaceCardData(
              media: [
                UiKitMediaVideo(
                    link: GraphicsFoundation.instance.png.place.path),
                UiKitMediaPhoto(
                    link: GraphicsFoundation.instance.png.place.path),
                UiKitMediaPhoto(
                    link: GraphicsFoundation.instance.png.place.path),
                UiKitMediaPhoto(
                    link: GraphicsFoundation.instance.png.place.path),
                UiKitMediaPhoto(
                    link: GraphicsFoundation.instance.png.place.path),
              ],
              placeTags: [
                UiKitTag(
                    title: 'CheapCheap',
                    iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                UiKitTag(
                    title: 'Ch',
                    iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                UiKitTag(
                    title: 'CheapChe',
                    iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                UiKitTag(
                    title: 'CheapChe',
                    iconPath: GraphicsFoundation.instance.svg.cocktail.path),
              ],
            ),
          ),
        )
        ..addScenario(
          'Title is empty and tags are null',
          SliderPlaceCard(
            slidablePlaceCardData: SlidablePlaceCardData(
              media: [
                UiKitMediaVideo(
                    link: GraphicsFoundation.instance.png.place.path),
                UiKitMediaPhoto(
                    link: GraphicsFoundation.instance.png.place.path),
                UiKitMediaPhoto(
                    link: GraphicsFoundation.instance.png.place.path),
                UiKitMediaPhoto(
                    link: GraphicsFoundation.instance.png.place.path),
                UiKitMediaPhoto(
                    link: GraphicsFoundation.instance.png.place.path),
              ],
              title: '',
            ),
          ),
        )
        ..addScenario(
          'Single media',
          SliderPlaceCard(
            slidablePlaceCardData: SlidablePlaceCardData(
              media: [
                UiKitMediaVideo(
                    link: GraphicsFoundation.instance.png.place.path),
              ],
              title: 'Single media',
            ),
          ),
        );

      await tester.pumpWidgetBuilder(ScreenUtilInit(
              designSize: const Size(320, 568),
              child: builder.build(),
              builder: (BuildContext context, Widget? child) =>
                  StatefulBuilder(builder: (context, setState) {
                    return UiKitTheme(
                        onThemeUpdated: (theme) =>
                            setState(() => _theme = theme),
                        child: Material(
                            child: Theme(data: _theme, child: child!)));
                  }))
          //   },
          // ),
          // wrapper: materialAppWrapper(
          //   theme: theme,
          // ),
          );

      await screenMatchesGolden(tester, 'slider_place_card', autoHeight: true);
    });
  });
}
