import 'package:example/presentation/ui/main_page/main_page.dart';
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
      title: 'Shuffle Demo',
      debugShowCheckedModeBanner: false,
      theme: UiKitThemeFoundation.defaultTheme,
      home: const MainPage(),
    );
  }
}
