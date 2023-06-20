import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  group('UiKitMessageCardWithIcon', () {
    ThemeData theme = UiKitThemeFoundation.defaultTheme;

    testGoldens('UiKitMessageCardWithIcon', (tester) async {
      debugDisableShadows = false;

      final builder = GoldenBuilder.grid(
        columns: 2,
        widthToHeightRatio: 1.3,
        bgColor: theme.scaffoldBackgroundColor,
        wrap: (child) => child,
      )
        ..addScenario(
          'No message',
          UiKitMessageCardWithIcon(
            onPressed: () {},
            message: '',
            icon: ImageWidget(
              svgAsset: GraphicsFoundation.instance.svg.smileyCrazyFaceEmoji,
            ),
            layoutDirection: Axis.horizontal,
          ),
        )
        ..addScenario(
          'Long message',
          UiKitMessageCardWithIcon(
            onPressed: () {},
            message:
                'need to cool down a bit?  need to cool down a bit? need to cool down a bit? need to cool down a bit? need to cool down a bit? need to cool down a bit?',
            icon: ImageWidget(
              svgAsset: GraphicsFoundation.instance.svg.smileyCrazyFaceEmoji,
            ),
            layoutDirection: Axis.horizontal,
          ),
        )
        ..addScenario(
          'normal message',
          UiKitMessageCardWithIcon(
            onPressed: () {},
            message: 'need to cool down a bit?',
            icon: ImageWidget(
              svgAsset: GraphicsFoundation.instance.svg.smileyCrazyFaceEmoji,
            ),
            layoutDirection: Axis.horizontal,
          ),
        )
        ..addScenario(
          'Without Message and icon',
          UiKitMessageCardWithIcon(
            onPressed: () {},
            message: '',
            icon: null,
            layoutDirection: Axis.horizontal,
          ),
        );

      await tester.pumpWidgetBuilder(ScreenUtilInit(
          
          child: builder.build(),
          builder: (BuildContext context, Widget? child) =>
              StatefulBuilder(builder: (context, setState) {
                return UiKitTheme(
                    onThemeUpdated: (theme) => setState(() => theme = theme),
                    child: Material(child: Theme(data: theme, child: child!)));
              })));

      await multiScreenGolden(
        tester,
        '2 Columns',
        devices: [
          const Device(
            name: 'iPhone 11 pro max,11 ,XR,XS max  414 x 896 ',
            size: Size(414, 896),
          ),
          const Device(
            name: 'iPhone 13 mini,12 mini,11 pro , XS,X   375 x 812',
            size: Size(375, 812),
          ),
          const Device(
            name: 'iPhone 13,13 pro,12 ,12 pro  375 x 667',
            size: Size(375, 667),
          ),
          const Device(
            name: 'iPhone 13 pro max  390 x 844',
            size: Size(390, 844),
          ),
          const Device(
            name: 'iPhone 12 pro max 428 x 752',
            size: Size(428, 752),
          ),
          const Device(
            name: 'iPhone 11 pro max ,XR , XS max 428 x 926',
            size: Size(428, 926),
          ),
          const Device(
            name: 'Samsung S20 360 x 800',
            size: Size(360, 800),
          ),
          const Device(
            name: 'Samsung S20 Ultra,A32 ,A31, OnePlus 412 x 915',
            size: Size(412, 915),
          ),
          const Device(
            name: 'iPod touch 320 x 568',
            size: Size(320, 568),
          ),
          const Device(
            name: 'iPad Pro		1024 x 1366',
            size: Size(1024, 1366),
          ),
          const Device(
            name: 'iPad Air 1 & 2	,3 , 4 	768 x 1024',
            size: Size(768, 1024),
          ),
          const Device(
            name: 'iPhone 5		320 x 480',
            size: Size(320, 480),
          ),
          const Device(
            name: 'iPhone 6 ,6S		375 x 667',
            size: Size(375, 667),
          ),
          const Device(
            name: 'iPhone 6 Plus ,6S Plus		414 x 736',
            size: Size(414, 736),
          ),
          const Device(
            name: 'iPhone 7		375 x 667',
            size: Size(375, 667),
          ),
          const Device(
            name: 'iPhone 7 Plus	414 x 736',
            size: Size(414, 736),
          ),
          const Device(
            name: 'Honor 9 Lite (width ~ 414dp)',
            size: Size(414, 828),
          ),
          const Device(
            name: 'Xiaomi Redmi Note 8 Pro  393 x 728 ',
            size: Size(393, 728),
          ),
          const Device(
            name: 'Xiaomi 11 Lite 5G NE 393 x 732',
            size: Size(393, 732),
          ),
          const Device(
            name: 'iPhone 11  414 x 715',
            size: Size(414, 715),
          ),
          const Device(
            name: 'Samsung M12 384 x 726',
            size: Size(384, 726),
          ),
          const Device(
            name: 'Samsung galaxy z flip4 360 x 778',
            size: Size(360, 778),
          ),
          const Device(
            name:
                'LG G3	,	LG G4 ,	LG G5 ,	Samsung Galaxy Note 4 ,Note 3 ,Sony Xperia Z	360	x 640',
            size: Size(360, 640),
          ),
          const Device(
            name: 'Samsung Galaxy Note 8	,9,10	360	x 740',
            size: Size(360, 740),
          ),
          const Device(
            name: 'Samsung Galaxy Note 10+		360	x 718',
            size: Size(360, 718),
          ),
          const Device(
            name: 'Google Pixel XL		411	x 731',
            size: Size(411, 731),
          ),
          const Device(
            name: 'Motorola Nexus 6		412 x	690',
            size: Size(412, 690),
          ),
          const Device(
            name: 'Apple iPhone SE 	250	x 445',
            size: Size(250, 445),
          ),
          const Device(
            name: 'Sony Xperia Z4	534 x	854',
            size: Size(534, 854),
          ),
          const Device(
            name: 'Xiaomi Redmi Note 5		393 x	786',
            size: Size(393, 786),
          ),
          const Device(
            name: 'Xiaomi Redmi Note 7,8 ,8 pro,9		360	x 780',
            size: Size(360, 780),
          ),
          const Device(
            name: 'Google Pixel C		534	x 400',
            size: Size(534, 400),
          ),
          const Device(
            name: 'Microsoft Lumia 1520	432	x 768',
            size: Size(432, 768),
          ),
          const Device(
            name: 'Blackberry Priv		854 x	480',
            size: Size(854, 480),
          ),
          const Device(
            name: 'HTC Nexus 9		768	x 1024',
            size: Size(768, 1024),
          ),
          const Device(
            name: 'Microsoft Surface Book		1000 x 667',
            size: Size(1000, 667),
          ),
          const Device(
            name: 'Asus Nexus 7 (v1)	604 x	966',
            size: Size(604, 966),
          ),
          const Device(
            name: '320 x 480 devices',
            size: Size(320, 480),
          ),
        ],
      );
    });
  });
}
