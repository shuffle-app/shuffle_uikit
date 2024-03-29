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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            UiKitHorizontalPicturesCarousel(
              autoPlay: true,
              autoPlayDuration: const Duration(seconds: 1),
              pictureLinks: [
                GraphicsFoundation.instance.png.mockAdBanner1.path,
                GraphicsFoundation.instance.png.mockAdBanner2.path,
                GraphicsFoundation.instance.png.mockAdBanner3.path,
                GraphicsFoundation.instance.png.mockAdBanner4.path,
                GraphicsFoundation.instance.png.mockAdBanner5.path,
                GraphicsFoundation.instance.png.place.path,
              ],
              carouselSize: Size(1.sw - SpacingFoundation.verticalSpacing32, 0.3.sh),
            ),
            SpacingFoundation.verticalSpace24,
            UiKitInfluencerAudioMessagesDemo(),
            SpacingFoundation.verticalSpace24,
            UiKitExpansionTile(
              leadingIconData: BaseUiKitButtonIconData(
                iconData: ShuffleUiKitIcons.tool,
              ),
              title: 'Control',
              children: [
                UiKitInlineButton(
                  data: BaseUiKitButtonData(
                    text: 'Button',
                    iconInfo: BaseUiKitButtonIconData(
                      iconData: ShuffleUiKitIcons.lifebuoy,
                    ),
                    onPressed: () {},
                  ),
                ),
                UiKitInlineButton(
                  data: BaseUiKitButtonData(
                    text: 'Button',
                    iconInfo: BaseUiKitButtonIconData(
                      iconData: ShuffleUiKitIcons.lifebuoy,
                    ),
                    onPressed: () {},
                  ),
                ),
                UiKitInlineButton(
                  data: BaseUiKitButtonData(
                    text: 'Button',
                    iconInfo: BaseUiKitButtonIconData(
                      iconData: ShuffleUiKitIcons.lifebuoy,
                    ),
                    onPressed: () {},
                  ),
                ),
                UiKitInlineButton(
                  data: BaseUiKitButtonData(
                    text: 'Button',
                    iconInfo: BaseUiKitButtonIconData(
                      iconData: ShuffleUiKitIcons.lifebuoy,
                    ),
                    onPressed: () {},
                  ),
                ),
                UiKitInlineButton(
                  data: BaseUiKitButtonData(
                    text: 'Button',
                    iconInfo: BaseUiKitButtonIconData(
                      iconData: ShuffleUiKitIcons.lifebuoy,
                    ),
                    onPressed: () {},
                  ),
                ),
                UiKitInlineButton(
                  data: BaseUiKitButtonData(
                    text: 'Button',
                    iconInfo: BaseUiKitButtonIconData(
                      iconData: ShuffleUiKitIcons.lifebuoy,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SpacingFoundation.verticalSpace24,
            UiKitTitledWrappedInput(
              input: UiKitInputFieldNoIcon(
                controller: TextEditingController(),
                fillColor: context.uiKitTheme?.colorScheme.surface3,
              ),
              title: 'title',
              popOverMessage: S.current.AddInfluencerFeedbackPopOverText,
            ).paddingSymmetric(
              horizontal: EdgeInsetsFoundation.horizontal16,
            ),
          ],
        ),
      ),
    );
  }
}
