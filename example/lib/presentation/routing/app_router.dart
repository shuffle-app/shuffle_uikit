import 'package:example/presentation/routing/app_routes.dart';
import 'package:example/presentation/ui/main_page/main_page.dart';
import 'package:example/presentation/ui/profile/influencer_profile.dart';
import 'package:example/presentation/ui/showcase/show_case_page.dart';
import 'package:example/presentation/ui/unknown_page/unknown_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initial:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MainPage(),
        );
      case AppRoutes.influencerProfile:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const InfluencerProfile(),
        );
      case AppRoutes.stand:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ShowCasePage(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const UnknownPage(),
        );
    }
  }
}
