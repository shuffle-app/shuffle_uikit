import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with SingleTickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          SpacingFoundation.verticalSpace24,
          Text(
            'Events you don’t wanna miss',
            style: context.uiKitTheme?.boldTextTheme.title1,
            textAlign: TextAlign.center,
          ),
          SpacingFoundation.verticalSpace24,
          Expanded(
            child: LayoutBuilder(
              builder: (context, size) {
                return UiKitHorizontalScrollableList(
                  leftPadding: SpacingFoundation.horizontalSpacing16,
                  spacing: SpacingFoundation.horizontalSpacing12,
                  children: List<UiKitSpinnerCard>.generate(
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
          SpacingFoundation.verticalSpace24,
          UiKitSpinner(
            scrollController: scrollController,
            categories: List<String>.generate(
              10,
              (index) => 'Category ${index + 1}',
            ),
            onSpinChangedCategory: (category) {
              print('Category changed to $category');
            },
          ),
        ],
      ),
    );
  }
}
