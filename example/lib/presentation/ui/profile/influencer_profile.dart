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
                Padding(
                  padding: EdgeInsetsFoundation.all16,
                  child: ProfileCard(
                    profileData: VisitingProfileData(
                      nickname: '@marywill',
                      description: 'Just walking here and there trying to find something unique and interesting to show you!',
                      avatarUrl: 'assets/images/png/profile_avatar.png',
                      interests: ['Restaurants', 'Hookah', 'Roller Coaster', 'Swimmings'],
                      followers: 2650,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsFoundation.horizontal16,
                  child: ProfileHighlights(
                    placesVisited: 934,
                    reviewsPosted: 630,
                    points: 32040,
                  ),
                ),
                SpacingFoundation.verticalSpace24,
                Padding(
                  padding: EdgeInsetsFoundation.horizontal16,
                  child: ProfileAttitudeTabs(
                    onTappedTab: (index) {},
                    tabs: const [
                      ProfileAttitudeTab(title: 'LOVED'),
                      ProfileAttitudeTab(title: 'HATED'),
                    ],
                  ),
                ),
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
                createdAt: '2 hours ago',
                stars: index == 0 ? 5 : null,
                postReactionCount: index + 1,
                postBody:
                    'It’s certainly hidden away, found around a corner past a couple of closed-down outlets and facing the back of a health centre in Cluster F, crammed into one of the tiniest spaces in the teeming JLT neighbourhood.',
                tags: [
                  ProfilePlaceTag(
                    icon: 'assets/images/svg/cocktail.svg',
                    title: 'Club',
                  ),
                  ProfilePlaceTag(
                    icon: 'assets/images/svg/cocktail.svg',
                    title: 'Restaurant',
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsetsFoundation.all16,
                  child: GeneralPurposeButtonWithChild(
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Next 5 reviews'.toUpperCase(),
                          style: Theme.of(context).extension<UiKitThemeData>()?.boldTextTheme.caption1UpperCase.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        SpacingFoundation.horizontalSpace4,
                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                SpacingFoundation.verticalSpace24
              ],
            ),
          ),
        ],
      ),
    );
  }
}
