import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class InfluencerProfile extends StatefulWidget {
  final int? visitedPlaces;
  final int? reviewsPosted;
  final int? pointsEarned;

  const InfluencerProfile({
    super.key,
    this.visitedPlaces,
    this.reviewsPosted,
    this.pointsEarned,
  });

  @override
  State<InfluencerProfile> createState() => _InfluencerProfileState();
}

class _InfluencerProfileState extends State<InfluencerProfile> with TickerProviderStateMixin {
  late TabController specialTabsController = TabController(length: 8, vsync: this);
  late TabController activityTabsController = TabController(length: 3, vsync: this);
  late double specialTabsHeight = 2 * (bigScreen ? 0.265.sh : 0.325.sh);
  double _activityTabsContentHeight = 6 * 0.26.sh;
  int voiceBadgeCount = 0;
  int photoBadgeCount = 123;
  int idealRouteBadgeCount = 1;
  int interviewBadgeCount = 4;
  int chatBadgeCount = 90;
  int nftBadgeCount = 2;
  int contestBadgeCount = 999;
  int videoBadgeCount = 0;
  final activityTabsSizeGroup = AutoSizeGroup();
  final statsSizeGroup = AutoSizeGroup();
  final specialTabsKey = GlobalKey();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      specialTabsController.addListener(_specialTabsListener);
      setSpecialTabsContentHeight(0);
      _setActivityTabsContentHeight(0);
    });
  }

  void _setActivityTabsContentHeight(int index) {
    if (index == 0) {
      _activityTabsContentHeight = 6 *
          (bigScreen
              ? 0.265.sh
              : midScreen
                  ? 0.27.sh
                  : 0.275.sh);
    } else if (index == 1) {
      _activityTabsContentHeight = 4 * (bigScreen || midScreen ? 0.3.sh : 0.3575.sh);
    } else if (index == 2) {
      _activityTabsContentHeight = 2 *
          (bigScreen
              ? 0.43.sh
              : midScreen
                  ? 0.45.sh
                  : 0.5.sh);
    }
    setState(() {});
  }

  Future<void> _animateToSpecialTabPosition() async {
    if (mounted) {
      await Scrollable.ensureVisible(
        specialTabsKey.currentContext!,
        duration: const Duration(milliseconds: 250),
        curve: Curves.decelerate,
      );
    }
  }

  void _specialTabsListener() {
    final tabIndex = specialTabsController.index;
    setSpecialTabsContentHeight(tabIndex);
  }

  bool get bigScreen => 1.sw > 415;

  bool get midScreen => 1.sw > 380;

  void setSpecialTabsContentHeight(int index) {
    if (index == 0) {
      specialTabsHeight = bigScreen
          ? 0.53.sh
          : midScreen
              ? 0.56.sh
              : 0.65.sh;
      voiceBadgeCount = 0;
    } else if (index == 1) {
      specialTabsHeight = bigScreen
          ? 0.4.sh
          : midScreen
              ? 0.425.sh
              : 0.5.sh;
      photoBadgeCount = 0;
    } else if (index == 2) {
      specialTabsHeight = bigScreen
          ? 0.385.sh
          : midScreen
              ? 0.36.sh
              : 0.4.sh;
      idealRouteBadgeCount = 0;
    } else if (index == 3) {
      specialTabsHeight = bigScreen
          ? 0.5.sh
          : midScreen
              ? 0.515.sh
              : 0.6.sh;
      interviewBadgeCount = 0;
    } else if (index == 4) {
      specialTabsHeight = bigScreen || midScreen ? 0.575.sh : 0.625.sh;
      chatBadgeCount = 0;
    } else if (index == 5) {
      specialTabsHeight = bigScreen || midScreen ? 0.4.sh : 0.425.sh;
      nftBadgeCount = 0;
    } else if (index == 6) {
      specialTabsHeight = bigScreen
          ? 0.5.sh
          : midScreen
              ? 0.55.sh
              : 0.65.sh;
      contestBadgeCount = 0;
    } else if (index == 7) {
      specialTabsHeight = bigScreen
          ? 0.4025.sh
          : midScreen
              ? 0.425.sh
              : 0.45.sh;
      videoBadgeCount = 0;
    }
    setState(() {});
  }

  @override
  void dispose() {
    specialTabsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Scaffold(
      body: BlurredAppBarPage(
        title: 'Marry Williams',
        controller: scrollController,
        centerTitle: true,
        autoImplyLeading: true,
        children: [
          SpacingFoundation.verticalSpace16,
          ProfileCard(
            speciality: 'Entertainer',
            socialLinks: const [
              'https://www.instagram.com/marrywilliams/',
              'https://www.tg.me/marrywilliams/',
            ],
            profileCardBody: InfluencerPublicProfileCardBody(
              name: 'Marry Williams',
              nickname: 'marywill',
              description: 'Just walking here and there trying to find something unique and interesting to show you!',
              avatarUrl: GraphicsFoundation.instance.png.profileAvatar.path,
              speciality: 'Entertainment specialist',
              hasAchievements: true,
              socialLinks: [
                context.smallOutlinedButton(
                  data: BaseUiKitButtonData(
                    onPressed: () {},
                    iconInfo: BaseUiKitButtonIconData(
                      iconData: ShuffleUiKitIcons.socialtelegram,
                    ),
                  ),
                ),
                context.smallOutlinedButton(
                  data: BaseUiKitButtonData(
                    onPressed: () {},
                    iconInfo: BaseUiKitButtonIconData(
                      iconData: ShuffleUiKitIcons.socialinstagram,
                    ),
                  ),
                ),
              ],
              interests: const ['Restaurants', 'Hookah', 'Roller Coaster', 'Swimmings'],
              matchingInterests: const ['Restaurants'],
              onShare: () {},
              followers: 2690120,
              onFollow: () {},
            ),
            achievements: List.generate(
              9,
              (index) => UiKitAchievementsModel(
                title: 'Achievement ${index + 1}',
                posterUrl: index != 0 && index % 3 == 0 ? null : GraphicsFoundation.instance.png.goldenCup.path,
              ),
            ),
            badge: const InfluencerMemberPlate(),
          ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
          SpacingFoundation.verticalSpace16,
          if (widget.visitedPlaces != null && widget.reviewsPosted != null && widget.pointsEarned != null)
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: UiKitGradientableStatsCard(
                    maxLines: 2,
                    autoSizeGroup: statsSizeGroup,
                    gradient: GradientFoundation.silverGradient,
                    stats: UiKitStats(
                      title: S.current.PlacesVisited(widget.visitedPlaces!).toLowerCase(),
                      value: profileStatsFormatter(widget.visitedPlaces!),
                      actionButton: const SizedBox.shrink(),
                    ),
                  ),
                ),
                SpacingFoundation.horizontalSpace8,
                Expanded(
                  child: UiKitGradientableStatsCard(
                    maxLines: 1,
                    autoSizeGroup: statsSizeGroup,
                    gradient: GradientFoundation.bronzeGradient,
                    stats: UiKitStats(
                      title: S.current.ReviewsPosted(widget.reviewsPosted!).toLowerCase(),
                      value: profileStatsFormatter(widget.reviewsPosted!),
                      actionButton: const SizedBox.shrink(),
                    ),
                  ),
                ),
                SpacingFoundation.horizontalSpace8,
                Expanded(
                  child: UiKitGradientableStatsCard(
                    maxLines: 2,
                    autoSizeGroup: statsSizeGroup,
                    gradient: GradientFoundation.goldGradient,
                    stats: UiKitStats(
                      title: S.current.PointsEarned(widget.pointsEarned!).toLowerCase(),
                      value: profileStatsFormatter(widget.pointsEarned!),
                      actionButton: const SizedBox.shrink(),
                    ),
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
          if (widget.visitedPlaces != null && widget.reviewsPosted != null && widget.pointsEarned != null)
            SpacingFoundation.verticalSpace24,
          UiKitCardWrapper(
            borderRadius: BorderRadiusFoundation.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '${S.current.New}!',
                  style: boldTextTheme?.caption2UpperCaseMedium,
                ),
                SpacingFoundation.verticalSpace12,
                UiKitInfluencerProfileNewsTile(
                  onTap: () {
                    _animateToSpecialTabPosition().whenComplete(() {
                      specialTabsController.animateTo(1);
                    });
                  },
                  leading: StaggeredPhotosLeadingWidget(
                    photoLinks: [
                      GraphicsFoundation.instance.png.placeSocial1.path,
                      GraphicsFoundation.instance.png.placeSocial3.path,
                      GraphicsFoundation.instance.png.placeSocial2.path,
                    ],
                  ),
                  title: '+12 photos',
                  titleDecorationIcon: ShuffleUiKitIcons.photo,
                ),
                SpacingFoundation.verticalSpace12,
                UiKitInfluencerProfileNewsTile(
                  onTap: () {
                    _animateToSpecialTabPosition().whenComplete(() {
                      specialTabsController.animateTo(0);
                    });
                  },
                  leadingImageLink:
                      'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/app-ads-banners/mock_ad_banner_2.png',
                  title: '+2 voices',
                  subtitle: 'La vue citytel group',
                  titleDecorationIcon: ShuffleUiKitIcons.voice,
                ),
                SpacingFoundation.verticalSpace12,
                UiKitInfluencerProfileNewsTile(
                  onTap: () {
                    _animateToSpecialTabPosition().whenComplete(() {
                      specialTabsController.animateTo(3);
                    });
                  },
                  leadingImageLink: GraphicsFoundation.instance.png.placeSocial4.path,
                  title: 'News interview',
                  subtitle:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  titleDecorationIcon: ShuffleUiKitIcons.playoutline,
                ),
              ],
            ).paddingAll(EdgeInsetsFoundation.all16),
          ),
          SpacingFoundation.verticalSpace24,
          UiKitCustomTabBar.badged(
            key: specialTabsKey,
            tabController: specialTabsController,
            scrollable: true,
            tabs: [
              UiKitBadgedCustomTab(title: S.current.Voice, badgeValue: voiceBadgeCount),
              UiKitBadgedCustomTab(title: S.current.Photo, badgeValue: photoBadgeCount),
              UiKitBadgedCustomTab(title: S.current.IdealRoute, badgeValue: idealRouteBadgeCount),
              UiKitBadgedCustomTab(title: S.current.Interview, badgeValue: interviewBadgeCount),
              UiKitBadgedCustomTab(title: S.current.Chat, badgeValue: chatBadgeCount),
              UiKitBadgedCustomTab(title: S.current.NFT, badgeValue: nftBadgeCount),
              UiKitBadgedCustomTab(title: S.current.Contest, badgeValue: contestBadgeCount),
              UiKitBadgedCustomTab(title: S.current.Video, badgeValue: videoBadgeCount),
            ],
            onTappedTab: (index) {
              // setSpecialTabsContentHeight(index);
            },
          ),
          SpacingFoundation.verticalSpace16,
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: specialTabsHeight,
            padding: EdgeInsets.symmetric(horizontal: EdgeInsetsFoundation.horizontal16),
            child: TabBarView(
              controller: specialTabsController,
              children: [
                UiKitShowMoreTitledSection(
                  onShowMore: () {},
                  title: S.current.Voice,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      UiKitContentVoiceReactionCard(
                        contentTitle: 'The best place',
                        datePosted: DateTime.now().subtract(const Duration(hours: 16)),
                        audioMessage: UiKitAudioMessageTile(width: 0.5125.sw, audioWaveCount: 50),
                        imageLink: GraphicsFoundation.instance.png.placeSocial1.path,
                        properties: [
                          UiKitTag(
                            title: '4.5',
                            icon: ShuffleUiKitIcons.starfill,
                            iconColor: colorScheme?.inversePrimary,
                            textColor: colorScheme?.inversePrimary,
                            unique: false,
                          ),
                          UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: false),
                          UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: false),
                          UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: false),
                          UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: false),
                          UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: false),
                          UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail, unique: true),
                          UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: true),
                          UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: true),
                          UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: true),
                          UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: true),
                          UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: true),
                        ],
                      ),
                      SpacingFoundation.verticalSpace16,
                      UiKitContentVoiceReactionCard(
                        contentTitle: 'The best place for a date',
                        datePosted: DateTime.now().subtract(const Duration(hours: 16)),
                        audioMessage: UiKitAudioMessageTile(width: 0.5125.sw, audioWaveCount: 50),
                        imageLink: GraphicsFoundation.instance.png.placeSocial1.path,
                        properties: [
                          UiKitTag(
                            title: '4.5',
                            icon: ShuffleUiKitIcons.starfill,
                            iconColor: colorScheme?.inversePrimary,
                            textColor: colorScheme?.inversePrimary,
                            unique: false,
                          ),
                          UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: false),
                          UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: false),
                          UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: false),
                          UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: false),
                          UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: false),
                          UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail, unique: true),
                          UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: true),
                          UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: true),
                          UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: true),
                          UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: true),
                          UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: true),
                        ],
                      ),
                    ],
                  ),
                ),
                UiKitShowMoreTitledSection(
                  title: S.current.Photo,
                  onShowMore: () {},
                  content: UiKitPhotoSliderWithReactions(
                    photos: List<String>.generate(
                      5,
                      (index) {
                        return [
                          'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/app-ads-banners/mock_ad_banner_1.png',
                          'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/app-ads-banners/mock_ad_banner_2.png',
                          'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/app-ads-banners/mock_ad_banner_3.png',
                          'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/app-ads-banners/mock_ad_banner_4.png',
                          'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/app-ads-banners/mock_ad_banner_5.png',
                        ].elementAt(index);
                      },
                    ),
                    title: 'The best title',
                    hearEyesReactions: 100,
                    thumbsUpReactions: 14,
                    sunglassesReactions: 0,
                    fireReactions: 0,
                    smileyReactions: 0,
                  ),
                ),
                UiKitShowMoreTitledSection(
                  onShowMore: () {},
                  title: S.current.IdealRoute,
                  content: ImageWidget(
                    rasterAsset: GraphicsFoundation.instance.png.mapMock,
                  ),
                ),
                UiKitShowMoreTitledSection(
                  onShowMore: () {},
                  title: S.current.Interview,
                  content: UiKitVideoPlayerWithContentDetails(
                    videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
                    contentImageLink:
                        'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/app-ads-banners/mock_ad_banner_1.png',
                    contentName: 'La vue citytel group',
                    datePosted: DateTime.now().subtract(const Duration(hours: 12)),
                  ),
                ),
                UiKitShowMoreTitledSection(
                  title: S.current.Chat,
                  onShowMore: () {},
                  content: UiKitInfluencerProfileChatCard(
                    chatCover:
                        'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/app-ads-banners/mock_ad_banner_7.png',
                    chatLastMessage:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    newCommentsCount: 10,
                    allCommentsCount: 100,
                    lastMessageDate: DateTime.now().subtract(const Duration(minutes: 12)),
                    chatStartDate: DateTime.now().subtract(const Duration(days: 125)),
                    chatContentTitle: 'Best birthday ever',
                    chatContentSubtitle: 'Virgins on the beach',
                    chatContentImage:
                        'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/app-ads-banners/mock_ad_banner_9.png',
                    chatContentStartMessage:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  ),
                ),
                UiKitShowMoreTitledSection(
                  underService: true,
                  onShowMore: () {},
                  title: S.current.NFT,
                  content: UiKitFotoramioViewer(
                    photos: [
                      GraphicsFoundation.instance.png.nft1.path,
                      GraphicsFoundation.instance.png.nft2.path,
                      GraphicsFoundation.instance.png.nft3.path,
                    ],
                  ),
                ),
                UiKitShowMoreTitledSection(
                  underService: true,
                  onShowMore: () {},
                  title: S.current.Contest,
                  content: UiKitContestCard(
                    icon: GraphicsFoundation.instance.png.rating.path,
                    contestTitle: 'Today\'s contest',
                    contestDescription:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    contentImage: GraphicsFoundation.instance.png.place.path,
                    contentTitle: 'Some title',
                    contestDate: DateTime.now().subtract(const Duration(days: 1)),
                    contentProperties: [
                      UiKitTag(title: 'Beach', icon: GraphicsFoundation.instance.svg.cocktail2.path),
                      UiKitTag(title: 'Beach', icon: ShuffleUiKitIcons.sun),
                      UiKitTag(title: 'Beach', icon: GraphicsFoundation.instance.svg.cocktail2.path),
                    ],
                    contentDescription:
                        'Lorem ipsum dolor sit amet, ai elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    onSeeMore: () {},
                  ),
                ),
                UiKitShowMoreTitledSection(
                  onShowMore: () {},
                  title: S.current.Video,
                  content: const UiKitVideoPlayerWithContentDetails(
                    videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
                  ),
                ),
              ],
            ),
          ),
          SpacingFoundation.verticalSpace24,
          UiKitCustomTabBar(
            tabController: activityTabsController,
            tabs: [
              UiKitCustomTab(title: S.current.Reviews.toUpperCase(), group: activityTabsSizeGroup),
              UiKitCustomTab(title: S.current.Top.toUpperCase(), group: activityTabsSizeGroup),
              UiKitCustomTab(title: S.current.Respect.toUpperCase(), group: activityTabsSizeGroup),
            ],
            onTappedTab: (index) {
              _setActivityTabsContentHeight(index);
            },
          ),
          SpacingFoundation.verticalSpace16,
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: _activityTabsContentHeight,
            child: TabBarView(
              controller: activityTabsController,
              children: [
                Column(
                  children: [
                    ProfileStoriesList(
                      stories: List.generate(
                        5,
                        (index) => const ProfileVideoReaction(
                          image: 'assets/images/png/profile_story_1.png',
                        ),
                      ),
                    ),
                    SpacingFoundation.verticalSpace24,
                    ProfilePostsPlaces(
                      onExpand: () => setState(() => _activityTabsContentHeight += (bigScreen
                          ? 0.26.sh
                          : midScreen
                              ? 0.27.sh
                              : 0.325.sh)),
                      horizontalMargin: EdgeInsetsFoundation.horizontal16,
                      places: List.generate(
                        5,
                        (index) => ProfilePlace(
                          image: 'assets/images/png/profile_post_1.png',
                          title: 'Virgins on the beach',
                          createdAt: DateTime.now().subtract(Duration(days: index + 1)),
                          stars: index == 0 ? 5 : null,
                          heartEyeCount: 12,
                          thumbsUpCount: 32,
                          fireCount: 0,
                          sunglassesCount: 0,
                          smileyCount: 0,
                          postBody:
                              'It’s certainly hidden away, found around a corner past a couple of closed-down outlets and facing the back of a health centre in Cluster F, crammed into one of the tiniest spaces in the teeming JLT neighbourhood.',
                          tags: [
                            UiKitTag(
                              icon: ShuffleUiKitIcons.cocktail,
                              title: 'Club',
                              unique: false,
                            ),
                            UiKitTag(
                              icon: ShuffleUiKitIcons.cocktail,
                              title: 'Restaurant',
                              unique: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                InfluencerPersonalTop(
                  categories: [
                    InfluencerTopCategory(
                      title: 'Best Birthday ever',
                      iconPath: GraphicsFoundation.instance.png.likeHands.path,
                      items: List.generate(
                        2,
                        (index) => InfluencerTopContentData(
                          title: 'Virgins on the beach',
                          imageUrl: GraphicsFoundation.instance.png.placeSocial1.path,
                          datePosted: DateTime.now().subtract(Duration(days: index + 1)),
                          tags: [
                            UiKitTag(
                              title: '4.5',
                              icon: ShuffleUiKitIcons.starfill,
                              iconColor: colorScheme?.inversePrimary,
                              textColor: colorScheme?.inversePrimary,
                            ),
                            UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical),
                            UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical),
                            UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical),
                            UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical),
                            UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical),
                          ],
                        ),
                      ),
                    ),
                    InfluencerTopCategory(
                      title: 'Cools you down',
                      iconPath: GraphicsFoundation.instance.png.icecream.path,
                      items: List.generate(
                        2,
                        (index) => InfluencerTopContentData(
                          title: 'Virgins on the beach',
                          imageUrl:
                              'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/app-ads-banners/mock_ad_banner_9.png',
                          datePosted: DateTime.now().subtract(Duration(days: index + 1)),
                          tags: [
                            UiKitTag(
                              title: '4.5',
                              icon: ShuffleUiKitIcons.starfill,
                              iconColor: colorScheme?.inversePrimary,
                              textColor: colorScheme?.inversePrimary,
                            ),
                            UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail),
                            UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail),
                            UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail),
                            UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail),
                            UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail),
                          ],
                        ),
                      ),
                    ),
                    InfluencerTopCategory(
                      title: 'Thrills and Chills',
                      iconPath: GraphicsFoundation.instance.png.rockNRollHands.path,
                      items: List.generate(
                        2,
                        (index) => InfluencerTopContentData(
                          title: 'Virgins on the beach',
                          imageUrl:
                              'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/app-ads-banners/mock_ad_banner_7.png',
                          datePosted: DateTime.now().subtract(Duration(days: index + 1)),
                          tags: [
                            UiKitTag(
                              title: '4.5',
                              icon: ShuffleUiKitIcons.starfill,
                              iconColor: colorScheme?.inversePrimary,
                              textColor: colorScheme?.inversePrimary,
                            ),
                            UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical),
                            UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical),
                            UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical),
                            UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical),
                            UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical),
                          ],
                        ),
                      ),
                    ),
                    InfluencerTopCategory(
                      title: 'Entertain Me: My favourite hangouts',
                      iconPath: GraphicsFoundation.instance.png.victoryHands.path,
                      items: List.generate(
                        2,
                        (index) => InfluencerTopContentData(
                          title: 'Virgins on the beach',
                          imageUrl: GraphicsFoundation.instance.png.placeSocial4.path,
                          datePosted: DateTime.now().subtract(Duration(days: index + 1)),
                          tags: [
                            UiKitTag(
                              title: '4.5',
                              icon: ShuffleUiKitIcons.starfill,
                              iconColor: colorScheme?.inversePrimary,
                              textColor: colorScheme?.inversePrimary,
                            ),
                            UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical),
                            UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical),
                            UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical),
                            UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical),
                            UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical),
                          ],
                        ),
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
                InfluencerRespectTab(
                  items: [
                    ContentPreviewWithRespect(
                      images: [
                        'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/app-ads-banners/mock_ad_banner_7.png',
                        'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/app-ads-banners/mock_ad_banner_11.png',
                        'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/app-ads-banners/mock_ad_banner_10.png',
                      ],
                      title: 'Virgins on the beach',
                      respectFromUsers: [
                        RespectFromUser(
                            name: 'John Doe', avatarUrl: GraphicsFoundation.instance.png.serviceSocial3.path),
                        RespectFromUser(
                            name: 'John Doe', avatarUrl: GraphicsFoundation.instance.png.serviceSocial1.path),
                        RespectFromUser(
                            name: 'John Doe', avatarUrl: GraphicsFoundation.instance.png.serviceSocial2.path),
                        RespectFromUser(
                            name: 'John Doe', avatarUrl: GraphicsFoundation.instance.png.serviceSocial4.path),
                      ],
                      properties: [
                        UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: false),
                        UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: false),
                        UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: false),
                        UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: false),
                        UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: false),
                        UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: true),
                        UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: true),
                        UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: true),
                        UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: true),
                      ],
                    ),
                    ContentPreviewWithRespect(
                      images: [
                        'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/app-ads-banners/mock_ad_banner_7.png',
                        'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/app-ads-banners/mock_ad_banner_11.png',
                        'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/app-ads-banners/mock_ad_banner_10.png',
                      ],
                      title: 'Virgins on the beach',
                      respectFromUsers: [
                        RespectFromUser(
                            name: 'John Doe', avatarUrl: GraphicsFoundation.instance.png.serviceSocial3.path),
                      ],
                      properties: [
                        UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: false),
                        UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: false),
                        UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: false),
                        UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: false),
                        UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktailtropical, unique: false),
                      ],
                    ),
                  ],
                ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
              ],
            ),
          ),
          SpacingFoundation.bottomNavigationBarSpacing,
        ],
      ),
    );
  }
}
