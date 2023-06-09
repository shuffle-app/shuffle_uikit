import 'package:example/presentation/routing/app_routes.dart';
import 'package:example/presentation/ui/main_page/main_page.dart';
import 'package:example/presentation/ui/onboarding/onboarding_page.dart';
import 'package:example/presentation/ui/profile/influencer_profile.dart';
import 'package:example/presentation/ui/showcase/show_case_page.dart';
import 'package:example/presentation/ui/spinner/spinner_page.dart';
import 'package:example/presentation/ui/unknown_page/unknown_page.dart';
import 'package:example/test_page.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

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
      case AppRoutes.testPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const TestPage(),
        );
      case AppRoutes.spinner:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => SpinnerPage(),
        );
      case AppRoutes.onBoardingPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => OnBoardingPage(
            logoLink: GraphicsFoundation.instance.svg.shuffleWhite.path,
            transitionDuration: const Duration(milliseconds: 500),
            items: [
              OnBoardingPageItem(
                imageLink: GraphicsFoundation.instance.png.onboardingMock1.path,
                title: 'to have some fun',
              ),
              OnBoardingPageItem(
                imageLink: GraphicsFoundation.instance.png.onboardingMock2.path,
                title: 'to explore leisure and business',
              ),
              OnBoardingPageItem(
                imageLink: GraphicsFoundation.instance.png.onboardingMock3.path,
                title: 'to just chill out',
              ),
              OnBoardingPageItem(
                imageLink: GraphicsFoundation.instance.png.onboardingMock1.path,
                title: 'to have some fun',
              ),
            ],
          ),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const UnknownPage(),
        );
    }
  }
}
