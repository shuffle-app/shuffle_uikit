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
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _gradientTextKey = GlobalKey();

  bool selection = false;
  final List<UiKitMenuItem<String>> _menuItems = [
    UiKitMenuItem<String>(
      title: 'Active Tiger',
      value: 'tiger',
      icon: ImageWidget(
        svgAsset: GraphicsFoundation.instance.svg.tiger,
      ),
    ),
    UiKitMenuItem<String>(
      title: 'interested Adventurer',
      value: 'adventurer',
      icon: ImageWidget(
        svgAsset: GraphicsFoundation.instance.svg.adventure,
      ),
    ),
    UiKitMenuItem<String>(
      title: 'forever Resting sloth',
      value: 'resting sloth',
      icon: ImageWidget(
        svgAsset: GraphicsFoundation.instance.svg.sleep,
      ),
    ),
    UiKitMenuItem<String>(
      title: 'Active Tiger',
      value: 'tiger',
      icon: ImageWidget(
        svgAsset: GraphicsFoundation.instance.svg.swim,
      ),
    ),
    UiKitMenuItem<String>(
      title: 'Active Tiger',
      value: 'tiger',
      icon: ImageWidget(
        svgAsset: GraphicsFoundation.instance.svg.athlete,
      ),
    ),
    UiKitMenuItem<String>(
      title: 'Active Tiger',
      value: 'tiger',
      icon: ImageWidget(
        svgAsset: GraphicsFoundation.instance.svg.food,
      ),
    ),
  ];
  UiKitMenuItem<String>? _selectedMenuItem;

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
      title: 'UI Kit Stand',
      centerTitle: true,
      autoImplyLeading: true,
      appBarBody: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImageWidget(
            rasterAsset: GraphicsFoundation.instance.png.mockUserAvatar,
            height: 48,
          ),
          SpacingFoundation.verticalSpace4,
          Text(
            'John Doe',
            style: context.uiKitTheme?.boldTextTheme.caption2Bold,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      appBarTrailing: context.badgeButton(
        badgeValue: 2,
        data: BaseUiKitButtonData(
          icon: ImageWidget(
            svgAsset: GraphicsFoundation.instance.svg.message,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UiKitOverflownActionCard(
                action: context.smallButton(
                  data: BaseUiKitButtonData(
                    onPressed: () {},
                    text: 'Check out it',
                  ),
                ),
                title: RichText(
                  key: _gradientTextKey,
                  text: TextSpan(
                    style: context.uiKitTheme?.boldTextTheme.body,
                    children: [
                      const TextSpan(
                        text: 'Selection of the best',
                      ),
                      TextSpan(
                        text: ' free places',
                        style: context.uiKitTheme?.boldTextTheme.subHeadline.copyWith(
                            foreground: Paint()
                              ..style = PaintingStyle.fill
                              ..shader = GradientFoundation.buttonGradient
                                  .createShader(_gradientTextKey.currentContext?.findRenderObject()?.paintBounds ?? Rect.zero)),
                      ),
                    ],
                  ),
                ),
                overflownIcon: ImageWidget(
                  svgAsset: GraphicsFoundation.instance.svg.map,
                ),
                decorationIcons: [],
              ),
              UiKitAccentCard(
                title: 'Ballooning festival',
                additionalInfo: '22-23 March',
                accentMessage: 'Don’t miss',
                image: ImageWidget(
                  rasterAsset: GraphicsFoundation.instance.png.balloons,
                  fit: BoxFit.cover,
                ),
                onPressed: () {},
              ),
              SpacingFoundation.verticalSpace16,
              UiKitSpinnerCard(
                availableHeight: 300,
                photoLink: '',
              ),
              Center(
                child: context.badgeButtonNoValue(
                  data: BaseUiKitButtonData(
                    icon: ImageWidget(
                      svgAsset: GraphicsFoundation.instance.svg.message,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  badgeAlignment: Alignment.topRight,
                ),
              ),
              SpacingFoundation.verticalSpace16,
              const Center(
                child: BigAvatarErrorWidget(
                  text: 'Mellony Martinez Jr',
                ),
              ),
              SpacingFoundation.verticalSpace16,
              const Center(
                child: LargeCircularAvatarErrorWidget(
                  text: 'Mellony Martinez Jr',
                ),
              ),
              SpacingFoundation.verticalSpace16,
              UiKitTagSelector(
                tags: const [
                  'Sport',
                  'More Sport',
                  'Another Sport',
                  'Too Much Sport',
                  'Reading books',
                  'Blogging',
                  'Dancing',
                  'Singing',
                  'Listening to music',
                  'Playing musical instruments (piano, guitar etc.)',
                  'Learning new languages',
                  'Shopping',
                  'Traveling',
                  'Hiking',
                  'Cycling',
                  'Exercising',
                  'Drawing',
                  'Painting',
                  'Collecting things',
                  'Playing computer games',
                  'Cooking',
                  'Baking',
                  'Gardening',
                  'Doing crafts (handmade)',
                  'Embroidering',
                  'Sewing',
                  'Knitting',
                  'Playing board games',
                  'Walking',
                  'Writing stories',
                  'Fishing',
                  'Photography',
                  'Skydiving',
                  'Skating',
                  'Skiing',
                  'Roller skating',
                  'Longboarding',
                  'Surfing',
                ],
              ),
              SpacingFoundation.verticalSpace16,
              GradientableWidget(
                gradient: GradientFoundation.badgeIcon,
                // child: Text('Describe yourself',style: context.uiKitTheme?.boldTextTheme.subHeadline)),
                child: ImageWidget(
                  svgAsset: GraphicsFoundation.instance.svg.cocktail,
                  height: 80,
                  color: Colors.white,
                ),
              ),
              UiKitBorderedChipWithIcon(
                title: 'Active',
                icon: ImageWidget(
                  svgAsset: GraphicsFoundation.instance.svg.map,
                ),
                onPressed: () => setState(() => selection = !selection),
                isSelected: selection,
              ),
              SpacingFoundation.verticalSpace16,
              UiKitMenu<String>(
                title: 'Describe yourself',
                selectedItem: _selectedMenuItem,
                items: _menuItems,
                onSelected: (value) {
                  setState(() => _selectedMenuItem = value);
                },
              ),
              SpacingFoundation.verticalSpace16,
              UiKitTitledSection(
                hasError: true,
                errorText: 'Please fill in this field',
                title: 'Gender',
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: UiKitVerticalChip(
                        selected: selection,
                        caption: 'Male',
                        sign: ImageWidget(
                          svgAsset: GraphicsFoundation.instance.svg.male,
                        ),
                        onTap: () => setState(() => selection = !selection),
                      ),
                    ),
                    SpacingFoundation.horizontalSpace4,
                    Expanded(
                      child: UiKitVerticalChip(
                        selected: selection,
                        caption: 'Female',
                        sign: ImageWidget(
                          svgAsset: GraphicsFoundation.instance.svg.femle,
                        ),
                        onTap: () => setState(() => selection = !selection),
                      ),
                    ),
                    SpacingFoundation.horizontalSpace4,
                    Expanded(
                      child: UiKitVerticalChip(
                        selected: selection,
                        caption: 'Other',
                        sign: ImageWidget(
                          svgAsset: GraphicsFoundation.instance.svg.otherGender,
                        ),
                        onTap: () => setState(() => selection = !selection),
                      ),
                    ),
                  ],
                ).paddingOnly(
                  bottom: EdgeInsetsFoundation.vertical16,
                  left: EdgeInsetsFoundation.horizontal16,
                  right: EdgeInsetsFoundation.horizontal16,
                ),
              ),
              SpacingFoundation.verticalSpace16,
              Center(
                child: UiKitImportanceChip(
                  title: 'Importance',
                  importance: ImportanceChip.none,
                ),
              ),
              SpacingFoundation.verticalSpace16,
              Center(
                child: context.badgeButton(
                  data: BaseUiKitButtonData(
                    icon: ImageWidget(
                      svgAsset: GraphicsFoundation.instance.svg.message,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  badgeValue: 2,
                ),
              ),
              SpacingFoundation.verticalSpace16,
              UiKitHorizontalWheelNumberSelector(
                title: 'Your age',
                values: List<int>.generate(70, (index) => 10 + index),
                onValueChanged: (value) {},
              ),
              SpacingFoundation.verticalSpace16,
              context.notificationPopUp(
                primaryActionWidget: context.smallButton(
                    data: BaseUiKitButtonData(
                  text: 'Ok',
                  onPressed: () {},
                )),
                dismissActionWidget: context.smallOutlinedButton(
                  data: BaseUiKitButtonData(text: 'Cancel', onPressed: () {}),
                  color: Colors.white.withOpacity(0.5),
                ),
                requiredData: NotificationPopupRequiredData(
                  titleString: 'Yoga today at Palm Jumeirah. You go?',
                  icon: ImageWidget(
                    svgAsset: GraphicsFoundation.instance.svg.heartInHandEmoji,
                  ),
                ),
                hasShadow: true,
              ),
              SpacingFoundation.verticalSpace16,
              context.notificationPopUp(
                primaryActionWidget: context.smallButton(
                  data: BaseUiKitButtonData(text: 'Ok', onPressed: () {}),
                ),
                dismissActionWidget: context.smallOutlinedButton(
                  data: BaseUiKitButtonData(text: 'Cancel', onPressed: () {}),
                  color: Colors.white.withOpacity(0.5),
                ),
                requiredData: NotificationPopupRequiredData(
                  titleString: 'Yoga today at Palm Jumeirah. You go?',
                  icon: ImageWidget(
                    svgAsset: GraphicsFoundation.instance.svg.heartInHandEmoji,
                  ),
                ),
              ),
              SpacingFoundation.verticalSpace16,
              context.notificationPopUp(
                hasShadow: true,
                primaryActionWidget: context.smallButton(
                  data: BaseUiKitButtonData(text: 'Ok', onPressed: () {}),
                ),
                secondaryActionWidget: context.smallOutlinedButton(
                  data: BaseUiKitButtonData(text: 'text', onPressed: () {}),
                ),
                dismissActionWidget: context.smallOutlinedButton(
                  data: BaseUiKitButtonData(text: 'Cancel', onPressed: () {}),
                  color: Colors.white.withOpacity(0.5),
                ),
                requiredData: NotificationPopupRequiredData(
                  titleString: 'Yoga today at Palm Jumeirah. You go?',
                  icon: ImageWidget(
                    svgAsset: GraphicsFoundation.instance.svg.heartInHandEmoji,
                  ),
                ),
              ),
              SpacingFoundation.verticalSpace16,
              context.notificationPopUp(
                primaryActionWidget: context.smallButton(
                  data: BaseUiKitButtonData(text: 'Ok', onPressed: () {}),
                ),
                dismissActionWidget: context.smallOutlinedButton(
                  data: BaseUiKitButtonData(text: 'Cancel', onPressed: () {}),
                  color: Colors.white.withOpacity(0.5),
                ),
                secondaryActionWidget: context.smallOutlinedButton(
                  data: BaseUiKitButtonData(text: 'text', onPressed: () {}),
                ),
                requiredData: NotificationPopupRequiredData(
                  titleString: 'Yoga today at Palm Jumeirah. You go?',
                  icon: ImageWidget(
                    svgAsset: GraphicsFoundation.instance.svg.heartInHandEmoji,
                  ),
                ),
              ),
              SpacingFoundation.verticalSpace16,
              Center(
                child: UiKitGradientQuestionChip(
                  message: 'Tell us more',
                  onTap: () {},
                ),
              ),
              SpacingFoundation.verticalSpace16,
              BlurredCardWithBorder(
                border: GradientFoundation.gradientBorder,
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
                            data: BaseUiKitButtonData(text: 'Not often', onPressed: () {}),
                          ),
                        ),
                        SpacingFoundation.horizontalSpace12,
                        Expanded(
                          child: context.smallButton(
                            data: BaseUiKitButtonData(text: 'Very often', onPressed: () {}),
                          ),
                        ),
                      ],
                    ),
                    SpacingFoundation.verticalSpace8,
                    context.smallOutlinedButton(
                      color: Colors.white.withOpacity(0.5),
                      data: BaseUiKitButtonData(text: 'Hard to answer', onPressed: () {}),
                    ),
                  ],
                ),
              ),
              SpacingFoundation.verticalSpace16,
              BlurredCardWithBorder(
                border: GradientFoundation.gradientBorder,
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
                onPressed: () {},
              ),
              SpacingFoundation.verticalSpace16,
              Center(
                child: UiKitBlurredQuestionChip(
                  label: 'how it\nworks',
                  onTap: () {},
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
                      onPressed: () {},
                      message: 'Want to have some fun',
                      icon: ImageWidget(
                        svgAsset: GraphicsFoundation.instance.svg.smileyCrazyFaceEmoji,
                      ),
                      layoutDirection: Axis.vertical,
                    ),
                    SpacingFoundation.horizontalSpace12,
                    UiKitMessageCardWithIcon(
                      onPressed: () {},
                      message: 'Want to have',
                      icon: ImageWidget(
                        svgAsset: GraphicsFoundation.instance.svg.angryEmoji,
                      ),
                      layoutDirection: Axis.vertical,
                    ),
                    SpacingFoundation.horizontalSpace12,
                    UiKitMessageCardWithIcon(
                      onPressed: () {},
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
                onPressed: () {},
                message: 'need to cool down a bit?',
                icon: ImageWidget(
                  svgAsset: GraphicsFoundation.instance.svg.smileyCrazyFaceEmoji,
                ),
                layoutDirection: Axis.horizontal,
              ),
              SpacingFoundation.verticalSpace16,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    context.gradientButton(
                      data: BaseUiKitButtonData(
                          icon: ImageWidget(
                            svgAsset: GraphicsFoundation.instance.svg.dice,
                          ),
                          onPressed: () {}),
                    ),
                    SpacingFoundation.horizontalSpace12,
                    UiKitTitledFilterChip(
                      title: 'Favorites',
                      icon: GraphicsFoundation.instance.svg.star.path,
                      selected: false,
                      onPressed: () {},
                    ),
                    SpacingFoundation.horizontalSpace12,
                    UiKitTitledFilterChip(
                      title: 'Clubs',
                      icon: GraphicsFoundation.instance.svg.cocktail.path,
                      selected: true,
                      onPressed: () {},
                    ),
                    SpacingFoundation.horizontalSpace12,
                    UiKitTitledFilterChip(
                      title: 'Clubs',
                      icon: GraphicsFoundation.instance.svg.cocktail.path,
                      selected: false,
                      onPressed: () {},
                    ),
                    SpacingFoundation.horizontalSpace12,
                    UiKitTitledFilterChip(
                      title: 'Favorites',
                      icon: GraphicsFoundation.instance.svg.star.path,
                      selected: false,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SpacingFoundation.verticalSpace16,
              IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: UiKitGradientAttentionCard(
                        message: 'Then check this out',
                        textColor: Colors.black,
                        width: 70,
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
                    data: BaseUiKitButtonData(
                        onPressed: () {},
                        icon: ImageWidget(
                          svgAsset: GraphicsFoundation.instance.svg.route,
                          color: Colors.white,
                        )),
                  ),
                  SpacingFoundation.horizontalSpace12,
                  Expanded(
                    child: context.gradientButton(
                      data: BaseUiKitButtonData(text: 'Book it', onPressed: () {}),
                    ),
                  ),
                  SpacingFoundation.horizontalSpace12,
                  context.outlinedButton(
                    data: BaseUiKitButtonData(
                        onPressed: () {},
                        icon: ImageWidget(
                          svgAsset: GraphicsFoundation.instance.svg.searchPeople,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
              SpacingFoundation.verticalSpace16,
              Row(
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
                      vectorIconAsset: GraphicsFoundation.instance.svg.money,
                      action: () {},
                    ),
                  ),
                ],
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
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                  UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path),
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
              const UiKitDescriptionGrid(
                spacing: 16,
                children: [
                  DescriptionGridData(
                    title: 'Title',
                    value: 'DescriptionDescriptionDescriptionDescription',
                  ),
                  DescriptionGridData(
                    title: 'Title',
                    value: 'DescriptionDescriptionDescriptionDescription',
                  ),
                  DescriptionGridData(
                    title: 'Title',
                    value: 'DescriptionDescriptionDescriptionDescription',
                  ),
                  DescriptionGridData(
                    title: 'Title',
                    value: 'DescriptionDescriptionDescriptionDescription',
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
              SliderPlaceCard(
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
                    UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                    UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                    UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                    UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                    UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                    UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                    UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                    UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                    UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                    UiKitTag(title: 'Cheap', iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                  ],
                ),
              ),
              SpacingFoundation.bottomNavigationBarSpacing,
            ],
          ),
        ).paddingAll(EdgeInsetsFoundation.all16),
      ),
    );
  }
}
