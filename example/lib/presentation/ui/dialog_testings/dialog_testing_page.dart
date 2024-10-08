import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class DialogTestingPage extends StatelessWidget {
  const DialogTestingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SpacingFoundation.verticalSpace16,
                context.button(
                  data: BaseUiKitButtonData(
                    text: 'show global content alert dialog',
                    onPressed: () => showDialog(
                      context: context,
                      useSafeArea: true,
                      builder: (context) => const GlobalContentAlertDialog(),
                    ),
                  ),
                ),
                SpacingFoundation.verticalSpace16,
                context.button(
                  data: BaseUiKitButtonData(
                    onPressed: () {
                      context.push(
                        const UiKitModerationVideoPlayer(
                          videoUrl:
                              'https://shuffle-development.s3.amazonaws.com/reactions/97f94f56-b929-4045-8bfb-88fa5fa158a1.mp4',
                          // 'https://shuffle-development.s3.amazonaws.com/reactions/260215b2-6d56-4353-bd49-d0badd292768.mp4',
                        ),
                      );
                    },
                    text: 'show video player',
                  ),
                ),
                SpacingFoundation.verticalSpace16,
                context.button(
                  data: BaseUiKitButtonData(
                    text: 'Show location suggestion dialog',
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => UiKitLocationSuggestionDialog(
                        title: S.current.EnterPlaceAddressPrompt,
                        bodyText: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'If a place already exists in ',
                                style: textTheme?.body.copyWith(color: colorScheme?.surface),
                              ),
                              TextSpan(
                                text: 'shuffle, ',
                                style: textTheme?.subHeadline.copyWith(color: colorScheme?.surface),
                              ),
                              TextSpan(
                                text: 'just confirm it',
                                style: textTheme?.body.copyWith(color: colorScheme?.surface),
                              ),
                            ],
                          ),
                        ),
                        onContinue: () {},
                        onLocationFieldTapped: () async {
                          await Future.delayed(const Duration(seconds: 1));
                          return 'Tashkent';
                        },
                        onLocationNameLoaded: (value) {
                          log('from location name loaded $value', name: 'DialogTestingPage');
                        },
                      ),
                    ),
                  ),
                ),
                SpacingFoundation.verticalSpace16,
                OrdinaryButton(
                  text: 'Video-reactions dialog',
                  onPressed: () => showUiKitAlertDialog(
                    context,
                    AlertDialogData(
                      customBackgroundColor: colorScheme?.surface3,
                      defaultButtonText: '',
                      title: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.pop();
                                },
                                child: ImageWidget(
                                  iconData: ShuffleUiKitIcons.x,
                                  color: colorScheme?.inversePrimary,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  S.of(context).VideoReactions,
                                  style: context.uiKitTheme?.regularTextTheme.titleLarge,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      content: UiKitVideoReactionsModeration(
                        videoUrl: '',
                        feedbackInfo: UiKitFeedbackInfo(
                          onSubmit: () {},
                          dateTime: DateTime.now(),
                          removeFunction: () {},
                          isModerated: false,
                          onModerated: () {},
                          userName: 'Ryan Gosling',
                        ),
                      ),
                    ),
                  ),
                ),
                SpacingFoundation.verticalSpace16,
                OrdinaryButton(
                  text: 'Dialog bottom sheet fullscreen',
                  onPressed: () => showUiKitGeneralFullScreenDialog(
                      context,
                      GeneralDialogData(
                          topPadding: 300,
                          useRootNavigator: false,
                          child: Column(
                            children: List.generate(5, (index) => const Placeholder().paddingSymmetric(vertical: 8)),
                          ),
                          bottomBar: Center(
                            child: Container(
                              width: 100,
                              height: 56,
                              color: Colors.red,
                            ),
                          ))),
                ),
                SpacingFoundation.verticalSpace16,
                OrdinaryButton(
                  text: 'Dialog calendar picker',
                  onPressed: () => showUiKitCalendarDialog(
                    context,
                  ),
                ),
                SpacingFoundation.verticalSpace16,
                OrdinaryButton(
                  text: 'Dialog calendarFromTo picker',
                  onPressed: () => showUiKitCalendarFromToDialog(context, (from, to) {}),
                ),
                SpacingFoundation.verticalSpace16,
                OrdinaryButton(
                  text: 'Dialog time picker',
                  onPressed: () => showUiKitTimeDialog(
                    context,
                  ),
                ),
                SpacingFoundation.verticalSpace16,

                OrdinaryButton(
                  text: 'Dialog timeFromTo picker',
                  onPressed: () => showUiKitTimeFromToDialog(context, (from, to) {}),
                ),
                SpacingFoundation.verticalSpace16,
                //почему то работает только так отображение поповера, надо подумать
                Builder(
                  builder: (c) => OrdinaryButton(
                    text: 'Dialog comment',
                    onPressed: () => showUiKitPopover(c,
                        title: const Text('Premium account'),
                        buttonText: 'see more',
                        description: const Text('Only premium account users can post reactions')),
                  ),
                ),
                SpacingFoundation.verticalSpace16,
                OrdinaryButton(
                  text: 'Dialog alert',
                  onPressed: () => showUiKitAlertDialog(
                    context,
                    AlertDialogData(
                        defaultButtonText: 'text',
                        title: const Text('You sent an invitation to 2 people.'),
                        content: const Text('Invitations can be viewed in private messages')),
                  ),
                ),
                SpacingFoundation.verticalSpace16,
                OrdinaryButton(
                  text: 'Fullscreen Dialog',
                  onPressed: () {
                    showUiKitFullScreenAlertDialog(
                      context,
                      child: (_, textStyle) => UiKitHintDialog(
                        title: 'Fullscreen Dialog',
                        textStyle: context.uiKitTheme?.boldTextTheme.title2,
                        subtitle: 'you get exactly what you need',
                        dismissText: 'OKAY, COOL!',
                        onDismiss: () => Navigator.pop(_),
                        hintTiles: [
                          const UiKitIconHintCard(
                            icon: ImageWidget(
                              iconData: ShuffleUiKitIcons.map,
                            ),
                            hint: 'your location',
                          ),
                          UiKitIconHintCard(
                            icon: ImageWidget(
                              svgAsset: GraphicsFoundation.instance.svg.dart,
                            ),
                            hint: 'your interests',
                          ),
                          const UiKitIconHintCard(
                            icon: ImageWidget(
                              iconData: ShuffleUiKitIcons.cloudsun,
                            ),
                            hint: 'weather around',
                          ),
                          const UiKitIconHintCard(
                            icon: ImageWidget(
                              iconData: ShuffleUiKitIcons.moodawe,
                            ),
                            hint: 'and other 14 scales',
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SpacingFoundation.verticalSpace16,
                context.button(
                  data: BaseUiKitButtonData(
                    text: 'Show modal bottom sheet',
                    onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: List.generate(5, (index) => const Placeholder().paddingSymmetric(vertical: 8)),
                        ),
                      ),
                    ),
                  ),
                ),
                SpacingFoundation.verticalSpace16,
                OrdinaryButton(
                  text: 'show Geolocation alert',
                  onPressed: () => showGeolocationAlert(context, onTap: () {}),
                ),
                SpacingFoundation.verticalSpace16,
                OrdinaryButton(
                  text: 'show Settings alert',
                  onPressed: () => showSettingsAlert(context, onTap: () {}),
                ),
                SpacingFoundation.verticalSpace16,
                OrdinaryButton(
                  text: 'show complaint pop up',
                  onPressed: () => showComplaintPopUp(context),
                ),
                SpacingFoundation.verticalSpace16,
                OrdinaryButton(
                  text: 'show incorrect login pop up',
                  onPressed: () => showIncorrectLoginPopUp(context, onForgotPasswordTap: () => context.pop()),
                ),
                SpacingFoundation.verticalSpace16,
                OrdinaryButton(
                  text: 'show reset password pop up',
                  onPressed: () => showResetPasswordPopUp(context,
                      emailController: TextEditingController(),
                      onSubmitted: (String value) =>
                          log('from show reset password pop up $value', name: 'DialogTestingPage'),
                      emailKey: GlobalKey<FormState>(),
                      validator: (value) {
                        if (value != null && value.length > 5 && value.contains('@')) {
                          return null;
                        } else {
                          return 'Incorrect email';
                        }
                      }),
                ),
                SpacingFoundation.verticalSpace16,
                OrdinaryButton(
                  text: 'UiKit Property Management Icons',
                  onPressed: () => showUiKitAlertDialog(
                    context,
                    AlertDialogData(
                      defaultButtonText: '',
                      title: Text(
                        S.of(context).Icons,
                        style: textTheme?.title1.copyWith(color: Colors.black),
                      ),
                      content: UiKitPropertyIcons(
                        textFieldHintText: S.of(context).Weather,
                        onPressed: () {},
                        listIconPath: [],
                      ),
                    ),
                  ),
                ),
                SpacingFoundation.verticalSpace16,
                OrdinaryButton(
                  text: 'UiKit Property Management Related Properties',
                  onPressed: () => showUiKitAlertDialog(
                    context,
                    AlertDialogData(
                      defaultButtonText: '',
                      title: Text(
                        S.of(context).RelatedProperties,
                        style: textTheme?.title1.copyWith(color: Colors.black),
                      ),
                      content: UiKitPropertyRelatedProperties(
                        textEditingController: TextEditingController(),
                        listRelatedPropertiesItem: [
                          RelatedPropertiesItemUiModel(
                            iconData: ShuffleUiKitIcons.active,
                            propertiesList: [
                              'Restaurants',
                              'Cafe',
                              'Coffee',
                              'shops',
                            ],
                            title: 'Air conditioners on the terrace',
                          ),
                          RelatedPropertiesItemUiModel(
                            iconData: ShuffleUiKitIcons.active,
                            propertiesList: [
                              'Swimming pools',
                            ],
                            title: 'Cooled',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SpacingFoundation.verticalSpace16,
                OrdinaryButton(
                  text: 'UiKit Recently Added icons',
                  onPressed: () => showUiKitAlertDialog(
                    context,
                    AlertDialogData(
                      defaultButtonText: '',
                      title: Row(
                        children: [
                          Flexible(
                            child: Text(
                              S.of(context).RecentlyAdded,
                              style: textTheme?.title1.copyWith(color: Colors.black),
                            ),
                          ),
                          Text(
                            S.of(context).Date,
                            style: textTheme?.labelLarge.copyWith(
                              color: const Color(0xFF97999D),
                            ),
                          ),
                          context.boxIconButton(
                            data: BaseUiKitButtonData(
                              onPressed: () {},
                              backgroundColor: Colors.transparent,
                              iconInfo: BaseUiKitButtonIconData(
                                iconData: ShuffleUiKitIcons.arrowdown,
                                color: colorScheme?.darkNeutral900,
                              ),
                            ),
                          )
                        ],
                      ),
                      content: UiKitPropertyRecentlyAdded(
                        listIconPath: [],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
