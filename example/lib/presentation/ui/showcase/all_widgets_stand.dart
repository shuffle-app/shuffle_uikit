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
    return BlurredAppBarPage(
      title: 'Shuffle UI Kit Stand',
      centerTitle: true,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: UiKitGradientQuestionChip(
                  message: 'Tell us more',
                  onTap: () {},
                ),
              ),
              SpacingFoundation.verticalSpace16,
              BlurredCardWithGradientBorder(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ImageWidget(
                          svgAsset: GraphicsFoundation.instance.svg.ski,
                        ),
                        SpacingFoundation.horizontalSpace12,
                        Expanded(
                          child: Text(
                            'By the way, how often do you like to ski?',
                            style: context.uiKitTheme?.boldTextTheme.body,
                          ),
                        ),
                      ],
                    ),
                    SpacingFoundation.verticalSpace8,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: context.smallOutlinedButton(
                            text: 'Not often',
                            onPressed: () {},
                          ),
                        ),
                        SpacingFoundation.horizontalSpace12,
                        Expanded(
                          child: context.smallButton(
                            text: 'Very often',
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    SpacingFoundation.verticalSpace8,
                    context.smallOutlinedButton(
                      text: 'Hard to answer',
                      color: Colors.white.withOpacity(0.1),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SpacingFoundation.verticalSpace16,
              BlurredCardWithGradientBorder(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Thanks Now we know you better',
                      style: context.uiKitTheme?.boldTextTheme.subHeadline,
                    ),
                    SpacingFoundation.verticalSpace8,
                    ImageWidget(
                      svgAsset: GraphicsFoundation.instance.svg.heartInHandEmoji,
                    )
                  ],
                ),
              ),
              SpacingFoundation.verticalSpace16,
              SizedBox(
                height: 568,
                width: double.infinity,
                child: UiKitCardSwiper(
                  onSwipe: (_, __, ___) {
                    return true;
                  },
                  cards: List<BaseUiKitSwiperCard>.generate(
                    10,
                    (index) => UiKitSwiperCard(
                      title: 'Dance Again',
                      subtitle: 'Unique place for unique people',
                      imageLink: Assets.images.png.mockSwiperCard.path,
                      tags: [
                        UiKitTagWidget(
                          title: 'Club',
                          icon: Assets.images.svg.cocktail.path,
                        ),
                        UiKitTagWidget(
                          title: 'Club',
                          icon: Assets.images.svg.cocktail.path,
                          customSpace: SpacingFoundation.horizontalSpace8,
                          showSpacing: true,
                        ),
                        UiKitTagWidget(
                          title: 'Club',
                          icon: Assets.images.svg.cocktail.path,
                          customSpace: SpacingFoundation.horizontalSpace8,
                          showSpacing: true,
                        ),
                        UiKitTagWidget(
                          title: 'Club',
                          icon: Assets.images.svg.cocktail.path,
                          customSpace: SpacingFoundation.horizontalSpace8,
                          showSpacing: true,
                        ),
                        UiKitTagWidget(
                          title: 'Club',
                          icon: Assets.images.svg.cocktail.path,
                          customSpace: SpacingFoundation.horizontalSpace8,
                          showSpacing: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SpacingFoundation.verticalSpace16,
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  context.smallButton(
                    blurred: true,
                    icon: ImageWidget(
                      svgAsset: GraphicsFoundation.instance.svg.star,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  context.button(
                    blurred: true,
                    icon: ImageWidget(
                      svgAsset: GraphicsFoundation.instance.svg.heartFill,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  context.smallButton(
                    blurred: true,
                    icon: ImageWidget(
                      svgAsset: GraphicsFoundation.instance.svg.star,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SpacingFoundation.verticalSpace16,
              UiKitSwiperCard(
                title: 'Dance Again',
                subtitle: 'Unique place for unique people',
                imageLink: Assets.images.png.mockSwiperCard.path,
                tags: [
                  UiKitTagWidget(
                    title: 'Club',
                    icon: Assets.images.svg.cocktail.path,
                  ),
                  UiKitTagWidget(
                    title: 'Club',
                    icon: Assets.images.svg.cocktail.path,
                    customSpace: SpacingFoundation.horizontalSpace8,
                    showSpacing: true,
                  ),
                  UiKitTagWidget(
                    title: 'Club',
                    icon: Assets.images.svg.cocktail.path,
                    customSpace: SpacingFoundation.horizontalSpace8,
                    showSpacing: true,
                  ),
                  UiKitTagWidget(
                    title: 'Club',
                    icon: Assets.images.svg.cocktail.path,
                    customSpace: SpacingFoundation.horizontalSpace8,
                    showSpacing: true,
                  ),
                  UiKitTagWidget(
                    title: 'Club',
                    icon: Assets.images.svg.cocktail.path,
                    customSpace: SpacingFoundation.horizontalSpace8,
                    showSpacing: true,
                  ),
                ],
              ),
              UiKitSwiperAdCard(
                title: '',
                subtitle: '',
                imageLink: Assets.images.png.mockAdBanner.path,
              ),
              UiKitAccentCard(
                title: 'Ballooning festival',
                additionalInfo: '22-23 March',
                accentMessage: 'Don’t miss',
                image: ImageWidget(
                  rasterAsset: GraphicsFoundation.instance.png.balloons,
                  fit: BoxFit.cover,
                ),
              ),
              SpacingFoundation.verticalSpace16,
              const Center(
                child: UiKitBlurredQuestionChip(
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    UiKitMessageCardWithIcon(
                      message: 'Want to have some fun',
                      icon: ImageWidget(
                        svgAsset: GraphicsFoundation.instance.svg.smileyCrazyFaceEmoji,
                      ),
                      layoutDirection: Axis.vertical,
                    ),
                    SpacingFoundation.horizontalSpace12,
                    UiKitMessageCardWithIcon(
                      message: 'Want to have',
                      icon: ImageWidget(rasterAsset: GraphicsFoundation.instance.png.mockUserAvatar),
                      layoutDirection: Axis.vertical,
                    ),
                    SpacingFoundation.horizontalSpace12,
                    UiKitMessageCardWithIcon(
                      message: 'Want to haveWant to have',
                      icon: ImageWidget(
                        svgAsset: GraphicsFoundation.instance.svg.smileyCrazyFaceEmoji,
                      ),
                      layoutDirection: Axis.vertical,
                    ),
                  ],
                ),
              ),
              SpacingFoundation.verticalSpace16,
              UiKitMessageCardWithIcon(
                message: 'need to cool down a bit?',
                icon: ImageWidget(
                  svgAsset: GraphicsFoundation.instance.svg.smileyCrazyFaceEmoji,
                ),
                layoutDirection: Axis.horizontal,
              ),
              SpacingFoundation.verticalSpace16,
              Row(
                children: [
                  context.gradientButton(
                    text: '',
                    icon: ImageWidget(
                      svgAsset: GraphicsFoundation.instance.svg.dice,
                    ),
                    onPressed: () {},
                  ),
                  SpacingFoundation.horizontalSpace12,
                  UiKitTitledFilterChip(
                    title: 'Favorites',
                    icon: GraphicsFoundation.instance.svg.star,
                    selected: false,
                    onPressed: (selected) {},
                  ),
                  SpacingFoundation.horizontalSpace12,
                  UiKitTitledFilterChip(
                    title: 'Clubs',
                    icon: GraphicsFoundation.instance.svg.cocktail,
                    selected: true,
                    onPressed: (selected) {},
                  ),
                ],
              ),
              SpacingFoundation.verticalSpace16,
              IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Expanded(
                      child: UiKitGradientAttentionCard(
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
                            child: UiKitWeatherInfoCard(
                              temperature: '32',
                              weatherType: 'Sunny',
                            ),
                          ),
                          SpacingFoundation.verticalSpace8,
                          Expanded(
                            child: UiKitMetricsCard(
                              title: 'Burned today',
                              value: '439',
                              unit: 'kCal',
                              icon: ImageWidget(
                                svgAsset: GraphicsFoundation.instance.svg.fireWhite,
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
                  context.outlinedButton(
                    onPressed: () {},
                    icon: ImageWidget(
                      svgAsset: GraphicsFoundation.instance.svg.route,
                      color: Colors.white,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace12,
                  Expanded(
                    child: context.gradientButton(
                      text: 'Book it',
                      onPressed: () {},
                    ),
                  ),
                  SpacingFoundation.horizontalSpace12,
                  context.outlinedButton(
                    onPressed: () {},
                    icon: ImageWidget(
                      svgAsset: GraphicsFoundation.instance.svg.searchPeople,
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
                        vectorIconAsset: GraphicsFoundation.instance.svg.events,
                        action: () {},
                      ),
                    ),
                    SpacingFoundation.horizontalSpace8,
                    Expanded(
                      child: PointBalancePlaceActionCard(
                        value: '2 650',
                        vectorIconAsset: GraphicsFoundation.instance.svg.coin,
                        action: () {},
                      ),
                    ),
                  ],
                ),
              ),
              SpacingFoundation.verticalSpace16,
              TitleWithAvatar(
                title: 'At.mosphere',
                avatarUrl: GraphicsFoundation.instance.png.atmosphere.path,
              ),
              SpacingFoundation.verticalSpace16,
              UiKitMediaSliderWithTags(
                media: [
                  UiKitMediaPhoto(link: GraphicsFoundation.instance.png.place.path),
                  UiKitMediaPhoto(link: GraphicsFoundation.instance.png.place.path),
                  UiKitMediaPhoto(link: GraphicsFoundation.instance.png.place.path),
                  UiKitMediaPhoto(link: GraphicsFoundation.instance.png.place.path),
                  UiKitMediaVideo(link: GraphicsFoundation.instance.png.place.path),
                ],
                description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Sed euismod, nunc ut tincidunt lacinia, nisl nisl aliquam nisl, vitae aliquam nisl nisl sit amet nunc. '
                    'Nulla facilisi. '
                    'Donec auctor, nisl eget aliquam tincidunt, nunc nisl aliquam nisl, vitae aliquam nisl nisl sit amet nunc. '
                    'Nulla facilisi',
                rating: 4.8,
                baseTags: [
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path, unique: false),
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path, unique: false),
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path, unique: false),
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path, unique: false),
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path, unique: false),
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path, unique: false),
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path, unique: false),
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path, unique: false),
                ],
                uniqueTags: [
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.dice.path, unique: true),
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.dice.path, unique: true),
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.dice.path, unique: true),
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.dice.path, unique: true),
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.dice.path, unique: true),
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.dice.path, unique: true),
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.dice.path, unique: true),
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.dice.path, unique: true),
                ],
              ),
              SpacingFoundation.verticalSpace16,
              const PlaceDescriptionGrid(
                spacing: 16,
                children: [
                  UiKitTitledDescriptionWidget(
                    title: 'Title',
                    description: 'Description',
                  ),
                  UiKitTitledDescriptionWidget(
                    title: 'Title',
                    description: 'Description',
                  ),
                  UiKitTitledDescriptionWidget(
                    title: 'Title',
                    description: 'Description',
                  ),
                  UiKitTitledDescriptionWidget(
                    title: 'Title',
                    description: 'Description',
                  ),
                ],
              ),
              SpacingFoundation.verticalSpace16,
              context.userTile(
                onTap: () {},
                name: 'Frankie Hansen',
                username: '@fr4nk1eh4',
                avatarUrl: GraphicsFoundation.instance.png.mockUserAvatar.path,
                type: UserTileType.ordinary,
              ),
              SpacingFoundation.verticalSpace16,
              context.userTile(
                onTap: () {},
                name: 'Frankie Hansen',
                username: '@fr4nk1eh4',
                avatarUrl: GraphicsFoundation.instance.png.mockUserAvatar.path,
                type: UserTileType.premium,
              ),
              SpacingFoundation.verticalSpace16,
              context.userTile(
                onTap: () {},
                name: 'Frankie Hansen',
                username: '@fr4nk1eh4',
                avatarUrl: GraphicsFoundation.instance.png.mockUserAvatar.path,
                type: UserTileType.pro,
              ),
              SpacingFoundation.verticalSpace16,
              context.userTile(
                onTap: () {},
                name: 'Frankie Hansen',
                username: '@fr4nk1eh4',
                avatarUrl: GraphicsFoundation.instance.png.mockUserAvatar.path,
                type: UserTileType.influencer,
              ),
              SpacingFoundation.verticalSpace16,
              SlidablePlaceCard(
                slidablePlaceCardData: SlidablePlaceCardData(
                  media: [
                    UiKitMediaVideo(link: GraphicsFoundation.instance.png.place.path),
                    UiKitMediaPhoto(link: GraphicsFoundation.instance.png.place.path),
                    UiKitMediaPhoto(link: GraphicsFoundation.instance.png.place.path),
                    UiKitMediaPhoto(link: GraphicsFoundation.instance.png.place.path),
                    UiKitMediaPhoto(link: GraphicsFoundation.instance.png.place.path),
                  ],
                  title: 'Virgins on the beach',
                  placeTags: [
                    UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path, unique: false),
                    UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path, unique: false),
                    UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path, unique: false),
                    UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path, unique: false),
                    UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path, unique: false),
                    UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path, unique: false),
                    UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path, unique: false),
                    UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path, unique: false),
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
