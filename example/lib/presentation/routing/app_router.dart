import 'package:example/presentation/routing/app_routes.dart';
import 'package:example/presentation/ui/animations/animations_page.dart';
import 'package:example/presentation/ui/examples/user_content_type_switch_animation.dart';
import 'package:example/presentation/ui/location_picker/location_picker_page.dart';
import 'package:example/presentation/ui/main_page/main_page.dart';
import 'package:example/presentation/ui/onboarding/onboarding_page.dart';
import 'package:example/presentation/ui/profile/influencer_profile.dart';
import 'package:example/presentation/ui/showcase/show_case_page.dart';
import 'package:example/presentation/ui/spinner/spinner_page.dart';
import 'package:example/presentation/ui/unknown_page/unknown_page.dart';
import 'package:example/presentation/ui/welcome/welcome_page.dart';
import 'package:example/test_page.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
      case AppRoutes.animexample:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ExamplesPage(),
        );
      case AppRoutes.onBoardingPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => OnBoardingPage(
            onFinished: () => Navigator.pushNamed(
              _,
              AppRoutes.animexample,
            ),
            logoLink: ShuffleUiKitIcons.shuffleWhite,
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
      case AppRoutes.locationPicker:
        return MaterialPageRoute(
          builder: (context) => const LocationPickerPage(),
          settings: settings,
        );
      case AppRoutes.welcomePage:
        return MaterialPageRoute(
          builder: (context) => WelcomePage(
            onFinished: () => Navigator.pushNamed(
              context,
              AppRoutes.initial,
            ),
          ),
          settings: settings,
        );
      case AppRoutes.animationsPage:
        return MaterialPageRoute(
          builder: (context) => const AnimationsPage(),
          settings: settings,
        );
      case AppRoutes.mapDirections:
        return MaterialPageRoute(
          builder: (context) => MapDirectionsPage(
            currentLocationNotifier: ValueNotifier<LatLng>(const LatLng(41.411081, 69.240562)),
            destination: const LatLng(41.411081, 69.240562),
            onCurrentLocationRequested: () {},
            searchController: TextEditingController(),
            destinationTitle: 'At.mosphere | Burj Khalifa',
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const UnknownPage(),
        );
    }
  }
}
