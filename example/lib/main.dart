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
            borderRadius: UiKitBorderRadius.max,
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
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            package: 'shuffle_uikit',
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontFamily: 'Syne',
          ),
          headlineMedium: TextStyle(
            package: 'shuffle_uikit',
            fontSize: 20,
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
