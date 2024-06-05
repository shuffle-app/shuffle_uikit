// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ProProfilePage extends StatelessWidget {
  final int? events;
  final int? reviews;
  final int? bookings;

  const ProProfilePage({
    Key? key,
    this.events,
    this.reviews,
    this.bookings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.uiKitTheme?.colorScheme;
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final autoSizeGroup = AutoSizeGroup();

    return Scaffold(
      body: BlurredAppBarPage(
        title: 'Frankie Hansen',
        autoImplyLeading: true,
        centerTitle: true,
        childrenPadding: EdgeInsets.symmetric(horizontal: EdgeInsetsFoundation.horizontal16),
        children: [
          SpacingFoundation.verticalSpace16,
          ProfileCard(
            profileCardBody: ProPublicProfileCardBody(
              registrationDate: DateTime.now(),
              onTelegramPressed: () {},
              onWhatsappPressed: () {},
              name: 'Frankie Hansen',
              nickname: 'fr4nk1eh4',
              avatarUrl: GraphicsFoundation.instance.png.serviceSocial3.path,
              tags: [
                UiKitTag(title: 'Photographer', icon: null),
                UiKitTag(title: 'Photographer', icon: null),
                UiKitTag(title: 'Photographer', icon: null),
                UiKitTag(title: 'Photographer', icon: null),
              ],
              interests: ['Photography', 'Travel', 'Nature', 'Art'],
              matchingInterests: ['Photography', 'Travel'],
              onShare: () {},
              onFollow: () {},
              following: false,
              phone: '+1 234 567 89 00',
              email: 'frankie@gmail.com',
              followers: 1234,
            ),
            badge: const ProMemberPlate(),
          ),
          SpacingFoundation.verticalSpace24,
          if (events != null && reviews != null && bookings != null)
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: UiKitGradientableStatsCard(
                    gradient: GradientFoundation.silverGradient,
                    autoSizeGroup: autoSizeGroup,
                    maxLines: 1,
                    stats: UiKitStats(
                      title: S.current.EventsCount(900).toLowerCase(),
                      value: profileStatsFormatter(events!),
                      actionButton: const SizedBox.shrink(),
                    ),
                  ),
                ),
                SpacingFoundation.horizontalSpace8,
                Expanded(
                  child: UiKitGradientableStatsCard(
                    gradient: GradientFoundation.bronzeGradient,
                    autoSizeGroup: autoSizeGroup,
                    maxLines: Localizations.localeOf(context).languageCode == 'en' ? 2 : 1,
                    stats: UiKitStats(
                      title: S.current.ReviewsReceived(300).toLowerCase(),
                      value: profileStatsFormatter(reviews!),
                      actionButton: const SizedBox.shrink(),
                    ),
                  ),
                ),
                SpacingFoundation.horizontalSpace8,
                Expanded(
                  child: UiKitGradientableStatsCard(
                    gradient: GradientFoundation.goldGradient,
                    autoSizeGroup: autoSizeGroup,
                    maxLines: 1,
                    stats: UiKitStats(
                      title: S.current.Bookings(16000).toLowerCase(),
                      value: profileStatsFormatter(bookings!),
                      actionButton: const SizedBox.shrink(),
                    ),
                  ),
                ),
              ],
            ),
          SpacingFoundation.verticalSpace24,
          UiKitFieldWithTagList(
            fieldData: ListValueFieldData(
              value: [
                FiledValue(
                  value: [
                    UiKitTag(title: 'catering', icon: null, unique: false),
                  ],
                  valueMask: 'Nich',
                ),
                FiledValue(
                  value: [
                    UiKitTag(title: 'Restaurant', icon: ShuffleUiKitIcons.cutlery, unique: false),
                  ],
                  valueMask: 'Place type',
                ),
                FiledValue(
                  value: [
                    UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cutlery, unique: false),
                    UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cutlery, unique: false),
                    UiKitTag(title: '7 min', icon: ShuffleUiKitIcons.cutlery, unique: false),
                  ],
                  valueMask: 'Base properties',
                ),
                FiledValue(
                  value: [
                    UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cutlery, unique: true),
                    UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cutlery, unique: true),
                    UiKitTag(title: '7 min', icon: ShuffleUiKitIcons.cutlery, unique: true),
                    UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cutlery, unique: true),
                    UiKitTag(title: 'Cheap', icon: ShuffleUiKitIcons.cutlery, unique: true),
                    UiKitTag(title: '7 min', icon: ShuffleUiKitIcons.cutlery, unique: true),
                  ],
                  valueMask: 'Unique properties',
                ),
              ],
            ),
          ),
          if (events != null && reviews != null && bookings != null) SpacingFoundation.verticalSpace24,
          UiKitExpandableList(
            items: List.generate(
              10,
              (index) => UiKitProUserProfileEventCard(
                previewImage: GraphicsFoundation.instance.png.place.path,
                title: '80\'s theme invites only party',
                contentDate: DateTime.now(),
                properties: [
                  UiKitTag(
                    title: '4.5',
                    icon: ShuffleUiKitIcons.starfill,
                    iconColor: colorScheme?.inversePrimary,
                    textColor: colorScheme?.inversePrimary,
                    unique: false,
                  ),
                  UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail2, unique: false),
                  UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail2, unique: false),
                  UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail2, unique: false),
                  UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail2, unique: false),
                  UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail2, unique: false),
                  UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail, unique: true),
                  UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail2, unique: true),
                  UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail2, unique: true),
                  UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail2, unique: true),
                  UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail2, unique: true),
                  UiKitTag(title: 'Club', icon: ShuffleUiKitIcons.cocktail2, unique: true),
                ],
                stories: [
                  ProfileStory(
                    image: GraphicsFoundation.instance.png.mockAdBanner1.path,
                    isEmpty: false,
                    viewed: false,
                  ),
                  ProfileStory(
                    image: GraphicsFoundation.instance.png.mockAdBanner1.path,
                    isEmpty: false,
                    viewed: true,
                  ),
                ],
                reviews: List.generate(
                  10,
                  (index) => UiKitFeedbackCard(
                    helpfulCount: index + 1,
                    title: 'Gale Benson',
                    avatarUrl: GraphicsFoundation.instance.png.serviceSocial2.path,
                    rating: 5,
                    datePosted: DateTime.now().subtract(const Duration(days: 1)),
                    text:
                        'It’s certainly hidden away, found around a corner past a couple of closed-down outlets and facing the back of a health centre in Cluster F, crammed into one of the tiniest spaces in the teeming JLT neighbourhood.',
                    onPressed: () {},
                    onLike: () {},
                  ),
                ),
              ),
            ),
          ),
          SpacingFoundation.bottomNavigationBarSpacing,
        ],
      ),
    );
  }
}
