import 'package:example/presentation/ui/showcase/buttons_grid.dart';
import 'package:example/presentation/ui/showcase/buttons_list.dart';
import 'package:example/presentation/ui/showcase/input_fields.dart';
import 'package:example/presentation/ui/showcase/input_fields_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AllWidgetsStand extends StatefulWidget {
  const AllWidgetsStand({super.key});

  @override
  State<AllWidgetsStand> createState() => _AllWidgetsStandState();
}

class _AllWidgetsStandState extends State<AllWidgetsStand> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final ScrollController _scrollController = ScrollController();
  final GlobalKey _gradientTextKey = GlobalKey();
  double progress = 0.0;
  CountryModel? _selectedCountry;

  bool selection = false;
  final List<UiKitMenuItem<String>> _menuItems = [
    UiKitMenuItem<String>(
      title: 'Active Tiger',
      value: 'tiger',
      iconPath: GraphicsFoundation.instance.svg.tiger.path,
      type: 'leisure',
    ),
    UiKitMenuItem<String>(
      title: 'interested Adventurer',
      value: 'adventurer',
      iconPath: GraphicsFoundation.instance.svg.adventure.path,
      type: 'leisure',
    ),
    UiKitMenuItem<String>(
      title: 'forever Resting sloth',
      value: 'resting sloth',
      iconPath: GraphicsFoundation.instance.svg.sleep.path,
      type: 'leisure',
    ),
    UiKitMenuItem<String>(
      title: 'Active Tiger',
      value: 'tiger',
      iconPath: GraphicsFoundation.instance.svg.swim.path,
      type: 'leisure',
    ),
    UiKitMenuItem<String>(
      title: 'Active Tiger',
      value: 'tiger',
      iconPath: GraphicsFoundation.instance.svg.athlete.path,
      type: 'leisure',
    ),
    UiKitMenuItem<String>(
      title: 'Active Tiger',
      value: 'tiger',
      iconPath: GraphicsFoundation.instance.svg.food.path,
      type: 'leisure',
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
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return BlurredAppBarPage(
      title: 'Edit Profile',
      autoImplyLeading: true,
      centerTitle: true,
      appBarBody: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularAvatar(
            avatarUrl: '',
            name: 'true false',
            height: 48,
          ),
          SpacingFoundation.verticalSpace4,
          InkWell(
            onTap: () {},
            child: Text(
              'Change Photo',
              style: context.uiKitTheme?.boldTextTheme.caption1Bold,
            ),
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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SpacingFoundation.verticalSpace16,
              FingerprintSwitch(
                child: FingerprintButton(
                  animationPath: GraphicsFoundation
                      .instance.animations.lottie.animationTouchId.path,
                  title: Text(
                    'Guess',
                    style: context.uiKitTheme?.boldTextTheme.subHeadline,
                  ),
                ),
              ),
              SpacingFoundation.verticalSpace16,
              UiKitLeadingRadioTile(
                selected: selection,
                avatarLink: GraphicsFoundation.instance.png.inviteMock1.path,
                title: 'La Vue Citytel Group',
                tags: [
                  UiKitTag(
                    title: 'Restaurant',
                    iconPath: GraphicsFoundation.instance.svg.cutlery.path,
                  ),
                  UiKitTag(
                    title: 'Club',
                    iconPath: GraphicsFoundation.instance.svg.cocktail.path,
                  ),
                  UiKitTag(
                    title: 'Shuffle',
                    iconPath: GraphicsFoundation.instance.svg.shuffleWhite.path,
                  ),
                ],
                onTap: () => setState(() => selection = !selection),
              ),
              SpacingFoundation.verticalSpace16,
              UiKitTitledActionCard(
                title: 'Create your place and invite people',
                body: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UiKitActionCardTile(
                      title: '80’s theme invites only party ',
                      subtitle: 'in 1 day',
                      onTap: () {},
                      leadingImagePath:
                          GraphicsFoundation.instance.png.eventAvatar.path,
                    ),
                    SpacingFoundation.verticalSpace16,
                    UiKitActionCardTile(
                      title: '80’s theme invites only party ',
                      subtitle: 'in 1 day',
                      onTap: () {},
                      leadingImagePath:
                          GraphicsFoundation.instance.png.mockAvatar.path,
                    ),
                  ],
                ),
                actionButton: context.gradientButton(
                  data: BaseUiKitButtonData(
                    text: 'Create place'.toUpperCase(),
                    onPressed: () {},
                  ),
                ),
              ),
              SpacingFoundation.verticalSpace16,
              ProfileCard(
                name: 'Csa Csa',
                tags: [
                  UiKitTag(
                    title: 'Restaurant',
                    iconPath: GraphicsFoundation.instance.svg.cutlery.path,
                  ),
                ],
                profileStats: [
                  UiKitStats(
                    title: 'Invited',
                    value: 934,
                    actionButton: context.smallButton(
                      data: BaseUiKitButtonData(
                        text: 'MORE',
                        onPressed: () {},
                      ),
                    ),
                  ),
                  UiKitStats(
                    title: 'Booked',
                    value: 133,
                    actionButton: context.smallButton(
                      data: BaseUiKitButtonData(
                        text: 'MORE',
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
                interests: [
                  'Tourists',
                  'Luxury',
                ],
                badge: DynamicGradientPlate(
                  content: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'shuffle',
                        style: textTheme?.caption1Bold
                            .copyWith(color: Colors.black),
                      ),
                      ImageWidget(
                        svgAsset:
                            GraphicsFoundation.instance.svg.memeberGradientStar,
                      ),
                    ],
                  ),
                ),
                profileType: ProfileCardType.company,
                avatarUrl: '',
              ),
              SpacingFoundation.verticalSpace16,
              UiKitPhoneNumberInput(
                controller: TextEditingController(),
                enabled: true,
                countryCode: _selectedCountry?.countryPhoneCode,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              SpacingFoundation.verticalSpace16,
              UiKitCountrySelector(
                title: 'Where are you located',
                onSelected: (country) => setState(() {
                  _selectedCountry = country;
                }),
                selectedCountry: _selectedCountry,
              ),
              SpacingFoundation.verticalSpace16,
              const UiKitCodeInputField(codeDigitsCount: 4),
              SpacingFoundation.verticalSpace16,
              UiKitHorizontalWheelNumberSelector(
                title: 'Your age',
                values: List<int>.generate(70, (index) => 10 + index),
                onValueChanged: (value) {},
              ),
              SpacingFoundation.verticalSpace16,
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  UiKitReactionPreview(
                    imagePath: 'assets/images/png/profile_story_1.png',
                    viewed: false,
                    onTap: () {},
                  ),
                  SpacingFoundation.horizontalSpace16,
                  UiKitReactionPreview(
                    imagePath: 'assets/images/png/profile_story_1.png',
                    viewed: true,
                    onTap: () {},
                  ),
                ],
              ),
              SpacingFoundation.verticalSpace16,
              UiKitHorizontalScroll3D(
                  itemBuilder: (BuildContext context, int index) =>
                      UiKitFindSomeoneCard(
                          avatarUrl: GraphicsFoundation
                              .instance.png.mockUserAvatar.path,
                          userNickName: 'naveen',
                          userName: 'Naveen Sheoran',
                          userPoints: 555,
                          sameInterests: 4,
                          onMessage: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Send message'),
                              ),
                            );
                          }),
                  itemCount: 5),
              SpacingFoundation.verticalSpace16,
              UiKitFeedbackCard(
                avatarUrl: GraphicsFoundation.instance.png.atmosphere.path,
                title: 'At.mosphere',
                datePosted: DateTime.now().subtract(const Duration(days: 2)),
                rating: 5,
                companyAnswered: false,
                helpfulCount: 1,
                text: 'Came for lunch with my sister. '
                    'We loved our Thai-style mains which were amazing with lots of flavour, very impressive for a vegetarian restaurant. '
                    'But the service was below average and the chips were too terrible to finish.',
                onPressed: () {},
                onLike: () {},
              ),
              SpacingFoundation.verticalSpace16,
              UiKitPopUpMenuTile(
                title: 'Eugene Carter',
                titleIcon: ImageWidget(
                  svgAsset: GraphicsFoundation.instance.svg.memeberGradientStar,
                ),
                subtitle: '@raceboi',
                leading: BorderedUserCircleAvatar(
                  imageUrl: GraphicsFoundation.instance.png.mockUserAvatar.path,
                  name: 'Eugene Carter',
                  size: 48,
                  border: GradientFoundation.gradientBorder,
                ),
                menuOptions: [
                  UiKitPopUpMenuButtonOption(
                    title: 'Follow',
                    value: 'Follow',
                    onTap: () {},
                  ),
                  UiKitPopUpMenuButtonOption(
                    title: 'Message',
                    value: 'message',
                    onTap: () {},
                  ),
                ],
              ),
              SpacingFoundation.verticalSpace16,
              UiKitPopUpMenuTile(
                title: 'Eugene Carter',
                titleIcon: ImageWidget(
                  svgAsset: GraphicsFoundation.instance.svg.memeberGradientStar,
                ),
                subtitle: '@raceboi',
                leading: BorderedUserCircleAvatar(
                  imageUrl: GraphicsFoundation.instance.png.mockUserAvatar.path,
                  name: 'Eugene Carter',
                  size: 48,
                  border: GradientFoundation.gradientBorder,
                ),
                menuOptions: [
                  UiKitPopUpMenuButtonOption(
                    title: 'Unfollow',
                    value: 'unfollow',
                    onTap: () {
                      showDialog(
                        context: context,
                        useSafeArea: false,
                        builder: (context) => CompactAlertPopUp(
                          title: 'You unsubscribed from',
                          body: 'Eugene Carter',
                          action: context.dialogButton(
                            dialogButtonType: DialogButtonType.buttonBlack,
                            data: BaseUiKitButtonData(
                              text: 'okay, cool!',
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  UiKitPopUpMenuButtonOption(
                    title: 'Message',
                    value: 'message',
                    onTap: () {},
                  ),
                ],
              ),
              SpacingFoundation.verticalSpace16,
              UiKitExtendedFeedbackCard(
                title: 'Marry Williams',
                avatarUrl: GraphicsFoundation.instance.png.mockUserAvatar.path,
                datePosted: DateTime.now().subtract(const Duration(days: 2)),
                text: 'Came for lunch with my sister. '
                    'We loved our Thai-style mains which were amazing with lots of flavour, very impressive for a vegetarian restaurant. '
                    'But the service was below average and the chips were too terrible to finish.',
                helpfulCount: 1,
                onEdit: () {},
                onDelete: () {},
              ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal32),
              SpacingFoundation.verticalSpace16,
              UiKitDecoratedActionCard(
                title: 'Notifications',
                action: context.smallButton(
                  data: BaseUiKitButtonData(
                    onPressed: () {},
                    text: 'SEE ALL',
                  ),
                ),
                decorationIcons: [
                  ActionCardDecorationIconData(
                    iconLink: GraphicsFoundation.instance.svg.networking.path,
                    position: DecorationIconPosition(
                      right: 42,
                      top: -5,
                    ),
                    iconSize: 92,
                  ),
                  ActionCardDecorationIconData(
                    iconLink:
                        GraphicsFoundation.instance.svg.bellNotification.path,
                    position: DecorationIconPosition(
                      right: 0,
                      top: 4,
                    ),
                    rotationAngle: 24,
                  ),
                ],
              ),
              SpacingFoundation.verticalSpace16,
              UiKitGradientSwitchTile(
                title: 'Show my profile',
                switchedOn: selection,
                onChanged: (value) => setState(() => selection = value),
              ),
              SpacingFoundation.verticalSpace16,
              const Center(child: MemberPlate()),
              SpacingFoundation.verticalSpace16,
              context.buttonWithProgress(
                data: BaseUiKitButtonData(
                  text: 'NEXT >>>',
                  onPressed: () => setState(() {
                    progress += 0.33;
                    if (progress > 1) progress = 0;
                  }),
                ),
                progress: progress,
              ),
              SpacingFoundation.verticalSpace16,
              UiKitCompactOrderedRatingCard(
                order: 1,
                rating: 4.5,
                title: 'Adventure Water Park',
                imageLink:
                    GraphicsFoundation.instance.png.compactRatingCardMock.path,
                onPressed: () {},
              ),
              SpacingFoundation.verticalSpace16,
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
                        text: '\nfree places',
                        style: context.uiKitTheme?.boldTextTheme.subHeadline
                            .copyWith(
                                // foreground: Paint()
                                //   ..style = PaintingStyle.fill
                                //   ..shader = GradientFoundation.buttonGradient
                                //       .createShader(_gradientTextKey.currentContext?.findRenderObject()?.paintBounds ?? Rect.zero),
                                ),
                      ),
                    ],
                  ),
                ),
                overflownIconLink: GraphicsFoundation.instance.svg.map.path,
                decorationIcons: [
                  ActionCardDecorationIconData(
                    iconLink: GraphicsFoundation.instance.svg.coin.path,
                    position: DecorationIconPosition(
                      top: 4,
                      right: -4,
                    ),
                    iconSize: 24,
                    rotationAngle: -26,
                  ),
                  ActionCardDecorationIconData(
                    iconLink: GraphicsFoundation.instance.svg.coin.path,
                    iconSize: 27,
                    position: DecorationIconPosition(
                      bottom: 0,
                      right: 64,
                    ),
                    rotationAngle: 47.5,
                  ),
                  ActionCardDecorationIconData(
                    iconLink: GraphicsFoundation.instance.svg.icecream.path,
                    position: DecorationIconPosition(
                      right: 86,
                      bottom: 0,
                    ),
                    rotationAngle: -15,
                  ),
                  ActionCardDecorationIconData(
                    iconLink: GraphicsFoundation.instance.svg.firstAidKit.path,
                    iconSize: 44,
                    position: DecorationIconPosition(
                      top: 32,
                      right: 69,
                    ),
                    rotationAngle: 30,
                  ),
                  ActionCardDecorationIconData(
                    iconLink: GraphicsFoundation.instance.svg.coin.path,
                    iconSize: 34,
                    position: DecorationIconPosition(
                      top: 8,
                      right: 30,
                    ),
                    rotationAngle: 0,
                  ),
                ],
              ),
              SpacingFoundation.verticalSpace16,
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
                child: UiKitTitledCardWithBackground(
                  onPressed: () {},
                  title: 'Active Holidays',
                  backgroundImageLink: GraphicsFoundation
                      .instance.png.titledCardBackground1.path,
                  backgroundColor: ColorsFoundation.brightYellow,
                ),
              ),
              SpacingFoundation.verticalSpace16,
              Center(
                child: UiKitTitledCardWithBackground(
                  onPressed: () {},
                  title: 'Big Company',
                  backgroundImageLink: GraphicsFoundation
                      .instance.png.titledCardBackground2.path,
                  backgroundColor: ColorsFoundation.red,
                ),
              ),
              SpacingFoundation.verticalSpace16,
              Center(
                child: UiKitTitledCardWithBackground(
                  onPressed: () {},
                  title: 'Electronic Music',
                  backgroundImageLink: GraphicsFoundation
                      .instance.png.titledCardBackground3.path,
                  backgroundColor: ColorsFoundation.pink,
                ),
              ),
              SpacingFoundation.verticalSpace16,
              const UiKitSpinnerCard(
                availableHeight: 400,
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
              UiKitMenu<String>(
                title: 'Describe yourself',
                selectedItem: _selectedMenuItem,
                items: [
                  ..._menuItems,
                  UiKitMenuItem<String>(
                    title: 'Active Tiger Business',
                    value: 'tiger',
                    iconPath: GraphicsFoundation.instance.svg.swim.path,
                    type: 'business',
                  ),
                  UiKitMenuItem<String>(
                    title: 'Active Tiger Business',
                    value: 'tiger',
                    iconPath: GraphicsFoundation.instance.svg.athlete.path,
                    type: 'business',
                  ),
                  UiKitMenuItem<String>(
                    title: 'Active Tiger Business',
                    value: 'tiger',
                    iconPath: GraphicsFoundation.instance.svg.food.path,
                    type: 'business',
                  ),
                ],
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
                            data: BaseUiKitButtonData(
                                text: 'Not often', onPressed: () {}),
                          ),
                        ),
                        SpacingFoundation.horizontalSpace12,
                        Expanded(
                          child: context.smallButton(
                            data: BaseUiKitButtonData(
                                text: 'Very often', onPressed: () {}),
                          ),
                        ),
                      ],
                    ),
                    SpacingFoundation.verticalSpace8,
                    context.smallOutlinedButton(
                      color: Colors.white.withOpacity(0.5),
                      data: BaseUiKitButtonData(
                          text: 'Hard to answer', onPressed: () {}),
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
                      svgAsset:
                          GraphicsFoundation.instance.svg.heartInHandEmoji,
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
                        svgAsset: GraphicsFoundation
                            .instance.svg.smileyCrazyFaceEmoji,
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
                        svgAsset: GraphicsFoundation
                            .instance.svg.smileyCrazyFaceEmoji,
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
                  svgAsset:
                      GraphicsFoundation.instance.svg.smileyCrazyFaceEmoji,
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
                    const Expanded(
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
                                svgAsset:
                                    GraphicsFoundation.instance.svg.fireWhite,
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
                      data: BaseUiKitButtonData(
                          text: 'Book it', onPressed: () {}),
                    ),
                  ),
                  SpacingFoundation.horizontalSpace12,
                  context.outlinedButton(
                    data: BaseUiKitButtonData(
                        onPressed: () {},
                        icon: ImageWidget(
                          svgAsset:
                              GraphicsFoundation.instance.svg.searchPeople,
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
                  UiKitMediaPhoto(
                      link: GraphicsFoundation.instance.png.place.path),
                  UiKitMediaPhoto(
                      link: GraphicsFoundation.instance.png.place.path),
                  UiKitMediaPhoto(
                      link: GraphicsFoundation.instance.png.place.path),
                  UiKitMediaPhoto(
                      link: GraphicsFoundation.instance.png.place.path),
                  UiKitMediaVideo(
                      link: GraphicsFoundation.instance.png.place.path),
                ],
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Sed euismod, nunc ut tincidunt lacinia, nisl nisl aliquam nisl, vitae aliquam nisl nisl sit amet nunc. '
                    'Nulla facilisi. '
                    'Donec auctor, nisl eget aliquam tincidunt, nunc nisl aliquam nisl, vitae aliquam nisl nisl sit amet nunc. '
                    'Nulla facilisi',
                rating: 4.8,
                baseTags: [
                  UiKitTag(
                      title: 'Cheap',
                      iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                  UiKitTag(
                      title: 'Cheap',
                      iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                  UiKitTag(
                      title: 'Cheap',
                      iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                  UiKitTag(
                      title: 'Cheap',
                      iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                  UiKitTag(
                      title: 'Cheap',
                      iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                  UiKitTag(
                      title: 'Cheap',
                      iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                  UiKitTag(
                      title: 'Cheap',
                      iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                  UiKitTag(
                      title: 'Cheap',
                      iconPath: GraphicsFoundation.instance.svg.cocktail.path),
                ],
                uniqueTags: [
                  UiKitTag(
                      title: 'Cheap',
                      iconPath: GraphicsFoundation.instance.svg.dice.path,
                      unique: true),
                  UiKitTag(
                      title: 'Cheap',
                      iconPath: GraphicsFoundation.instance.svg.dice.path,
                      unique: true),
                  UiKitTag(
                      title: 'Cheap',
                      iconPath: GraphicsFoundation.instance.svg.dice.path,
                      unique: true),
                  UiKitTag(
                      title: 'Cheap',
                      iconPath: GraphicsFoundation.instance.svg.dice.path,
                      unique: true),
                  UiKitTag(
                      title: 'Cheap',
                      iconPath: GraphicsFoundation.instance.svg.dice.path,
                      unique: true),
                  UiKitTag(
                      title: 'Cheap',
                      iconPath: GraphicsFoundation.instance.svg.dice.path,
                      unique: true),
                  UiKitTag(
                      title: 'Cheap',
                      iconPath: GraphicsFoundation.instance.svg.dice.path,
                      unique: true),
                  UiKitTag(
                      title: 'Cheap',
                      iconPath: GraphicsFoundation.instance.svg.dice.path,
                      unique: true),
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
                    UiKitMediaVideo(
                        link: GraphicsFoundation.instance.png.place.path),
                    UiKitMediaPhoto(
                        link: GraphicsFoundation.instance.png.place.path),
                    UiKitMediaPhoto(
                        link: GraphicsFoundation.instance.png.place.path),
                    UiKitMediaPhoto(
                        link: GraphicsFoundation.instance.png.place.path),
                    UiKitMediaPhoto(
                        link: GraphicsFoundation.instance.png.place.path),
                  ],
                  title: 'Virgins on the beach',
                  placeTags: [
                    UiKitTag(
                        title: 'Cheap',
                        iconPath:
                            GraphicsFoundation.instance.svg.cocktail.path),
                    UiKitTag(
                        title: 'Cheap',
                        iconPath:
                            GraphicsFoundation.instance.svg.cocktail.path),
                    UiKitTag(
                        title: 'Cheap',
                        iconPath:
                            GraphicsFoundation.instance.svg.cocktail.path),
                    UiKitTag(
                        title: 'Cheap',
                        iconPath:
                            GraphicsFoundation.instance.svg.cocktail.path),
                    UiKitTag(
                        title: 'Cheap',
                        iconPath:
                            GraphicsFoundation.instance.svg.cocktail.path),
                    UiKitTag(
                        title: 'Cheap',
                        iconPath:
                            GraphicsFoundation.instance.svg.cocktail.path),
                    UiKitTag(
                        title: 'Cheap',
                        iconPath:
                            GraphicsFoundation.instance.svg.cocktail.path),
                    UiKitTag(
                        title: 'Cheap',
                        iconPath:
                            GraphicsFoundation.instance.svg.cocktail.path),
                    UiKitTag(
                        title: 'Cheap',
                        iconPath:
                            GraphicsFoundation.instance.svg.cocktail.path),
                    UiKitTag(
                        title: 'Cheap',
                        iconPath:
                            GraphicsFoundation.instance.svg.cocktail.path),
                  ],
                ),
              ),
              SpacingFoundation.verticalSpace16,
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(PopUpVideoPlayer(
                      videoUri:
                          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
                },
                child: const Text(
                  'Show Horizontal Video',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SpacingFoundation.verticalSpace16,
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(PopUpVideoPlayer(
                      videoUri:
                          'https://www.exit109.com/~dnn/clips/RW20seconds_1.mp4'));
                },
                child: const Text(
                  'Show Vertical Video',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SpacingFoundation.verticalSpace16,
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(PopUpVideoPlayer(
                      videoUri:
                          'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'));
                },
                child: const Text(
                  'Show Another Horizontal Video',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SpacingFoundation.bottomNavigationBarSpacing,
            ],
          ),
        ).paddingAll(EdgeInsetsFoundation.zero),
      ),
    );
  }
}
