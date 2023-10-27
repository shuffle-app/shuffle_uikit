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
