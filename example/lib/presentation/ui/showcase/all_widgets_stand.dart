import 'package:example/presentation/ui/showcase/buttons_grid.dart';
import 'package:example/presentation/ui/showcase/buttons_list.dart';
import 'package:example/presentation/ui/showcase/input_fields.dart';
import 'package:example/presentation/ui/showcase/input_fields_list.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AllWidgetsStand extends StatefulWidget {
  const AllWidgetsStand({super.key});

  @override
  State<AllWidgetsStand> createState() => _AllWidgetsStandState();
}

class _AllWidgetsStandState extends State<AllWidgetsStand> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// this key is used to scroll to the element the developer is working on
  final GlobalKey _currentElementKey = GlobalKey();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(
        const Duration(milliseconds: 1),
        () {
          Scrollable.ensureVisible(
            _currentElementKey.currentContext!,
            duration: const Duration(milliseconds: 250),
          );
          _formKey.currentState?.validate();
          setState(() {});
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Shuffle UI Kit Showcase Stand',
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (MediaQuery.of(context).size.width >= 720)
                InputFieldsGrid(
                  controller: _controller,
                ),
              if (MediaQuery.of(context).size.width < 720)
                InputFieldsList(
                  controller: _controller,
                ),
              SpacingFoundation.verticalSpace16,
              if (MediaQuery.of(context).size.width >= 720) const ButtonsGrid(),
              if (MediaQuery.of(context).size.width < 720) const ButtonsList(),
              SpacingFoundation.verticalSpace16,
              IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: UpcomingEventPlaceActionCard(
                        value: 'in 2 days',
                        icon: GraphicsFoundation.instance.svgPicture(
                          asset: Assets.images.svg.star,
                        ),
                        action: () {},
                      ),
                    ),
                    SpacingFoundation.horizontalSpace8,
                    Expanded(
                      child: PointBalancePlaceActionCard(
                        value: '2 650',
                        icon: GraphicsFoundation.instance.svgPicture(
                          asset: Assets.images.svg.star,
                        ),
                        action: () {},
                      ),
                    ),
                  ],
                ),
              ),
              SpacingFoundation.verticalSpace16,
              PlaceInfo(
                place: UiKitPlace(
                  media: [
                    UiKitMedia(link: 'assets/images/png/place.png', type: UiKitMediaType.video),
                    UiKitMedia(link: 'assets/images/png/place.png', type: UiKitMediaType.image),
                    UiKitMedia(link: 'assets/images/png/place.png', type: UiKitMediaType.image),
                    UiKitMedia(link: 'assets/images/png/place.png', type: UiKitMediaType.image),
                    UiKitMedia(link: 'assets/images/png/place.png', type: UiKitMediaType.image),
                  ],
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Sed euismod, nunc ut tincidunt lacinia, nisl nisl aliquam nisl, vitae aliquam nisl nisl sit amet nunc. '
                      'Nulla facilisi. '
                      'Donec auctor, nisl eget aliquam tincidunt, nunc nisl aliquam nisl, vitae aliquam nisl nisl sit amet nunc. '
                      'Nulla facilisi',
                  rating: 4.8,
                  tags: [
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: false),
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: true),
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: false),
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: true),
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: false),
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: true),
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: false),
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: true),
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: false),
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: true),
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: false),
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: true),
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: false),
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: true),
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: false),
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: true),
                  ],
                ),
              ),
              SpacingFoundation.verticalSpace16,
              const PlaceDescriptionGrid(
                descriptionItems: [
                  PlaceDescriptionItem(
                    title: 'Address',
                    description: 'Burj Khalifa 122nd Floor',
                  ),
                  PlaceDescriptionItem(
                    title: 'Open now',
                    description: '9:30 am - 10:30 pm',
                  ),
                  PlaceDescriptionItem(
                    title: 'Website',
                    description: 'atmosphere.com',
                  ),
                  PlaceDescriptionItem(
                    title: 'Phone',
                    description: '+971123596943',
                  ),
                ],
                spacing: 16,
              ),
              SpacingFoundation.verticalSpace16,
              OrdinaryUserTile(
                info: UserTileInfo(
                  name: 'Frankie Hansen',
                  username: '@fr4nk1eh4',
                  avatarUrl: 'assets/images/png/mock_user_avatar.png',
                ),
              ),
              SpacingFoundation.verticalSpace16,
              PremiumUserTile(
                info: UserTileInfo(
                  name: 'Frankie Hansen',
                  username: '@fr4nk1eh4',
                  avatarUrl: 'assets/images/png/mock_user_avatar.png',
                ),
              ),
              SpacingFoundation.verticalSpace16,
              ProUserTile(
                info: UserTileInfo(
                  name: 'Frankie Hansen',
                  username: '@fr4nk1eh4',
                  avatarUrl: 'assets/images/png/mock_user_avatar.png',
                ),
              ),
              SpacingFoundation.verticalSpace16,
              InfluencerlUserTile(
                info: UserTileInfo(
                  name: 'Frankie Hansen',
                  username: '@fr4nk1eh4',
                  avatarUrl: 'assets/images/png/mock_user_avatar.png',
                ),
              ),
              SpacingFoundation.verticalSpace16,
              SlidablePlaceCard(
                key: _currentElementKey,
                slidablePlaceCardData: SlidablePlaceCardData(
                  media: [
                    UiKitMedia(link: 'assets/images/png/place.png', type: UiKitMediaType.video),
                    UiKitMedia(link: 'assets/images/png/place.png', type: UiKitMediaType.image),
                    UiKitMedia(link: 'assets/images/png/place.png', type: UiKitMediaType.image),
                    UiKitMedia(link: 'assets/images/png/place.png', type: UiKitMediaType.image),
                    UiKitMedia(link: 'assets/images/png/place.png', type: UiKitMediaType.image),
                  ],
                  title: 'Virgins on the beach',
                  placeTags: [
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: false),
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: false),
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: false),
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: false),
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: false),
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: false),
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: false),
                    UiKitTag(title: 'Cheap', iconPath: 'assets/images/svg/cocktail.svg', matching: false),
                  ],
                ),
              ),
            ],
          ),
        ).paddingAll(EdgeInsetsFoundation.all16),
      ),
    );
  }
}
