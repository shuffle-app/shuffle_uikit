import 'package:example/presentation/ui/profile/influencer_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   theme: ThemeData(
    //     extensions: <ThemeExtension<UiKitThemeData>>[
    //       UiKitThemeData(
    //         customColor: Colors.red,
    //       )
    //     ],
    //   ),
    //   home: Builder(
    //     builder: (context) {
    //       final uikitThee = Theme.of(context).extension<UiKitThemeData>()!;
    //       return Scaffold(
    //         body: Center(
    //           child: Text(
    //             'Hello World',
    //             style: TextStyle(color: uikitThee.customColor),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: false,
        tabBarTheme: const TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          unselectedLabelStyle: TextStyle(
            package: 'shuffle_uikit',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Syne',
          ),
          labelStyle: TextStyle(
            package: 'shuffle_uikit',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Syne',
          ),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          indicator: BoxDecoration(
            borderRadius: BorderRadiusFoundation.max,
            color: Colors.white,
          ),
        ),
        cardColor: ColorsFoundation.solidSurface,
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.white,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusFoundation.max,
          ),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: const TextStyle(
            package: 'shuffle_uikit',
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontFamily: 'Syne',
          ),
          toolbarHeight: 84,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white.withOpacity(0.07),
          foregroundColor: Colors.white.withOpacity(0.07),
          centerTitle: true,
        ),
        cardTheme: const CardTheme(
          shadowColor: Colors.transparent,
          surfaceTintColor: ColorsFoundation.solidSurface,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusFoundation.all24,
          ),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            package: 'shuffle_uikit',
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontFamily: 'Syne',
          ),
          displayMedium: TextStyle(
            package: 'shuffle_uikit',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontFamily: 'Syne',
          ),
          titleLarge: TextStyle(
            package: 'shuffle_uikit',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontFamily: 'Syne',
          ),
          titleMedium: TextStyle(
            package: 'shuffle_uikit',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontFamily: 'Syne',
          ),
          labelSmall: TextStyle(
            package: 'shuffle_uikit',
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 0,
            fontFamily: 'Syne',
          ),
          labelMedium: TextStyle(
            package: 'shuffle_uikit',
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontFamily: 'Syne',
          ),
          labelLarge: TextStyle(
            package: 'shuffle_uikit',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontFamily: 'Syne',
          ),
          bodyMedium: TextStyle(
            package: 'shuffle_uikit',
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontFamily: 'Syne',
          ),
          bodySmall: TextStyle(
            package: 'shuffle_uikit',
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontFamily: 'Syne',
          ),
        ),
      ),
      home: const InfluencerProfile(),
    );
  }
}
