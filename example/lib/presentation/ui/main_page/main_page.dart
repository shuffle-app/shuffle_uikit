import 'package:example/presentation/ui/profile/influencer_profile.dart';
import 'package:example/presentation/ui/showcase/all_widgets_stand.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GeneralPurposeButton(
              text: 'UI Kit Showcase Stand',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AllWidgetsStand(),
                ),
              ),
            ),
            SpacingFoundation.verticalSpace16,
            GeneralPurposeButton(
              text: 'Influencer Profile',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InfluencerProfile(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
