import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class InfluencerProfile extends StatelessWidget {
  const InfluencerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Marry Williams',
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ProfileCard(
                  speciality: 'Entertainer',
                  socialLinks: const [
                    'https://www.instagram.com/marrywilliams/',
                    'https://www.tg.me/marrywilliams/',
                  ],
                  onShare: (){},

                  nickname: 'marywill',
                  name: 'Some name',
                  description: 'Just walking here and there trying to find something unique and interesting to show you!',
                  avatarUrl: 'assets/images/png/profile_avatar.png',
                  interests: const ['Restaurants', 'Hookah', 'Roller Coaster', 'Swimmings'],
                  profileType: ProfileCardType.personal,
                  userTileType: UserTileType.influencer,
                  achievements: List.generate(
                      9,
                          (index) => UiKitAchievementsModel(
                          title: 'Achievement ${index + 1}',
                          asset: index != 0 && index % 3 == 0
                              ? null
                              : index % 2 == 0
                              ? GraphicsFoundation.instance.png.goldenCup
                              : GraphicsFoundation.instance.png.goldenMedal)),
                  followers: 2650,
                  onFollow: () {},
                ).paddingAll(EdgeInsetsFoundation.all16),
                const ProfileHighlights(
                  placesVisited: 934,
                  reviewsPosted: 630,
                  points: 32040,
                ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
                SpacingFoundation.verticalSpace24,
                UiKitCustomTabBar(
                  onTappedTab: (index) {},
                  tabs: const [
                    UiKitCustomTab(title: 'LOVED'),
                    UiKitCustomTab(title: 'HATED'),
                  ],
                ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
                SpacingFoundation.verticalSpace24,
                ProfileStoriesList(
                  stories: List.generate(
                    5,
                    (index) => const ProfileStory(
                      image: 'assets/images/png/profile_story_1.png',
                    ),
                  ),
                ),
                SpacingFoundation.verticalSpace24,
              ],
            ),
          ),
          ProfilePostsPlaces(
            places: List.generate(
              5,
              (index) => ProfilePlace(
                image: 'assets/images/png/profile_post_1.png',
                title: 'Virgins on the beach',
                createdAt: DateTime.now().subtract(Duration(days: index + 1)),
                stars: index == 0 ? 5 : null,
                helpfulCount: index + 1,
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
          SliverList(
            delegate: SliverChildListDelegate(
              [
                context
                    .button(
                      data: BaseUiKitButtonData(
                        onPressed: () {},
                        text: 'Next 5 reviews',
                        iconInfo: BaseUiKitButtonIconData(
                          iconData: Icons.keyboard_arrow_down_rounded,
                          color: Colors.black,
                        ),
                      ),
                    )
                    .paddingAll(EdgeInsetsFoundation.all16),
                SpacingFoundation.verticalSpace24
              ],
            ),
          ),
        ],
      ),
    );
  }
}
