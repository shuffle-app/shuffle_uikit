import 'package:example/presentation/ui/profile/influencer_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shuffle_uikit/foundation/shuffle_ui_kit_foundation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shuffle UI-kit Demo',
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
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            package: 'shuffle_uikit',
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontFamily: 'Syne',
          ),
          toolbarHeight: 84,
          color: Colors.black,
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle( // TODO check please
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
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
