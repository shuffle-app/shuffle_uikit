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
              AccentCard(
                title: 'Ballooning festival',
                additionalInfo: '22-23 March',
                accentMessage: 'Don’t miss',
                image: ImageWidget(
                  rasterAsset: Assets.images.png.balloons,
                  fit: BoxFit.cover,
                ),
              ),
              SpacingFoundation.verticalSpace16,
              const Center(
                child: BlurredQuestionChip(
                  label: 'how it works',
                ),
              ),
              SpacingFoundation.verticalSpace16,
              const TitledAccentInfo(
                title: 'Don’t miss it',
                info: '11:00 am, November 20',
              ),
              SpacingFoundation.verticalSpace16,
              const TitledAccentInfo(
                title: 'Place',
                info: 'Sardina Seafood Restaurant',
              ),
              SpacingFoundation.verticalSpace16,
              Row(
                children: [
                  MessageCardWithIcon(
                    message: 'Want to have some fun',
                    icon: ImageWidget(
                      rasterAsset: Assets.images.png.crazyEmoji,
                    ),
                    layoutDirection: Axis.vertical,
                  ),
                  SpacingFoundation.horizontalSpace12,
                  MessageCardWithIcon(
                    message: 'Want to have some fun',
                    icon: ImageWidget(
                      rasterAsset: Assets.images.png.crazyEmoji,
                    ),
                    layoutDirection: Axis.vertical,
                  ),
                ],
              ),
              SpacingFoundation.verticalSpace16,
              MessageCardWithIcon(
                message: 'need to cool down a bit?',
                icon: ImageWidget(
                  rasterAsset: Assets.images.png.crazyEmoji,
                ),
                layoutDirection: Axis.horizontal,
              ),
              SpacingFoundation.verticalSpace16,
              Row(
                children: [
                  context.button(
                    text: '',
                    gradient: true,
                    icon: ImageWidget(
                      svgAsset: Assets.images.svg.dice,
                    ),
                    onPressed: () {},
                  ),
                  SpacingFoundation.horizontalSpace12,
                  TitledFilterChip(
                    title: 'Favorites',
                    icon: Assets.images.svg.star,
                    selected: false,
                    onPressed: () {},
                  ),
                  SpacingFoundation.horizontalSpace12,
                  TitledFilterChip(
                    title: 'Clubs',
                    icon: Assets.images.svg.cocktail,
                    selected: true,
                    onPressed: () {},
                  ),
                ],
              ),
              SpacingFoundation.verticalSpace16,
              IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Expanded(
                      child: GradientAttentionCard(
                        message: 'Then check this out',
                        textColor: Colors.black,
                      ),
                    ),
                    SpacingFoundation.horizontalSpace16,
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Expanded(
                            child: WeatherInfoCard(
                              temperature: 32,
                              weatherType: 'Sunny',
                            ),
                          ),
                          SpacingFoundation.verticalSpace8,
                          Expanded(
                            child: MetricsCard(
                              title: 'Burned today',
                              value: 439,
                              unit: 'kCal',
                              icon: ImageWidget(
                                svgAsset: Assets.images.svg.fireWhite,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SpacingFoundation.verticalSpace16,
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
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  context.button(
                    text: 'Button',
                    onPressed: () {},
                    onlyIcon: true,
                    outlined: true,
                    icon: ImageWidget(
                      svgAsset: Assets.images.svg.route,
                      color: Colors.white,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace12,
                  Expanded(
                    child: context.button(
                      text: 'Book it',
                      onPressed: () {},
                      gradient: true,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace12,
                  context.button(
                    text: 'Button',
                    onPressed: () {},
                    onlyIcon: true,
                    outlined: true,
                    icon: ImageWidget(
                      svgAsset: Assets.images.svg.searchPeople,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SpacingFoundation.verticalSpace16,
              IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: UpcomingEventPlaceActionCard(
                        value: 'in 2 days',
                        icon: ImageWidget(
                          svgAsset: Assets.images.svg.star,
                        ),
                        action: () {},
                      ),
                    ),
                    SpacingFoundation.horizontalSpace8,
                    Expanded(
                      child: PointBalancePlaceActionCard(
                        value: '2 650',
                        icon: ImageWidget(
                          svgAsset: Assets.images.svg.star,
                        ),
                        action: () {},
                      ),
                    ),
                  ],
                ),
              ),
              SpacingFoundation.verticalSpace16,
              TitleWithAvatar(
                title: 'At.mosphere',
                avatarUrl: Assets.images.png.atmosphere.path,
              ),
              SpacingFoundation.verticalSpace16,
              PlaceInfo(
                place: UiKitPlace(
                  id: '1',
                  title: '',
                  logo: '',
                  media: [
                    UiKitMedia(link: Assets.images.png.place.path, type: UiKitMediaType.video),
                    UiKitMedia(link: Assets.images.png.place.path, type: UiKitMediaType.image),
                    UiKitMedia(link: Assets.images.png.place.path, type: UiKitMediaType.image),
                    UiKitMedia(link: Assets.images.png.place.path, type: UiKitMediaType.image),
                    UiKitMedia(link: Assets.images.png.place.path, type: UiKitMediaType.image),
                  ],
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Sed euismod, nunc ut tincidunt lacinia, nisl nisl aliquam nisl, vitae aliquam nisl nisl sit amet nunc. '
                      'Nulla facilisi. '
                      'Donec auctor, nisl eget aliquam tincidunt, nunc nisl aliquam nisl, vitae aliquam nisl nisl sit amet nunc. '
                      'Nulla facilisi',
                  rating: 4.8,
                  tags: [
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: false),
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: true),
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: false),
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: true),
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: false),
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: true),
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: false),
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: true),
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: false),
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.dice.path, matching: true),
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: false),
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: true),
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: false),
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: true),
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: false),
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: true),
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
                  avatarUrl: Assets.images.png.mockUserAvatar.path,
                ),
              ),
              SpacingFoundation.verticalSpace16,
              PremiumUserTile(
                info: UserTileInfo(
                  name: 'Frankie Hansen',
                  username: '@fr4nk1eh4',
                  avatarUrl: Assets.images.png.mockUserAvatar.path,
                ),
              ),
              SpacingFoundation.verticalSpace16,
              ProUserTile(
                info: UserTileInfo(
                  name: 'Frankie Hansen',
                  username: '@fr4nk1eh4',
                  avatarUrl: Assets.images.png.mockUserAvatar.path,
                ),
              ),
              SpacingFoundation.verticalSpace16,
              InfluencerlUserTile(
                info: UserTileInfo(
                  name: 'Frankie Hansen',
                  username: '@fr4nk1eh4',
                  avatarUrl: Assets.images.png.mockUserAvatar.path,
                ),
              ),
              SpacingFoundation.verticalSpace16,
              SlidablePlaceCard(
                slidablePlaceCardData: SlidablePlaceCardData(
                  media: [
                    UiKitMedia(link: Assets.images.png.place.path, type: UiKitMediaType.video),
                    UiKitMedia(link: Assets.images.png.place.path, type: UiKitMediaType.image),
                    UiKitMedia(link: Assets.images.png.place.path, type: UiKitMediaType.image),
                    UiKitMedia(link: Assets.images.png.place.path, type: UiKitMediaType.image),
                    UiKitMedia(link: Assets.images.png.place.path, type: UiKitMediaType.image),
                  ],
                  title: 'Virgins on the beach',
                  placeTags: [
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: false),
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: false),
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: false),
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: false),
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: false),
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: false),
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: false),
                    UiKitTag(title: 'Cheap', iconPath: Assets.images.svg.cocktail.path, matching: false),
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
