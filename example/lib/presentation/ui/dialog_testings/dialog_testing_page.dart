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
                                style: textTheme?.body
                                    .copyWith(color: colorScheme?.surface),
                              ),
                              TextSpan(
                                text: 'shuffle, ',
                                style: textTheme?.subHeadline
                                    .copyWith(color: colorScheme?.surface),
                              ),
                              TextSpan(
                                text: 'just confirm it',
                                style: textTheme?.body
                                    .copyWith(color: colorScheme?.surface),
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
                          log('from location name loaded $value',
                              name: 'DialogTestingPage');
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
                                  style: context
                                      .uiKitTheme?.regularTextTheme.titleLarge,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      content: UiKitVideoReactionsModeration(
                        videoFile: null,
                        feedbackInfo: UiKitFeedbackInfo(
                          onSubmit: (expandThreadIsOpen) {},
                          dateTime: DateTime.now(),
                          removeFunction: () {},
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
                            children: List.generate(
                                5,
                                (index) => const Placeholder()
                                    .paddingSymmetric(vertical: 8)),
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
                  onPressed: () =>
                      showUiKitCalendarFromToDialog(context, (from, to) {}),
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
                  onPressed: () =>
                      showUiKitTimeFromToDialog(context, (from, to) {}),
                ),
                SpacingFoundation.verticalSpace16,
                //почему то работает только так отображение поповера, надо подумать
                Builder(
                  builder: (c) => OrdinaryButton(
                    text: 'Dialog comment',
                    onPressed: () => showUiKitPopover(c,
                        title: const Text('Premium account'),
                        buttonText: 'see more',
                        description: const Text(
                            'Only premium account users can post reactions')),
                  ),
                ),
                SpacingFoundation.verticalSpace16,
                OrdinaryButton(
                  text: 'Dialog alert',
                  onPressed: () => showUiKitAlertDialog(
                    context,
                    AlertDialogData(
                        defaultButtonText: 'text',
                        title:
                            const Text('You sent an invitation to 2 people.'),
                        content: const Text(
                            'Invitations can be viewed in private messages')),
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
                        hintTiles: const [
                          UiKitIconHintCard(
                            icon: ImageWidget(
                              iconData: ShuffleUiKitIcons.map,
                            ),
                            hint: 'your location',
                          ),
                          UiKitIconHintCard(
                            icon: ImageWidget(
                              iconData: ShuffleUiKitIcons.dart,
                            ),
                            hint: 'your interests',
                          ),
                          UiKitIconHintCard(
                            icon: ImageWidget(
                              iconData: ShuffleUiKitIcons.sunclouds,
                            ),
                            hint: 'weather around',
                          ),
                          UiKitIconHintCard(
                            icon: ImageWidget(
                              iconData: ShuffleUiKitIcons.smilemood,
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
                          children: List.generate(
                              5,
                              (index) => const Placeholder()
                                  .paddingSymmetric(vertical: 8)),
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
                  onPressed: () => showIncorrectLoginPopUp(context,
                      onForgotPasswordTap: () => context.pop()),
                ),
                SpacingFoundation.verticalSpace16,
                OrdinaryButton(
                  text: 'show reset password pop up',
                  onPressed: () => showResetPasswordPopUp(context,
                      emailController: TextEditingController(),
                      onSubmitted: (String value) => log(
                          'from show reset password pop up $value',
                          name: 'DialogTestingPage'),
                      emailKey: GlobalKey<FormState>(),
                      validator: (value) {
                        if (value != null &&
                            value.length > 5 &&
                            value.contains('@')) {
                          return null;
                        } else {
                          return 'Incorrect email';
                        }
                      }),
                ),
                SpacingFoundation.verticalSpace16,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
