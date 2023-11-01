// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Okay, cool!`
  String get OkayCool {
    return Intl.message(
      'Okay, cool!',
      name: 'OkayCool',
      desc: '',
      args: [],
    );
  }

  /// `Choose option`
  String get ChooseOption {
    return Intl.message(
      'Choose option',
      name: 'ChooseOption',
      desc: '',
      args: [],
    );
  }

  /// `See more`
  String get SeeMore {
    return Intl.message(
      'See more',
      name: 'SeeMore',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get Confirm {
    return Intl.message(
      'Confirm',
      name: 'Confirm',
      desc: '',
      args: [],
    );
  }

  /// `New place`
  String get NewPlace {
    return Intl.message(
      'New place',
      name: 'NewPlace',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Event`
  String get UpcomingEvent {
    return Intl.message(
      'Upcoming Event',
      name: 'UpcomingEvent',
      desc: '',
      args: [],
    );
  }

  /// `Tap to see more`
  String get TapToSeeMore {
    return Intl.message(
      'Tap to see more',
      name: 'TapToSeeMore',
      desc: '',
      args: [],
    );
  }

  /// `Select option`
  String get SelectOption {
    return Intl.message(
      'Select option',
      name: 'SelectOption',
      desc: '',
      args: [],
    );
  }

  /// `Point Balance`
  String get PointBalance {
    return Intl.message(
      'Point Balance',
      name: 'PointBalance',
      desc: '',
      args: [],
    );
  }

  /// `No preferences chosen`
  String get NoPreferencesChosen {
    return Intl.message(
      'No preferences chosen',
      name: 'NoPreferencesChosen',
      desc: '',
      args: [],
    );
  }

  /// `Ooops!`
  String get Ooops {
    return Intl.message(
      'Ooops!',
      name: 'Ooops',
      desc: '',
      args: [],
    );
  }

  /// `No photo here yet!`
  String get NoPhotoHereYet {
    return Intl.message(
      'No photo here yet!',
      name: 'NoPhotoHereYet',
      desc: '',
      args: [],
    );
  }

  /// `Off`
  String get Off {
    return Intl.message(
      'Off',
      name: 'Off',
      desc: '',
      args: [],
    );
  }

  /// `Health Kit`
  String get HealthKit {
    return Intl.message(
      'Health Kit',
      name: 'HealthKit',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get Loading {
    return Intl.message(
      'Loading...',
      name: 'Loading',
      desc: '',
      args: [],
    );
  }

  /// `That's all for now!`
  String get ThatsAllForNow {
    return Intl.message(
      'That\'s all for now!',
      name: 'ThatsAllForNow',
      desc: '',
      args: [],
    );
  }

  /// `Weather`
  String get Weather {
    return Intl.message(
      'Weather',
      name: 'Weather',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get Follow {
    return Intl.message(
      'Follow',
      name: 'Follow',
      desc: '',
      args: [],
    );
  }

  /// `Followers`
  String get Followers {
    return Intl.message(
      'Followers',
      name: 'Followers',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get Support {
    return Intl.message(
      'Support',
      name: 'Support',
      desc: '',
      args: [],
    );
  }

  /// `Members`
  String get Members {
    return Intl.message(
      'Members',
      name: 'Members',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Directions`
  String get Directions {
    return Intl.message(
      'Directions',
      name: 'Directions',
      desc: '',
      args: [],
    );
  }

  /// `Tap it`
  String get TapIt {
    return Intl.message(
      'Tap it',
      name: 'TapIt',
      desc: '',
      args: [],
    );
  }

  /// `No health kit available on your device, so the result will be random`
  String get NoHealthKitAvailableOnYourDevice {
    return Intl.message(
      'No health kit available on your device, so the result will be random',
      name: 'NoHealthKitAvailableOnYourDevice',
      desc: '',
      args: [],
    );
  }

  /// `Invites you to`
  String get InvitesYouTo {
    return Intl.message(
      'Invites you to',
      name: 'InvitesYouTo',
      desc: '',
      args: [],
    );
  }

  /// `Invites {invitedPeopleCount} people to`
  String InvitesNPeopleTo(Object invitedPeopleCount) {
    return Intl.message(
      'Invites $invitedPeopleCount people to',
      name: 'InvitesNPeopleTo',
      desc: '',
      args: [invitedPeopleCount],
    );
  }

  /// `Not now`
  String get NotNow {
    return Intl.message(
      'Not now',
      name: 'NotNow',
      desc: '',
      args: [],
    );
  }

  /// `Go!`
  String get Go {
    return Intl.message(
      'Go!',
      name: 'Go',
      desc: '',
      args: [],
    );
  }

  /// `Invite more`
  String get InviteMore {
    return Intl.message(
      'Invite more',
      name: 'InviteMore',
      desc: '',
      args: [],
    );
  }

  /// `Сompany answered`
  String get CompanyAnswered {
    return Intl.message(
      'Сompany answered',
      name: 'CompanyAnswered',
      desc: '',
      args: [],
    );
  }

  /// `Helpful`
  String get Helpful {
    return Intl.message(
      'Helpful',
      name: 'Helpful',
      desc: '',
      args: [],
    );
  }

  /// `Helpful {helpfulCount}`
  String HelpfulNCount(Object helpfulCount) {
    return Intl.message(
      'Helpful $helpfulCount',
      name: 'HelpfulNCount',
      desc: '',
      args: [helpfulCount],
    );
  }

  /// `Ok`
  String get Ok {
    return Intl.message(
      'Ok',
      name: 'Ok',
      desc: '',
      args: [],
    );
  }

  /// `No, thx`
  String get NoThx {
    return Intl.message(
      'No, thx',
      name: 'NoThx',
      desc: '',
      args: [],
    );
  }

  /// `To access all`
  String get ToAccessAll {
    return Intl.message(
      'To access all',
      name: 'ToAccessAll',
      desc: '',
      args: [],
    );
  }

  /// `Features enable geolocation`
  String get FeaturesEnableGeolocation {
    return Intl.message(
      'Features enable geolocation',
      name: 'FeaturesEnableGeolocation',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get ForgotPassword {
    return Intl.message(
      'Forgot password',
      name: 'ForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect login or password`
  String get IncorrectLoginOrPassword {
    return Intl.message(
      'Incorrect login or password',
      name: 'IncorrectLoginOrPassword',
      desc: '',
      args: [],
    );
  }

  /// `Oops, I'll try again`
  String get OopsIWillTryAgain {
    return Intl.message(
      'Oops, I\'ll try again',
      name: 'OopsIWillTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your e-mail address`
  String get EnterYourEmailAddress {
    return Intl.message(
      'Enter your e-mail address',
      name: 'EnterYourEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get ResetPassword {
    return Intl.message(
      'Reset password',
      name: 'ResetPassword',
      desc: '',
      args: [],
    );
  }

  /// `How much \$ do you want to donate?`
  String get HowMuchDoYouWantToDonate {
    return Intl.message(
      'How much \\\$ do you want to donate?',
      name: 'HowMuchDoYouWantToDonate',
      desc: '',
      args: [],
    );
  }

  /// `Send it`
  String get SendIt {
    return Intl.message(
      'Send it',
      name: 'SendIt',
      desc: '',
      args: [],
    );
  }

  /// `Go to settings`
  String get GoToSettings {
    return Intl.message(
      'Go to settings',
      name: 'GoToSettings',
      desc: '',
      args: [],
    );
  }

  /// `To allow access to send push notifications, go to your phone settings`
  String get ToAllowAccessGoToSettings {
    return Intl.message(
      'To allow access to send push notifications, go to your phone settings',
      name: 'ToAllowAccessGoToSettings',
      desc: '',
      args: [],
    );
  }

  /// `We will let you know the results`
  String get WeWillLetKnowResults {
    return Intl.message(
      'We will let you know the results',
      name: 'WeWillLetKnowResults',
      desc: '',
      args: [],
    );
  }

  /// `Your claim has been sent`
  String get YourClaimHasBeenSent {
    return Intl.message(
      'Your claim has been sent',
      name: 'YourClaimHasBeenSent',
      desc: '',
      args: [],
    );
  }

  /// `Allowed caracters are {allowedCharacters}`
  String AllowedCaracters(Object allowedCharacters) {
    return Intl.message(
      'Allowed caracters are $allowedCharacters',
      name: 'AllowedCaracters',
      desc: '',
      args: [allowedCharacters],
    );
  }

  /// `Select language`
  String get SelectLanguage {
    return Intl.message(
      'Select language',
      name: 'SelectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Next >>>`
  String get NextWithChevrons {
    return Intl.message(
      'Next >>>',
      name: 'NextWithChevrons',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get Day {
    return Intl.message(
      'Day',
      name: 'Day',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get Month {
    return Intl.message(
      'Month',
      name: 'Month',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get Year {
    return Intl.message(
      'Year',
      name: 'Year',
      desc: '',
      args: [],
    );
  }

  /// `NEXT {amountOfPeople} PEOPLE`
  String NextNPeople(Object amountOfPeople) {
    return Intl.message(
      'NEXT $amountOfPeople PEOPLE',
      name: 'NextNPeople',
      desc: '',
      args: [amountOfPeople],
    );
  }

  /// `Ask people`
  String get AskPeople {
    return Intl.message(
      'Ask people',
      name: 'AskPeople',
      desc: '',
      args: [],
    );
  }

  /// `Ask for donations`
  String get AskForDonations {
    return Intl.message(
      'Ask for donations',
      name: 'AskForDonations',
      desc: '',
      args: [],
    );
  }

  /// `Support people around you`
  String get SupportPeopleAroundYou {
    return Intl.message(
      'Support people around you',
      name: 'SupportPeopleAroundYou',
      desc: '',
      args: [],
    );
  }

  /// `Top {amountOfTopDonators} donators receive x{multiplier} points`
  String TopNDonatorsReceiveXPoints(
      Object amountOfTopDonators, Object multiplier) {
    return Intl.message(
      'Top $amountOfTopDonators donators receive x$multiplier points',
      name: 'TopNDonatorsReceiveXPoints',
      desc: '',
      args: [amountOfTopDonators, multiplier],
    );
  }

  /// `Tell us more{separator}about yourself`
  String TellUsMoreAboutYourself(Object separator) {
    return Intl.message(
      'Tell us more${separator}about yourself',
      name: 'TellUsMoreAboutYourself',
      desc: '',
      args: [separator],
    );
  }

  /// `Tap once to choose `
  String get TapOnceToChoose {
    return Intl.message(
      'Tap once to choose ',
      name: 'TapOnceToChoose',
      desc: '',
      args: [],
    );
  }

  /// `What you like`
  String get WhatYouLike {
    return Intl.message(
      'What you like',
      name: 'WhatYouLike',
      desc: '',
      args: [],
    );
  }

  /// `. Tap twice to mark your favorites.`
  String get TapTwiceToMarkYourFavorites {
    return Intl.message(
      '. Tap twice to mark your favorites.',
      name: 'TapTwiceToMarkYourFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Try\nyourself`
  String get TryYourself {
    return Intl.message(
      'Try\\nyourself',
      name: 'TryYourself',
      desc: '',
      args: [],
    );
  }

  /// `Invite to favourite places`
  String get InviteToFavouritePlaces {
    return Intl.message(
      'Invite to favourite places',
      name: 'InviteToFavouritePlaces',
      desc: '',
      args: [],
    );
  }

  /// `Invite`
  String get Invite {
    return Intl.message(
      'Invite',
      name: 'Invite',
      desc: '',
      args: [],
    );
  }

  /// `Select date`
  String get SelectDate {
    return Intl.message(
      'Select date',
      name: 'SelectDate',
      desc: '',
      args: [],
    );
  }

  /// `NEXT`
  String get Next {
    return Intl.message(
      'NEXT',
      name: 'Next',
      desc: '',
      args: [],
    );
  }

  /// `By continuing you accept the`
  String get ByContinuingYouAcceptThe {
    return Intl.message(
      'By continuing you accept the',
      name: 'ByContinuingYouAcceptThe',
      desc: '',
      args: [],
    );
  }

  /// `And`
  String get And {
    return Intl.message(
      'And',
      name: 'And',
      desc: '',
      args: [],
    );
  }

  /// `Get code`
  String get GetCode {
    return Intl.message(
      'Get code',
      name: 'GetCode',
      desc: '',
      args: [],
    );
  }

  /// `Start to explore`
  String get StartToExplore {
    return Intl.message(
      'Start to explore',
      name: 'StartToExplore',
      desc: '',
      args: [],
    );
  }

  /// `Now let\'s get to know each other`
  String get NowLetsGetToKnowEachOther {
    return Intl.message(
      'Now let\\\'s get to know each other',
      name: 'NowLetsGetToKnowEachOther',
      desc: '',
      args: [],
    );
  }

  /// `The more info we get about you, the better`
  String get TheMoreInfoWeGetTheBetter {
    return Intl.message(
      'The more info we get about you, the better',
      name: 'TheMoreInfoWeGetTheBetter',
      desc: '',
      args: [],
    );
  }

  /// `Your leisure selection`
  String get YourLeisureSelection {
    return Intl.message(
      'Your leisure selection',
      name: 'YourLeisureSelection',
      desc: '',
      args: [],
    );
  }

  /// `Will be.`
  String get WillBe {
    return Intl.message(
      'Will be.',
      name: 'WillBe',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get Name {
    return Intl.message(
      'Name',
      name: 'Name',
      desc: '',
      args: [],
    );
  }

  /// `Nickname`
  String get Nickname {
    return Intl.message(
      'Nickname',
      name: 'Nickname',
      desc: '',
      args: [],
    );
  }

  /// `Describe yourself`
  String get DescribeYourself {
    return Intl.message(
      'Describe yourself',
      name: 'DescribeYourself',
      desc: '',
      args: [],
    );
  }

  /// `Select your religions`
  String get SelectYourReligions {
    return Intl.message(
      'Select your religions',
      name: 'SelectYourReligions',
      desc: '',
      args: [],
    );
  }

  /// `Your age`
  String get YourAge {
    return Intl.message(
      'Your age',
      name: 'YourAge',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get Gender {
    return Intl.message(
      'Gender',
      name: 'Gender',
      desc: '',
      args: [],
    );
  }

  /// `Please select a gender`
  String get PleaseSelectGender {
    return Intl.message(
      'Please select a gender',
      name: 'PleaseSelectGender',
      desc: '',
      args: [],
    );
  }

  /// `Please select at least {religionCount} religion`
  String PleaseSelectAtLeastNReligion(Object religionCount) {
    return Intl.message(
      'Please select at least $religionCount religion',
      name: 'PleaseSelectAtLeastNReligion',
      desc: '',
      args: [religionCount],
    );
  }

  /// `Please select one type`
  String get PleaseSelectOneType {
    return Intl.message(
      'Please select one type',
      name: 'PleaseSelectOneType',
      desc: '',
      args: [],
    );
  }

  /// `This is `
  String get ThisIs {
    return Intl.message(
      'This is ',
      name: 'ThisIs',
      desc: '',
      args: [],
    );
  }

  /// `Shuffle`
  String get Shuffle {
    return Intl.message(
      'Shuffle',
      name: 'Shuffle',
      desc: '',
      args: [],
    );
  }

  /// `Smart leisure selection for everyone, everywhere.`
  String get SmartLeisureSelection {
    return Intl.message(
      'Smart leisure selection for everyone, everywhere.',
      name: 'SmartLeisureSelection',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get Welcome {
    return Intl.message(
      'Welcome',
      name: 'Welcome',
      desc: '',
      args: [],
    );
  }

  /// `Get started`
  String get GetStarted {
    return Intl.message(
      'Get started',
      name: 'GetStarted',
      desc: '',
      args: [],
    );
  }

  /// `What is \n`
  String get WhatIs {
    return Intl.message(
      'What is \\n',
      name: 'WhatIs',
      desc: '',
      args: [],
    );
  }

  /// `For`
  String get For {
    return Intl.message(
      'For',
      name: 'For',
      desc: '',
      args: [],
    );
  }

  /// `Through a non-\naggregator system \nespecially for you`
  String get ThroughANonAggregatorSystem {
    return Intl.message(
      'Through a non-\\naggregator system \\nespecially for you',
      name: 'ThroughANonAggregatorSystem',
      desc: '',
      args: [],
    );
  }

  /// `With your\npreferences`
  String get WithYourPreferences {
    return Intl.message(
      'With your\\npreferences',
      name: 'WithYourPreferences',
      desc: '',
      args: [],
    );
  }

  /// `Don\'t be alone`
  String get DontBeAlone {
    return Intl.message(
      'Don\\\'t be alone',
      name: 'DontBeAlone',
      desc: '',
      args: [],
    );
  }

  /// `Lovely-touch amazing\ninteraction`
  String get LovelyTouchAmazingInteraction {
    return Intl.message(
      'Lovely-touch amazing\\ninteraction',
      name: 'LovelyTouchAmazingInteraction',
      desc: '',
      args: [],
    );
  }

  /// `Selection of the best`
  String get SelectionOfTheBest {
    return Intl.message(
      'Selection of the best',
      name: 'SelectionOfTheBest',
      desc: '',
      args: [],
    );
  }

  /// `\nfree places`
  String get FreePlaces {
    return Intl.message(
      '\\nfree places',
      name: 'FreePlaces',
      desc: '',
      args: [],
    );
  }

  /// `Top places rated\nby`
  String get TopPlacesRatedBy {
    return Intl.message(
      'Top places rated\\nby',
      name: 'TopPlacesRatedBy',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
