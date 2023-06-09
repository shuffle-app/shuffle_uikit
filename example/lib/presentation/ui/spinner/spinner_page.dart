import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class SpinnerPage extends StatelessWidget {
  final ScrollController scrollController = ScrollController();

  SpinnerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = SizesFoundation.screenWidth;
    final spacing = screenWidth <= 375 ? SpacingFoundation.verticalSpace16 : SpacingFoundation.verticalSpace24;

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          spacing,
          Text(
            'Events you don’t wanna miss',
            style: context.uiKitTheme?.boldTextTheme.title1,
            textAlign: TextAlign.center,
          ),
          spacing,
          Expanded(
            child: LayoutBuilder(
              builder: (context, size) {
                return UiKitHorizontalScrollableList(
                  leftPadding: SpacingFoundation.horizontalSpacing16,
                  spacing: SpacingFoundation.horizontalSpacing12,
                  children: List<Widget>.generate(
                    5,
                    (index) => UiKitSpinnerCard(
                      availableHeight: size.maxHeight,
                      photoLink: GraphicsFoundation.instance.png.spinnerEvent.path,
                      title: 'Yoga today at Palm Jumeirah. You go? Yes, you go!',
                      date: DateTime.now(),
                      favourite: index % 2 > 0,
                      onTap: () {},
                      onFavoriteTap: () {},
                      ownerPhotoLink: GraphicsFoundation.instance.png.mockUserAvatar.path,
                      ownerTileTitle: 'John Doe',
                      ownerTileTitleTrailing: ProAccountMark(),
                      ownerTileSubtitle: '@johndoe',
                    ),
                  ),
                );
              },
            ),
          ),
          spacing,
          UiKitSpinner(
            scrollController: scrollController,
            categories: List<String>.generate(
              10,
              (index) => 'Category ${index + 1}',
            ),
            onSpinChangedCategory: (spinData) {
              print('Category changed to ${spinData}');
            },
          ),
        ],
      ),
    );
  }
}
