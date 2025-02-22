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
  final TextEditingController _emojitextEditingController = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _urlController = TextEditingController();

  // final ScrollController _scrollController = ScrollController();
  final GlobalKey _gradientTextKey = GlobalKey();
  double progress = 0.0;
  String _selectedDropDownValue = '_selectedMenuItem';
  CountryModel? _selectedCountry;
  CustomBackgroundSwitchOption selectedOption = CustomBackgroundSwitchOption(
      title: 'Personal', iconLink: GraphicsFoundation.instance.svg.personLayered.path, value: 'user');

  bool selection = false;
  bool switchValue = false;
  final List<UiKitMenuItem<String>> _menuItems = [
    UiKitMenuItem<String>(
      title: 'Active Tiger',
      value: 'tiger',
      iconLink: GraphicsFoundation.instance.svg.tiger.path,
      type: 'leisure',
    ),
    UiKitMenuItem<String>(
      title: 'interested Adventurer',
      value: 'adventurer',
      iconLink: GraphicsFoundation.instance.svg.adventure.path,
      type: 'leisure',
    ),
    UiKitMenuItem<String>(
      title: 'forever Resting sloth',
      value: 'resting sloth',
      iconLink: GraphicsFoundation.instance.svg.sleep.path,
      type: 'leisure',
    ),
    UiKitMenuItem<String>(
      title: 'Active Tiger',
      value: 'tiger',
      iconLink: GraphicsFoundation.instance.svg.swim.path,
      type: 'leisure',
    ),
    UiKitMenuItem<String>(
      title: 'Active Tiger',
      value: 'tiger',
      iconLink: GraphicsFoundation.instance.svg.athlete.path,
      type: 'leisure',
    ),
    UiKitMenuItem<String>(
      title: 'Active Tiger',
      value: 'tiger',
      iconLink: GraphicsFoundation.instance.svg.food.path,
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
    final isLightTheme = context.uiKitTheme?.themeMode == ThemeMode.light;
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

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
          iconInfo: BaseUiKitButtonIconData(
            iconData: ShuffleUiKitIcons.message,
            color: context.uiKitTheme?.colorScheme.inversePrimary,
          ),
          onPressed: () {},
        ),
      ),
      children: [
        SpacingFoundation.verticalSpace16,
        UiKitInputFieldNoIcon(
          controller: _urlController,
          fillColor: Colors.green,
          borderRadius: BorderRadiusFoundation.all12,
          onSubmitted: (p0) {
            UrlValidator.validateUrl(_urlController.text.trim()).then(
              (str) {
                debugPrint('validate result $str');
              },
            );
          },
        ),
        SpacingFoundation.verticalSpace16,
        UiKitDigestCard(
          title: "Don't miss the opportunity",
          underTitleText: "Visit 4 exciting events this week from 12.09 to 15.09. Read the digest and run quickly!",
          digestUiModels: [
            DigestUiModel(
              title: 'Virgins on the beach',
              imageUrl: GraphicsFoundation.instance.png.leto2.path,
              tags: [
                UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail),
                UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail),
                UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail),
              ],
              rating: 5,
              contentDescription:
                  "Came for lunch with my sister. We loved our Thai-style mains which were amazing with lots of flavour, very impressive for a vegetarian restaurant...",
              description:
                  "Welcome to Harmony Haven Yoga, your sanctuary for inner peace and physical well-being. Nestled in a serene and inviting space, Harmony Haven offers a diverse range of yoga classes designed to suit all levels, from beginners to seasoned practitioners.",
            ),
            DigestUiModel(
              title: 'Virgins on the beach',
              imageUrl: GraphicsFoundation.instance.png.leto2.path,
              tags: [
                UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail),
                UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail),
                UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail),
              ],
              contentDescription:
                  "Came for lunch with my sister. We loved our Thai-style mains which were amazing with lots of flavour, very impressive for a vegetarian restaurant...",
              description:
                  "Welcome to Harmony Haven Yoga, your sanctuary for inner peace and physical well-being. Nestled in a serene and inviting space, Harmony Haven offers a diverse range of yoga classes designed to suit all levels, from beginners to seasoned practitioners.",
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
        SpacingFoundation.verticalSpace16,
        UiKitContentUpdatesCard(
          authorSpeciality: 'Friendly neighbour',
          authorUsername: 'spiderman',
          authorAvatarUrl: GraphicsFoundation.instance.png.avatars.avatar1.path,
          authorName: 'Peter Parker',
          authorUserType: UserTileType.influencer,
          children: [
            UiKitStaggeredMediaRow(
              mediaList: [
                UiKitMediaPhoto(link: GraphicsFoundation.instance.png.placeSocial1.path),
                UiKitMediaPhoto(link: GraphicsFoundation.instance.png.placeSocial2.path),
                UiKitMediaPhoto(link: GraphicsFoundation.instance.png.placeSocial3.path),
                UiKitMediaPhoto(link: GraphicsFoundation.instance.png.placeSocial4.path),
                UiKitMediaPhoto(link: GraphicsFoundation.instance.png.serviceSocial1.path),
                UiKitMediaPhoto(link: GraphicsFoundation.instance.png.serviceSocial2.path),
                UiKitMediaPhoto(link: GraphicsFoundation.instance.png.serviceSocial3.path),
                UiKitMediaPhoto(link: GraphicsFoundation.instance.png.serviceSocial4.path),
              ],
              visibleMediaCount: 4,
            ),
            UiKitContentUpdateWithLeadingImage(
              imageUrl: GraphicsFoundation.instance.png.placeSocial2.path,
              iconData: ShuffleUiKitIcons.starfill,
              title: S.current.PlusXNewReviews(10),
              subtitle: 'Virgins on the beach',
            ),
            UiKitContentUpdateWithLeadingImage(
              imageUrl: GraphicsFoundation.instance.png.placeSocial1.path,
              iconData: ShuffleUiKitIcons.voice,
              title: S.current.PlusXNewVoices(10),
              subtitle: 'Virgins on the beach',
            ),
            UiKitCustomChildContentUpdateWidget(
              height: 0.125.sw * 1.7,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  UiKitReactionPreview(
                    viewed: true,
                    isEmpty: false,
                    imagePath: GraphicsFoundation.instance.png.serviceSocial4.path,
                    customHeight: 0.125.sw * 1.7,
                    customWidth: 0.125.sw,
                  ),
                  SpacingFoundation.horizontalSpace8,
                  UiKitReactionPreview(
                    viewed: true,
                    isEmpty: false,
                    imagePath: GraphicsFoundation.instance.png.serviceSocial3.path,
                    customHeight: 0.125.sw * 1.7,
                    customWidth: 0.125.sw,
                  ),
                  SpacingFoundation.horizontalSpace8,
                  UiKitContentUpdatePlaceholder(
                    height: 0.125.sw * 1.7,
                    width: 0.125.sw,
                    title: S.current.PlusXNewVideoReactions(3).toLowerCase(),
                    imagePath: GraphicsFoundation.instance.png.avatars.avatar13.path,
                  ),
                ],
              ),
            ),
            UiKitContentUpdateWithLeadingImage(
              imageUrl: GraphicsFoundation.instance.png.mapMock.path,
              iconData: ShuffleUiKitIcons.landmark,
              title: S.current.PlusXNewRoutes,
              subtitle: 'Virgins on the beach',
            ),
            UiKitContentUpdateWithLeadingImage(
              imageUrl: GraphicsFoundation.instance.png.place.path,
              iconData: ShuffleUiKitIcons.playoutline,
              title: S.current.PlusXNewInterviews,
              subtitle: 'Virgins on the beach',
            ),
            UiKitCustomChildContentUpdateWidget(
              height: 0.75 * 0.125.sw,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusFoundation.all8,
                    child: ImageWidget(
                      link: GraphicsFoundation.instance.png.placeSocial1.path,
                      width: 0.125.sw,
                      height: 0.75 * 0.125.sw,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SpacingFoundation.horizontalSpace8,
                  UiKitContentUpdatePlaceholder(
                    height: 0.75 * 0.125.sw,
                    width: 0.125.sw,
                    title: S.current.PlusXNewRespects(2).toLowerCase(),
                    imagePath: GraphicsFoundation.instance.png.placeSocial2.path,
                  ),
                ],
              ),
            ),
            UiKitContentUpdateWithLeadingImage(
              imageUrl: GraphicsFoundation.instance.png.spinnerTextBanner2.path,
              iconData: ShuffleUiKitIcons.playoutline,
              title: S.current.PlusXNewVideos,
              subtitle: 'Virgins on the beach',
            ),
            UiKitContestUpdateWidget(
              title: S.current.PlusXNewContests,
              text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              contestVideo: UiKitReactionPreview(
                viewed: false,
                isEmpty: false,
                imagePath: GraphicsFoundation.instance.png.serviceSocial3.path,
                customHeight: 0.125.sw * 1.7,
                customWidth: 0.125.sw,
              ),
              height: 0.125.sw * 1.7,
            ),
            UiKitOnlyTextContentUpdateWidget(
              updateIcon: ShuffleUiKitIcons.message,
              title: '${S.current.Chat.toUpperCase()} ${S.current.PlusXNewChatComments(10)}',
              text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              titleTrailing: Text(
                formatDifference(DateTime.now().subtract(const Duration(hours: 2))),
                style: regularTextTheme?.caption3.copyWith(color: ColorsFoundation.mutedText),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
        SpacingFoundation.verticalSpace16,
        SpacingFoundation.verticalSpace16,
        UiKitPostCard(
          authorName: 'Peter Parker',
          authorUsername: 'spiderman',
          authorAvatarUrl: GraphicsFoundation.instance.png.avatars.avatar1.path,
          authorSpeciality: 'Friendly neighbour',
          text: 'Today MJ said she knows my secrets. I wonder if she knows about my relationships with Night girl',
          authorUserType: UserTileType.influencer,
          heartEyesCount: 10,
          likesCount: 5,
          sunglassesCount: 14,
          firesCount: 2,
          smileyCount: 78,
          hasNewMark: true,
        ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
        SpacingFoundation.verticalSpace16,
        UiKitTitledFilter(
          onItemSelected: (item) {},
          onItemDeselected: (item) {},
          model: TitledFilterModel(
            title: 'Title',
            items: [
              TitledFilterItem(
                selected: false,
                mask: 'mask',
                value: 123,
              ),
              TitledFilterItem(
                selected: false,
                mask: 'mask',
                value: 123,
              ),
              TitledFilterItem(
                selected: false,
                mask: 'mask',
                value: 123,
              ),
              TitledFilterItem(
                selected: false,
                mask: 'mask',
                value: 123,
              ),
            ],
          ),
        ),
        SpacingFoundation.verticalSpace16,
        UiKitMiniChart(
          data: mockedMiniChartData,
        ).paddingSymmetric(horizontal: 16),
        SpacingFoundation.verticalSpace16,
        UiKitRankedTitledBoard(
          title:
              'Top events for ${formatDateWithCustomPattern('MMMM dd', DateTime.now().subtract(const Duration(days: 2)))}',
          rankItems: [
            '80’s theme invites only party',
            'Asian Street by Thai',
            'First summer dance',
          ],
        ).paddingSymmetric(horizontal: 16),
        SpacingFoundation.verticalSpace16,
        SizedBox(
          height: 0.265625.sw,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: UiKitPieChart(data: mockPieChart),
              ),
              SpacingFoundation.horizontalSpace24,
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: mockPieChart.legend
                      .map<Widget>(
                        (legendItem) => UiKitChartLegendWidget(
                          valueTitle: legendItem.title,
                          value: legendItem.value,
                          leading: Container(
                            width: SpacingFoundation.verticalSpacing8,
                            height: SpacingFoundation.verticalSpacing8,
                            decoration: BoxDecoration(
                              color: legendItem.color,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ).paddingSymmetric(vertical: EdgeInsetsFoundation.vertical2),
              ),
            ],
          ).paddingSymmetric(horizontal: 16),
        ),
        SpacingFoundation.verticalSpace16,
        UiKitGlowingProgressIndicator(
          maxWidth: 1.sw - 16,
          progressColor: ColorsFoundation.warning,
          maxValue: 10,
          value: 5,
          title: 'Event rating (by feedback)',
        ).paddingSymmetric(horizontal: 16),
        SpacingFoundation.verticalSpace16,
        UiKitGlowingProgressIndicator(
          maxWidth: 1.sw - 16,
          progressColor: ColorsFoundation.success,
          maxValue: 10,
          value: 8,
          title: 'Overall rating of interest',
        ).paddingSymmetric(horizontal: 16),
        SpacingFoundation.verticalSpace16,
        UiKitVerticalTitledInfoBoard(
          title: 'Portrait of the most active segment',
          infoList: [
            TitledInfoModel(
              title: S.current.Gender,
              info: S.current.Male,
            ),
            TitledInfoModel(
              title: 'Age',
              info: '36-45 y.o',
            ),
            TitledInfoModel(
              title: 'Interests',
              info: 'Snowboard, Free Ride, Hookah, Dance',
            ),
          ],
        ),
        SpacingFoundation.verticalSpace16,
        GlobalContentAlertDialog(),
        SpacingFoundation.verticalSpace16,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 130,
              child: UiKitGlobalContentCard(),
            ),
          ],
        ),
        SpacingFoundation.verticalSpace16,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            context.boxIconButton(
              isSelected: true,
              data: BaseUiKitButtonData(
                onPressed: () {},
                iconInfo: BaseUiKitButtonIconData(iconData: ShuffleUiKitIcons.sunny),
              ),
            ),
            context.boxIconButton(
              isSelected: true,
              data: BaseUiKitButtonData(
                onPressed: () {},
                iconInfo: BaseUiKitButtonIconData(iconData: ShuffleUiKitIcons.rain),
              ),
            ),
            context.boxIconButton(
              isSelected: false,
              data: BaseUiKitButtonData(
                onPressed: () {},
                iconInfo: BaseUiKitButtonIconData(iconData: ShuffleUiKitIcons.windy),
              ),
            ),
          ],
        ),
        SliderPlaceCard(
          slidablePlaceCardData: SlidablePlaceCardData(
            media: [
              UiKitMediaPhoto(link: GraphicsFoundation.instance.png.leto1.path),
              UiKitMediaPhoto(link: GraphicsFoundation.instance.png.leto1.path),
              UiKitMediaPhoto(link: GraphicsFoundation.instance.png.leto1.path),
              UiKitMediaPhoto(link: GraphicsFoundation.instance.png.leto1.path),
              UiKitMediaPhoto(link: GraphicsFoundation.instance.png.leto1.path),
            ],
            title: 'Virgins on the beach',
            placeTags: [
              UiKitTag(
                title: 'Cheap',
                icon: ShuffleUiKitIcons.cocktail,
              ),
              UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
              UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
              UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
              UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
              UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
              UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
              UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
              UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
              UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
            ],
            weatherType: PlaceWeatherType.rainy,
          ),
        ).paddingAll(EdgeInsetsFoundation.all16),
        UiKitChatCardWithReplyIn(
          replySenderName: '',
          replyMessageId: 1,
          showAvatar: false,
          id: -1,
          replyUserType: UserTileType.ordinary,
          timeOfDay: DateTime.now(),
          text: 'Any plans for the weekend? What about to get a company and go to atmosphere again?',
          replyText: 'Ryan Gosling in the movie Drive',
          onReplyMassageTap: (value) {},
          replyUserAvatar: 'Райн гослинг',
        ),
        SpacingFoundation.verticalSpace16,
        UiKitChatCardWithReplyOut(
            replySenderName: '',
            replyMessageId: 1,
            id: -1,
            replyUserType: UserTileType.ordinary,
            timeOfDay: DateTime.now(),
            text: 'Any plans for the weekend? What about to get a company and go to atmosphere again?',
            replyText: 'Ryan Gosling in the movie Drive',
            onReplyMassageTap: (value) {},
            replyUserAvatar: 'Райн гослинг'),
        UiKitVoiceListenCard(
          duration: Duration(seconds: 70),
        ),
        SpacingFoundation.verticalSpace16,
        UiKitVideoInterviewTile(
          onPlayTap: () {},
        ).paddingAll(EdgeInsetsFoundation.all16),
        SpacingFoundation.verticalSpace16,
        UiKitPointsHistoryTile(
          title: 'Challenge Feelings (hardcore)',
          dateTime: DateTime.now(),
          points: 30,
        ).paddingAll(EdgeInsetsFoundation.all16),
        SpacingFoundation.verticalSpace16,
        UiKitFeedbackInfo(
          onSubmit: () {},
          isModerated: false,
          userName: 'Ryan Gosling',
          dateTime: DateTime.now(),
          removeFunction: () {},
          onModerated: () {},
          responsesFromCompanyToReview: true,
        ).paddingAll(EdgeInsetsFoundation.all16),
        SpacingFoundation.verticalSpace16,
        DecoratedBox(
          decoration: BoxDecoration(
            color: context.uiKitTheme?.colorScheme.surface2,
          ),
          child: UiKitIconedTitle(icon: GraphicsFoundation.instance.png.company.path, title: 'Diamond')
              .paddingAll(EdgeInsetsFoundation.all16),
        ),
        SpacingFoundation.verticalSpace16,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            context.coloredButtonWithBorderRadius(
              data: BaseUiKitButtonData(
                text: 'Start',
                onPressed: () {},
              ),
            ),
            context.coloredButtonWithBorderRadius(
              data: BaseUiKitButtonData(
                text: 'Cancel',
                onPressed: () {},
                backgroundColor: ColorsFoundation.danger,
              ),
            ),
          ],
        ),
        SpacingFoundation.verticalSpace16,
        UiKitInputFilledWithTitle(
          title: 'Title',
          controller: TextEditingController(),
          maxLines: 10,
          minLines: 1,
        ),
        SpacingFoundation.verticalSpace16,
        UiKitPropertiesCloud(
          child: const Column(
            children: [UiKitCloudChipWithDesc(title: 'Coffee connoisseur', description: 'foodie, forever sloth')],
          ).paddingAll(EdgeInsetsFoundation.all24),
        ).paddingAll(EdgeInsetsFoundation.all16),
        UiKitPropertiesCloud(
          child: Wrap(
            spacing: SpacingFoundation.horizontalSpacing12,
            runSpacing: SpacingFoundation.verticalSpacing12,
            children: [
              UiKitCloudChip(
                title: 'Joke',
                onTap: () {},
                iconPath: GraphicsFoundation.instance.png.company.path,
              ),
              UiKitCloudChip(
                title: 'Smoke',
                onTap: () {},
                iconPath: GraphicsFoundation.instance.png.company.path,
              ),
              UiKitCloudChip(
                title: 'Drink',
                onTap: () {},
                iconPath: GraphicsFoundation.instance.png.company.path,
              ),
              UiKitCloudChip(
                title: 'Swim',
                onTap: () {},
                iconPath: GraphicsFoundation.instance.png.company.path,
              ),
              UiKitCloudChip(
                title: 'Relax',
                onTap: () {},
                iconPath: GraphicsFoundation.instance.png.company.path,
              ),
              UiKitCloudChip(
                title: 'Relax',
                onTap: () {},
                iconPath: GraphicsFoundation.instance.png.company.path,
              ),
              UiKitCloudChip(
                title: 'Relax',
                onTap: () {},
                iconPath: GraphicsFoundation.instance.png.company.path,
              ),
            ],
          ).paddingAll(EdgeInsetsFoundation.all24),
        ).paddingAll(EdgeInsetsFoundation.all16),
        SpacingFoundation.verticalSpace16,
        UiKitExpansionTileWithIconButton(
          title: "Food and Drink",
          onTap: () {},
          children: [
            PropertiesTypeAnimatedButton(
              title: 'Active tiger',
              onTap: () {},
              isSelected: false,
            ),
            PropertiesTypeAnimatedButton(title: 'Active tiger', onTap: () {}, isSelected: false),
            PropertiesTypeAnimatedButton(title: 'Active tiger', onTap: () {}, isSelected: false),
            PropertiesTypeAnimatedButton(title: 'Active tiger', onTap: () {}, isSelected: false),
          ],
        ),
        SpacingFoundation.verticalSpace16,
        UiKitCloudChip(title: 'Diamond', onTap: () {}, iconPath: "ShuffleUiKitIcons.heartoutline", selected: true)
            .paddingAll(EdgeInsetsFoundation.all16),
        SpacingFoundation.verticalSpace16,
        PropertiesSearchInput(
          options: (text) async => ['prop1', 'prop2', 'prop3'],
          showAllOptions: false,
        ),
        SpacingFoundation.verticalSpace16,
        context.boxIconButton(
          data: BaseUiKitButtonData(
            iconInfo: BaseUiKitButtonIconData(
              iconData: ShuffleUiKitIcons.plus,
              color: context.uiKitTheme?.colorScheme.inversePrimary,
            ),
            onPressed: () {},
          ),
        ),
        SpacingFoundation.verticalSpace16,
        PropertiesTypeAnimatedButton(
          title: 'Active tiger',
          onTap: () {},
          isSelected: false,
        ).paddingAll(EdgeInsetsFoundation.all16),
        PropertiesBorderedBox(
          title: Row(
            children: [
              Text(S.current.RecentlyAdded, style: textTheme?.title2),
            ],
          ).paddingOnly(bottom: EdgeInsetsFoundation.vertical16),
          child: UiKitPropertiesCloud(
            child: Wrap(
              spacing: SpacingFoundation.horizontalSpacing12,
              runSpacing: SpacingFoundation.verticalSpacing12,
              children: [
                UiKitCloudChip(title: 'Joke', onTap: () {}),
                UiKitCloudChip(title: 'Smoke', onTap: () {}),
                UiKitCloudChip(title: 'Drink', onTap: () {}),
                UiKitCloudChip(title: 'Swim', onTap: () {}),
                UiKitCloudChip(title: 'Relax', onTap: () {}),
                UiKitCloudChip(title: 'Relax', onTap: () {}),
                UiKitCloudChip(title: 'Relax', onTap: () {}),
              ],
            ).paddingAll(EdgeInsetsFoundation.all24),
          ),
        ).paddingAll(EdgeInsetsFoundation.all16),
        UiKitPropertiesCloud(
          child: Wrap(
            spacing: SpacingFoundation.horizontalSpacing12,
            runSpacing: SpacingFoundation.verticalSpacing12,
            children: [
              UiKitCloudChip(title: 'Joke', onTap: () {}),
              UiKitCloudChip(title: 'Smoke', onTap: () {}),
              UiKitCloudChip(title: 'Drink', onTap: () {}),
              UiKitCloudChip(title: 'Swim', onTap: () {}),
              UiKitCloudChip(title: 'Relax', onTap: () {}),
              UiKitCloudChip(title: 'Relax', onTap: () {}),
              UiKitCloudChip(title: 'Relax', onTap: () {}),
            ],
          ).paddingAll(EdgeInsetsFoundation.all24),
        ).paddingAll(EdgeInsetsFoundation.all16),
        UiKitCloudChip(
          title: 'Joke',
          onTap: () {},
        ).paddingAll(EdgeInsetsFoundation.all16),
        context
            .createSnackBar(
                message: 'This is a success alert — check it out!', appSnackBarType: AppSnackBarType.success)
            .paddingSymmetric(vertical: 8, horizontal: 16),
        context
            .createSnackBar(message: 'This is a error alert — check it out!', appSnackBarType: AppSnackBarType.error)
            .paddingSymmetric(vertical: 8, horizontal: 16),
        context
            .createSnackBar(
                message: 'This is a warning alert — check it out!', appSnackBarType: AppSnackBarType.warning)
            .paddingSymmetric(vertical: 8, horizontal: 16),
        context
            .createSnackBar(message: 'This is an info alert — check it out!', appSnackBarType: AppSnackBarType.info)
            .paddingSymmetric(vertical: 8, horizontal: 16),
        context
            .createSnackBar(message: 'This is a dark alert — check it out!', appSnackBarType: AppSnackBarType.neutral)
            .paddingSymmetric(vertical: 8, horizontal: 16),
        SpacingFoundation.verticalSpace16,
        Center(
          child: UiKitDropDownList<String>(
            selectedItem: _selectedDropDownValue,
            onChanged: (value) {
              if (value != null) setState(() => _selectedDropDownValue = value);
            },
            items: [
              DropdownMenuItem(
                value: 'Active Tiger',
                child: Text(
                  'Active Tiger',
                  style: textTheme?.caption1Medium,
                ),
              ),
              DropdownMenuItem(
                value: 'Active Tige',
                child: Text(
                  'Active Tige',
                  style: textTheme?.caption1Medium,
                ),
              ),
              DropdownMenuItem(
                value: 'Active Tig',
                child: Text(
                  'Active Tig',
                  style: textTheme?.caption1Medium,
                ),
              ),
              DropdownMenuItem(
                value: 'Active Ti',
                child: Text(
                  'Active Ti',
                  style: textTheme?.caption1Medium,
                ),
              ),
              DropdownMenuItem(
                value: 'Active T',
                child: Text(
                  'Active T',
                  style: textTheme?.caption1Medium,
                ),
              ),
              DropdownMenuItem(
                value: '_selectedMenuItem',
                child: Text(
                  '_selectedMenuItem',
                  style: textTheme?.caption1Medium,
                ),
              ),
            ],
          ),
        ),
        SpacingFoundation.verticalSpace16,
        Row(
          children: [
            UiKitReactionPreview(
              imagePath: 'assets/images/png/profile_story_1.png',
              viewed: false,
              onTap: () {},
            ),
            SpacingFoundation.horizontalSpace8,
            UiKitReactionPreview.empty(
              onTap: () {},
            ),
          ],
        ),
        SpacingFoundation.verticalSpace16,
        UiKitRatingBarWithStars(
          onRatingChanged: (rating) {},
        ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
        SpacingFoundation.verticalSpace16,
        UiKitTitledWrappedInput(
          title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
          input: UiKitSymbolsCounterInputField(
            controller: _controller,
            enabled: true,
            hintText: 'Tell us what you liked or remember'.toUpperCase(),
            maxSymbols: 500,
            obscureText: false,
          ),
          popOverMessage: 'Write an addition to the review that will be useful for other visitors.',
        ),
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
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            context.userAvatar(
              size: UserAvatarSize.x20x20,
              type: UserTileType.ordinary,
              // imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
            SpacingFoundation.horizontalSpace8,
            context.userAvatar(
              size: UserAvatarSize.x20x20,
              type: UserTileType.pro,
              imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
            SpacingFoundation.horizontalSpace8,
            context.userAvatar(
              size: UserAvatarSize.x20x20,
              type: UserTileType.influencer,
              imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
            SpacingFoundation.horizontalSpace8,
            context.userAvatar(
              size: UserAvatarSize.x20x20,
              type: UserTileType.premium,
              imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
          ],
        ).paddingAll(EdgeInsetsFoundation.all8),
        SpacingFoundation.verticalSpace16,
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            context.userAvatar(
              size: UserAvatarSize.x24x24,
              type: UserTileType.ordinary,
              // imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
            SpacingFoundation.horizontalSpace8,
            context.userAvatar(
              size: UserAvatarSize.x24x24,
              type: UserTileType.pro,
              imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
            SpacingFoundation.horizontalSpace8,
            context.userAvatar(
              size: UserAvatarSize.x24x24,
              type: UserTileType.influencer,
              imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
            SpacingFoundation.horizontalSpace8,
            context.userAvatar(
              size: UserAvatarSize.x24x24,
              type: UserTileType.premium,
              imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
          ],
        ).paddingAll(EdgeInsetsFoundation.all8),
        SpacingFoundation.verticalSpace16,
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            context.userAvatar(
              size: UserAvatarSize.x32x32,
              type: UserTileType.ordinary,
              // imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
            SpacingFoundation.horizontalSpace8,
            context.userAvatar(
              size: UserAvatarSize.x32x32,
              type: UserTileType.pro,
              // imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
            SpacingFoundation.horizontalSpace8,
            context.userAvatar(
              size: UserAvatarSize.x32x32,
              type: UserTileType.influencer,
              // imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
            SpacingFoundation.horizontalSpace8,
            context.userAvatar(
              size: UserAvatarSize.x32x32,
              type: UserTileType.premium,
              imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
          ],
        ).paddingAll(EdgeInsetsFoundation.all8),
        SpacingFoundation.verticalSpace16,
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            context.userAvatar(
              size: UserAvatarSize.x40x40,
              type: UserTileType.ordinary,
              // imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
            SpacingFoundation.horizontalSpace8,
            context.userAvatar(
              size: UserAvatarSize.x40x40,
              type: UserTileType.pro,
              imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
            SpacingFoundation.horizontalSpace8,
            context.userAvatar(
              size: UserAvatarSize.x40x40,
              type: UserTileType.influencer,
              imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
            SpacingFoundation.horizontalSpace8,
            context.userAvatar(
              size: UserAvatarSize.x40x40,
              type: UserTileType.premium,
              // imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
          ],
        ).paddingAll(EdgeInsetsFoundation.all8),
        SpacingFoundation.verticalSpace16,
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            context.userAvatar(
              size: UserAvatarSize.x48x48,
              type: UserTileType.ordinary,
              // imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
            SpacingFoundation.horizontalSpace8,
            context.userAvatar(
              size: UserAvatarSize.x48x48,
              type: UserTileType.pro,
              imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
            SpacingFoundation.horizontalSpace8,
            context.userAvatar(
              size: UserAvatarSize.x48x48,
              type: UserTileType.influencer,
              // imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
            SpacingFoundation.horizontalSpace8,
            context.userAvatar(
              size: UserAvatarSize.x48x48,
              type: UserTileType.premium,
              imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
          ],
        ).paddingAll(EdgeInsetsFoundation.all8),
        SpacingFoundation.verticalSpace16,
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            context.userAvatar(
              size: UserAvatarSize.x60x60,
              type: UserTileType.ordinary,
              // imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
            SpacingFoundation.horizontalSpace8,
            context.userAvatar(
              size: UserAvatarSize.x60x60,
              type: UserTileType.pro,
              imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
            SpacingFoundation.horizontalSpace8,
            context.userAvatar(
              size: UserAvatarSize.x60x60,
              type: UserTileType.influencer,
              // imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
            SpacingFoundation.horizontalSpace8,
            context.userAvatar(
              size: UserAvatarSize.x60x60,
              type: UserTileType.premium,
              // imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
              userName: 'Doniyor Murodkulov',
            ),
          ],
        ).paddingAll(EdgeInsetsFoundation.all8),
        SpacingFoundation.verticalSpace16,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              context.userAvatar(
                size: UserAvatarSize.x120x120,
                type: UserTileType.ordinary,
                // imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
                userName: 'Doniyor Murodkulov',
              ),
              SpacingFoundation.horizontalSpace8,
              context.userAvatar(
                size: UserAvatarSize.x120x120,
                type: UserTileType.pro,
                // imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
                userName: 'Doniyor Murodkulov',
              ),
              SpacingFoundation.horizontalSpace8,
              context.userAvatar(
                size: UserAvatarSize.x120x120,
                type: UserTileType.influencer,
                imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
                userName: 'Doniyor Murodkulov',
              ),
              SpacingFoundation.horizontalSpace8,
              context.userAvatar(
                size: UserAvatarSize.x120x120,
                type: UserTileType.premium,
                imageUrl: GraphicsFoundation.instance.png.mockAvatar.path,
                userName: 'Doniyor Murodkulov',
              ),
            ],
          ).paddingAll(EdgeInsetsFoundation.all8),
        ),
        SpacingFoundation.verticalSpace16,
        const Center(child: MemberPlate()),
        SpacingFoundation.verticalSpace16,
        const Center(child: PremiumMemberPlate()),
        SpacingFoundation.verticalSpace16,
        const Center(child: ProMemberPlate()),
        SpacingFoundation.verticalSpace16,
        const Center(child: InfluencerMemberPlate()),
        SpacingFoundation.verticalSpace16,
        UiKitSocialSearchCard(
          title: 'lorem ipsum dolor',
          subtitle: 'Mudon - Dubai - UAE 2567-6672-1829',
          distance: '2.5 km',
          progress: 0.7,
          imageData: BaseUiKitButtonIconData(
            iconPath: GraphicsFoundation.instance.png.mockAvatar.path,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        UiKitSocialSearchCard(
          title: 'Snake catcher',
          subtitle: 'Benedict Jones',
          distance: '2.5 km',
          progress: 0.7,
          leadingImageBorderRadius: BorderRadiusFoundation.max,
          imageData: BaseUiKitButtonIconData(
            iconPath: GraphicsFoundation.instance.png.mockAvatar.path,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        UiKitTitledSection(
          borderRadius: BorderRadius.zero,
          title: 'Places',
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SpacingFoundation.horizontalSpace12,
                UiKitSocialSearchContentTypeCard.places(
                  title: 'Restaurant',
                  iconRingColor: ColorsFoundation.red,
                  iconData: BaseUiKitButtonIconData(
                    iconPath: GraphicsFoundation.instance.svg.angryEmoji.path,
                    color: ColorsFoundation.red,
                  ),
                  onTap: () {},
                ),
                SpacingFoundation.horizontalSpace12,
                UiKitSocialSearchContentTypeCard.places(
                  title: 'Restaurant',
                  iconRingColor: ColorsFoundation.red,
                  iconData: BaseUiKitButtonIconData(
                    iconPath: GraphicsFoundation.instance.svg.angryEmoji.path,
                    color: ColorsFoundation.red,
                  ),
                  onTap: () {},
                ),
                SpacingFoundation.horizontalSpace12,
                UiKitSocialSearchContentTypeCard.places(
                  title: 'Restaurant',
                  iconRingColor: ColorsFoundation.red,
                  iconData: BaseUiKitButtonIconData(
                    iconPath: GraphicsFoundation.instance.svg.angryEmoji.path,
                    color: ColorsFoundation.red,
                  ),
                  onTap: () {},
                ),
                SpacingFoundation.horizontalSpace12,
                UiKitSocialSearchContentTypeCard.places(
                  title: 'Restaurant',
                  iconRingColor: ColorsFoundation.red,
                  iconData: BaseUiKitButtonIconData(
                    iconPath: GraphicsFoundation.instance.svg.angryEmoji.path,
                    color: ColorsFoundation.red,
                  ),
                  onTap: () {},
                ),
                SpacingFoundation.horizontalSpace12,
                UiKitSocialSearchContentTypeCard.places(
                  title: 'Restaurant',
                  iconRingColor: ColorsFoundation.red,
                  iconData: BaseUiKitButtonIconData(
                    iconPath: GraphicsFoundation.instance.svg.angryEmoji.path,
                    color: ColorsFoundation.red,
                  ),
                  onTap: () {},
                ),
                SpacingFoundation.horizontalSpace12,
                UiKitSocialSearchContentTypeCard.places(
                  title: 'Restaurant',
                  iconRingColor: ColorsFoundation.red,
                  iconData: BaseUiKitButtonIconData(
                    iconPath: GraphicsFoundation.instance.svg.angryEmoji.path,
                    color: ColorsFoundation.red,
                  ),
                  onTap: () {},
                ),
                SpacingFoundation.horizontalSpace12,
                UiKitSocialSearchContentTypeCard.places(
                  title: 'Restaurant',
                  iconRingColor: ColorsFoundation.red,
                  iconData: BaseUiKitButtonIconData(
                    iconPath: GraphicsFoundation.instance.svg.angryEmoji.path,
                    color: ColorsFoundation.red,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        SpacingFoundation.verticalSpace16,
        UiKitTitledSection(
          borderRadius: BorderRadius.zero,
          title: 'Services',
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SpacingFoundation.horizontalSpace12,
                UiKitSocialSearchContentTypeCard.services(
                  title: 'Service',
                  customCardWidth: 0.4473.sw,
                  iconData: BaseUiKitButtonIconData(
                    iconPath: GraphicsFoundation.instance.png.place.path,
                  ),
                  onTap: () {},
                ),
                SpacingFoundation.horizontalSpace12,
              ],
            ),
          ),
        ),
        SpacingFoundation.verticalSpace16,
        ShortLogInButton(
          link: GraphicsFoundation.instance.svg.googleLogo.path,
          title: 'continue with google',
          onTap: () {},
        ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal20),
        SpacingFoundation.verticalSpace16,
        context.advertisementImageBanner(
          data: BaseUiKitAdvertisementImageBannerData(
            availableWidth: 1.sw,
            onPressed: () {},
            imageLink:
                'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/app-ads-banners/mock_ad_banner_1.png',
            title: 'Dubai',
            size: AdvertisementBannerSize.small,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        context.advertisementImageBanner(
          data: BaseUiKitAdvertisementImageBannerData(
            availableWidth: 1.sw,
            onPressed: () {},
            imageLink:
                'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/app-ads-banners/mock_ad_banner_2.png',
            title: 'Dubai',
            size: AdvertisementBannerSize.medium,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        context.advertisementImageBanner(
          data: BaseUiKitAdvertisementImageBannerData(
            availableWidth: 1.sw,
            onPressed: () {},
            imageLink:
                'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/app-ads-banners/mock_ad_banner_3.png',
            title: 'Dubai',
            size: AdvertisementBannerSize.large,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        UiKitUserTileWithCheckbox(
          name: 'Marry Williams',
          subtitle: 'Any cheerful person can invite me',
          onTap: (_) {},
          rating: 5,
          date: DateTime.now(),
          avatarLink: GraphicsFoundation.instance.png.mockAvatar.path,
          handShake: true,
        ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal12),
        SpacingFoundation.verticalSpace16,
        Center(
          child: UiKitSwitchWithCustomBackground(
            firstOption: CustomBackgroundSwitchOption(
              title: 'Personal',
              value: 'user',
              iconLink: GraphicsFoundation.instance.svg.personLayered.path,
            ),
            secondOption: CustomBackgroundSwitchOption(
              title: 'Company',
              value: 'company',
              iconLink: GraphicsFoundation.instance.svg.companyLayered.path,
            ),
            selectedOption: selectedOption,
            onChanged: (value) {
              setState(() => selectedOption = value);
            },
          ),
        ),
        SpacingFoundation.verticalSpace16,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            context.outlinedButton(
              data: BaseUiKitButtonData(
                text: 'Dark Theme',
                onPressed: () => UiKitTheme.of(context).updateTheme(
                  UiKitThemeFoundation.defaultTheme,
                ),
              ),
            ),
            context.outlinedButton(
              data: BaseUiKitButtonData(
                text: 'Light Theme',
                onPressed: () => UiKitTheme.of(context).updateTheme(
                  UiKitThemeFoundation.lightTheme,
                ),
              ),
            ),
          ],
        ),
        SpacingFoundation.verticalSpace16,
        UiKitMessageCard(
          name: 'Eugene Carter',
          lastMessageTime: '2h ago',
          avatarPath: GraphicsFoundation.instance.png.mockAvatar.path,
          lastMessage: 'Any plans for the weekend? What about to get a company and go to atmosphere again?',
          unreadMessageCount: 4,
          userType: UserTileType.ordinary,
          onTap: () {},
          subtitle: '',
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
                leadingImagePath: GraphicsFoundation.instance.png.eventAvatar.path,
              ),
              SpacingFoundation.verticalSpace16,
              UiKitActionCardTile(
                title: '80’s theme invites only party ',
                subtitle: 'in 1 day',
                onTap: () {},
                leadingImagePath: GraphicsFoundation.instance.png.mockAvatar.path,
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
              icon: ShuffleUiKitIcons.cutlery,
            ),
          ],
          profileStats: [
            UiKitStats(
              title: 'Invited',
              value: '934',
              actionButton: context.smallButton(
                data: BaseUiKitButtonData(
                  text: 'MORE',
                  onPressed: () {},
                ),
              ),
            ),
            UiKitStats(
              title: 'Booked',
              value: '133',
              actionButton: context.smallButton(
                data: BaseUiKitButtonData(
                  text: 'MORE',
                  onPressed: () {},
                ),
              ),
            ),
          ],
          interests: const [
            'Tourists',
            'Luxury',
          ],
          badge: DynamicGradientPlate(
            content: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'shuffle',
                  style: textTheme?.caption1Bold.copyWith(color: Colors.black),
                ),
                ImageWidget(
                  svgAsset: GraphicsFoundation.instance.svg.memeberGradientStar,
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
        const UiKitCodeInputField(
          codeDigitsCount: 4,
          autofocus: false,
        ),
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
          itemBuilder: (BuildContext context, int index) => UiKitFindSomeoneCard(
            avatarUrl: GraphicsFoundation.instance.png.mockUserAvatar.path,
            userNickName: 'naveen',
            userName: 'Naveen Sheoran',
            userPoints: 555,
            sameInterests: 4,
            onMessage: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Send message'),
                ),
              );
            },
          ),
          itemCount: 5,
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
              icon: ShuffleUiKitIcons.networking,
              position: DecorationIconPosition(
                right: 42,
                top: -5,
              ),
              iconSize: 92,
            ),
            ActionCardDecorationIconData(
              iconLink: GraphicsFoundation.instance.svg.bellNotification.path,
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
          switchedOn: switchValue,
          onChanged: (value) => setState(() => switchValue = value),
        ),
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
          imageLink: GraphicsFoundation.instance.png.compactRatingCardMock.path,
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
                  style: context.uiKitTheme?.boldTextTheme.subHeadline.copyWith(
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
              icon: ShuffleUiKitIcons.coin,
              position: DecorationIconPosition(
                top: 4,
                right: -4,
              ),
              iconSize: 24,
              rotationAngle: -26,
            ),
            ActionCardDecorationIconData(
              icon: ShuffleUiKitIcons.coin,
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
              icon: ShuffleUiKitIcons.coin,
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
            backgroundImageLink: GraphicsFoundation.instance.png.titledCardBackground1.path,
            backgroundColor: ColorsFoundation.brightYellow,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        Center(
          child: UiKitTitledCardWithBackground(
            onPressed: () {},
            title: 'Big Company',
            backgroundImageLink: GraphicsFoundation.instance.png.titledCardBackground2.path,
            backgroundColor: ColorsFoundation.red,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        Center(
          child: UiKitTitledCardWithBackground(
            onPressed: () {},
            title: 'Electronic Music',
            backgroundImageLink: GraphicsFoundation.instance.png.titledCardBackground3.path,
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
              iconInfo: BaseUiKitButtonIconData(
                iconData: ShuffleUiKitIcons.message,
                color: context.uiKitTheme?.colorScheme.inversePrimary,
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
        const GradientableWidget(
          gradient: GradientFoundation.badgeIcon,
          // child: Text('Describe yourself',style: context.uiKitTheme?.boldTextTheme.subHeadline)),
          child: ImageWidget(
            iconData: ShuffleUiKitIcons.cocktail,
            height: 80,
            color: Colors.white,
          ),
        ),
        UiKitBorderedChipWithIcon(
          title: 'Active',
          icon: const ImageWidget(
            iconData: ShuffleUiKitIcons.map,
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
              iconLink: GraphicsFoundation.instance.svg.swim.path,
              type: 'business',
            ),
            UiKitMenuItem<String>(
              title: 'Active Tiger Business',
              value: 'tiger',
              iconLink: GraphicsFoundation.instance.svg.athlete.path,
              type: 'business',
            ),
            UiKitMenuItem<String>(
              title: 'Active Tiger Business',
              value: 'tiger',
              iconLink: GraphicsFoundation.instance.svg.food.path,
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
            id: 0,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        Center(
          child: context.badgeButton(
            data: BaseUiKitButtonData(
              iconInfo: BaseUiKitButtonIconData(
                iconData: ShuffleUiKitIcons.message,
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
            data: BaseUiKitButtonData(
              text: 'Cancel',
              onPressed: () {},
              backgroundColor: Colors.white.withOpacity(0.5),
            ),
          ),
          requiredData: NotificationPopupRequiredData(
            titleString: 'Yoga today at Palm Jumeirah. You go?',
            icon: ImageWidget(
              svgAsset: GraphicsFoundation.instance.svg.heartInHandEmoji,
            ),
            hasShadow: true,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        context.notificationPopUp(
          primaryActionWidget: context.smallButton(
            data: BaseUiKitButtonData(text: 'Ok', onPressed: () {}),
          ),
          dismissActionWidget: context.smallOutlinedButton(
            data: BaseUiKitButtonData(text: 'Cancel', onPressed: () {}, backgroundColor: Colors.white.withOpacity(0.5)),
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
          secondaryActionWidget: context.smallOutlinedButton(
            data: BaseUiKitButtonData(text: 'text', onPressed: () {}),
          ),
          dismissActionWidget: context.smallOutlinedButton(
            data: BaseUiKitButtonData(text: 'Cancel', onPressed: () {}, backgroundColor: Colors.white.withOpacity(0.5)),
          ),
          requiredData: NotificationPopupRequiredData(
            titleString: 'Yoga today at Palm Jumeirah. You go?',
            icon: ImageWidget(
              svgAsset: GraphicsFoundation.instance.svg.heartInHandEmoji,
            ),
            hasShadow: true,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        context.notificationPopUp(
          primaryActionWidget: context.smallButton(
            data: BaseUiKitButtonData(text: 'Ok', onPressed: () {}),
          ),
          dismissActionWidget: context.smallOutlinedButton(
            data: BaseUiKitButtonData(text: 'Cancel', onPressed: () {}, backgroundColor: Colors.white.withOpacity(0.5)),
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
                data: BaseUiKitButtonData(
                    text: 'Hard to answer', onPressed: () {}, backgroundColor: Colors.white.withOpacity(0.5)),
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
              ),
            ],
          ),
        ),
        SpacingFoundation.verticalSpace16,
        UiKitSwiperCard(
          title: 'Dance Again',
          subtitle: 'Unique place for unique people',
          imageLink: Assets.images.png.mockSwiperCard.path,
          tags: [
            const UiKitTagWidget(
              title: 'Club',
              icon: ShuffleUiKitIcons.cocktail,
            ),
            UiKitTagWidget(
              title: 'Club',
              icon: ShuffleUiKitIcons.cocktail,
              customSpace: SpacingFoundation.horizontalSpace8,
              showSpacing: true,
            ),
            UiKitTagWidget(
              title: 'Club',
              icon: ShuffleUiKitIcons.cocktail,
              customSpace: SpacingFoundation.horizontalSpace8,
              showSpacing: true,
            ),
            UiKitTagWidget(
              title: 'Club',
              icon: ShuffleUiKitIcons.cocktail,
              customSpace: SpacingFoundation.horizontalSpace8,
              showSpacing: true,
            ),
            UiKitTagWidget(
              title: 'Club',
              icon: ShuffleUiKitIcons.cocktail,
              customSpace: SpacingFoundation.horizontalSpace8,
              showSpacing: true,
            ),
          ],
          id: 1,
        ),
        UiKitSwiperAdCard(
          title: '',
          subtitle: '',
          imageLink: Assets.images.png.mockAdBanner.path,
          adsData: BaseUiKitAdvertisementImageBannerData(
            availableWidth: 1.sw,
            imageLink: GraphicsFoundation.instance.png.mockAdBanner.path,
            title: 'title',
            size: AdvertisementBannerSize.large,
          ),
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
                iconLink: GraphicsFoundation.instance.svg.smileyCrazyFaceEmoji.path,
                layoutDirection: Axis.vertical,
              ),
              SpacingFoundation.horizontalSpace12,
              UiKitMessageCardWithIcon(
                onPressed: () {},
                message: 'Want to have',
                iconLink: GraphicsFoundation.instance.svg.angryEmoji.path,
                layoutDirection: Axis.vertical,
              ),
              SpacingFoundation.horizontalSpace12,
              UiKitMessageCardWithIcon(
                onPressed: () {},
                message: 'Want to have Want to have',
                iconLink: GraphicsFoundation.instance.svg.smileyCrazyFaceEmoji.path,
                layoutDirection: Axis.vertical,
              ),
            ],
          ),
        ),
        SpacingFoundation.verticalSpace16,
        UiKitMessageCardWithIcon(
          onPressed: () {},
          message: 'need to cool down a bit?',
          iconLink: GraphicsFoundation.instance.svg.smileyCrazyFaceEmoji.path,
          layoutDirection: Axis.horizontal,
        ),
        SpacingFoundation.verticalSpace16,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              context.gradientButton(
                data: BaseUiKitButtonData(
                  iconInfo: BaseUiKitButtonIconData(
                    iconData: ShuffleUiKitIcons.dice,
                  ),
                  onPressed: () {},
                ),
              ),
              SpacingFoundation.horizontalSpace12,
              UiKitTitledFilterChip(
                title: 'Favorites',
                icon: ShuffleUiKitIcons.starwhite,
                selected: false,
                onPressed: () {},
              ),
              SpacingFoundation.horizontalSpace12,
              UiKitTitledFilterChip(
                title: 'Clubs',
                icon: ShuffleUiKitIcons.cocktail,
                selected: true,
                onPressed: () {},
              ),
              SpacingFoundation.horizontalSpace12,
              UiKitTitledFilterChip(
                title: 'Clubs',
                icon: ShuffleUiKitIcons.cocktail,
                selected: false,
                onPressed: () {},
              ),
              SpacingFoundation.horizontalSpace12,
              UiKitTitledFilterChip(
                title: 'Favorites',
                icon: ShuffleUiKitIcons.starwhite,
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
                    const Expanded(
                      child: UiKitMetricsCard(
                        title: 'Burned today',
                        value: '439',
                        unit: 'kCal',
                        icon: ImageWidget(
                          iconData: ShuffleUiKitIcons.fireWhite,
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
                iconInfo: BaseUiKitButtonIconData(
                  iconData: ShuffleUiKitIcons.route,
                  color: Colors.white,
                ),
              ),
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
                iconInfo: BaseUiKitButtonIconData(
                  iconData: ShuffleUiKitIcons.searchpeople,
                  color: Colors.white,
                ),
              ),
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
                rasterIconAsset: GraphicsFoundation.instance.png.events,
                action: () {},
              ),
            ),
            SpacingFoundation.horizontalSpace8,
            Expanded(
              child: PointBalancePlaceActionCard(
                value: '2 650',
                rasterIconAsset: GraphicsFoundation.instance.png.money,
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
            UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
            UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
            UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
            UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
            UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
            UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
            UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
            UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
          ],
          uniqueTags: [
            UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.dice, unique: true),
            UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.dice, unique: true),
            UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.dice, unique: true),
            UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.dice, unique: true),
            UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.dice, unique: true),
            UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.dice, unique: true),
            UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.dice, unique: true),
            UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.dice, unique: true),
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
          data: BaseUiKitUserTileData(
            onTap: () {},
            name: 'Frankie Hansen',
            username: '@fr4nk1eh4',
            avatarUrl: GraphicsFoundation.instance.png.mockUserAvatar.path,
            type: UserTileType.ordinary,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        context.userTile(
            data: BaseUiKitUserTileData(
          onTap: () {},
          name: 'Frankie Hansen',
          username: '@fr4nk1eh4',
          avatarUrl: GraphicsFoundation.instance.png.mockUserAvatar.path,
          type: UserTileType.premium,
        )),
        SpacingFoundation.verticalSpace16,
        context.userTile(
          data: BaseUiKitUserTileData(
            onTap: () {},
            name: 'Frankie Hansen',
            username: '@fr4nk1eh4',
            avatarUrl: GraphicsFoundation.instance.png.mockUserAvatar.path,
            type: UserTileType.pro,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        context.userTile(
          data: BaseUiKitUserTileData(
            onTap: () {},
            name: 'Frankie Hansen',
            username: '@fr4nk1eh4',
            avatarUrl: GraphicsFoundation.instance.png.mockUserAvatar.path,
            type: UserTileType.influencer,
          ),
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
              UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
              UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
              UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
              UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
              UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
              UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
              UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
              UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
              UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
              UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cocktail),
            ],
          ),
        ),
        SpacingFoundation.verticalSpace16,
        MaterialButton(
          onPressed: () {
            Navigator.of(context).push(
                PopUpVideoPlayer(videoUri: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
          },
          child: const Text(
            'Show Horizontal Video',
          ),
        ),
        SpacingFoundation.verticalSpace16,
        MaterialButton(
          onPressed: () {
            Navigator.of(context)
                .push(PopUpVideoPlayer(videoUri: 'https://www.exit109.com/~dnn/clips/RW20seconds_1.mp4'));
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
                videoUri: 'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'));
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
    ).paddingAll(EdgeInsetsFoundation.zero);
  }
}
