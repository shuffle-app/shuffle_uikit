import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with SingleTickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  final animDuration = const Duration(milliseconds: 250);

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const UiKitMessageCloud(
              message: 'Invite list',
              subtitle: '150 users',
            ),
            SpacingFoundation.verticalSpace24,
            UiKitLightUpAnimation(
              child: context.outlinedButton(
                data: BaseUiKitButtonData(
                  onPressed: () {},
                  iconInfo: BaseUiKitButtonIconData(
                    iconData: ShuffleUiKitIcons.searchpeople,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
