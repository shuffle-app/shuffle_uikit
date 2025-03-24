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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Okay, cool!`
  String get OkayCool {
    return Intl.message('Okay, cool!', name: 'OkayCool', desc: '', args: []);
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
    return Intl.message('See more', name: 'SeeMore', desc: '', args: []);
  }

  /// `New place`
  String get NewPlace {
    return Intl.message('New place', name: 'NewPlace', desc: '', args: []);
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

  /// `Point\nBalance`
  String get PointBalance {
    return Intl.message(
      'Point\nBalance',
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
    return Intl.message('Ooops!', name: 'Ooops', desc: '', args: []);
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
    return Intl.message('Off', name: 'Off', desc: '', args: []);
  }

  /// `Niche`
  String get Niche {
    return Intl.message('Niche', name: 'Niche', desc: '', args: []);
  }

  /// `Health Kit`
  String get HealthKit {
    return Intl.message('Health Kit', name: 'HealthKit', desc: '', args: []);
  }

  /// `Loading...`
  String get Loading {
    return Intl.message('Loading...', name: 'Loading', desc: '', args: []);
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
    return Intl.message('Weather', name: 'Weather', desc: '', args: []);
  }

  /// `Follow`
  String get Follow {
    return Intl.message('Follow', name: 'Follow', desc: '', args: []);
  }

  /// `{item, plural, =0{Members} =1{Member} =2{Members} few{Members} other{Members}}`
  String Members(num item) {
    return Intl.plural(
      item,
      zero: 'Members',
      one: 'Member',
      two: 'Members',
      few: 'Members',
      other: 'Members',
      name: 'Members',
      desc: '',
      args: [item],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message('Search', name: 'Search', desc: '', args: []);
  }

  /// `Directions`
  String get Directions {
    return Intl.message('Directions', name: 'Directions', desc: '', args: []);
  }

  /// `Tap it`
  String get TapIt {
    return Intl.message('Tap it', name: 'TapIt', desc: '', args: []);
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

  /// `Invites {invitedPeopleCount, plural, =0{{invitedPeopleCount} people} =1{{invitedPeopleCount} person} =2{{invitedPeopleCount} people} few{{invitedPeopleCount} people} many{{invitedPeopleCount} people} other{{invitedPeopleCount} people}} to`
  String InvitesNPeopleTo(num invitedPeopleCount) {
    return Intl.message(
      'Invites ${Intl.plural(invitedPeopleCount, zero: '$invitedPeopleCount people', one: '$invitedPeopleCount person', two: '$invitedPeopleCount people', few: '$invitedPeopleCount people', many: '$invitedPeopleCount people', other: '$invitedPeopleCount people')} to',
      name: 'InvitesNPeopleTo',
      desc: '',
      args: [invitedPeopleCount],
    );
  }

  /// `Not now`
  String get NotNow {
    return Intl.message('Not now', name: 'NotNow', desc: '', args: []);
  }

  /// `Go!`
  String get Go {
    return Intl.message('Go!', name: 'Go', desc: '', args: []);
  }

  /// `Invite more`
  String get InviteMore {
    return Intl.message('Invite more', name: 'InviteMore', desc: '', args: []);
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
    return Intl.message('Helpful', name: 'Helpful', desc: '', args: []);
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
    return Intl.message('Ok', name: 'Ok', desc: '', args: []);
  }

  /// `No, thx`
  String get NoThx {
    return Intl.message('No, thx', name: 'NoThx', desc: '', args: []);
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
    return Intl.message('Email', name: 'Email', desc: '', args: []);
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

  /// `How much $ do you want to donate?`
  String get HowMuchDoYouWantToDonate {
    return Intl.message(
      'How much \$ do you want to donate?',
      name: 'HowMuchDoYouWantToDonate',
      desc: '',
      args: [],
    );
  }

  /// `Send it`
  String get SendIt {
    return Intl.message('Send it', name: 'SendIt', desc: '', args: []);
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

  /// `Please select language`
  String get SelectLanguage {
    return Intl.message(
      'Please select language',
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

  /// `Month`
  String get Month {
    return Intl.message('Month', name: 'Month', desc: '', args: []);
  }

  /// `Year`
  String get Year {
    return Intl.message('Year', name: 'Year', desc: '', args: []);
  }

  /// `Next {amountOfPeople} people`
  String NextNPeople(Object amountOfPeople) {
    return Intl.message(
      'Next $amountOfPeople people',
      name: 'NextNPeople',
      desc: '',
      args: [amountOfPeople],
    );
  }

  /// `Ask people`
  String get AskPeople {
    return Intl.message('Ask people', name: 'AskPeople', desc: '', args: []);
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
    Object amountOfTopDonators,
    Object multiplier,
  ) {
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

  /// `Tap once to choose`
  String get TapOnceToChoose {
    return Intl.message(
      'Tap once to choose',
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
      'Try\nyourself',
      name: 'TryYourself',
      desc: '',
      args: [],
    );
  }

  /// `Invite to your "Favorites"`
  String get InviteToFavoritePlaces {
    return Intl.message(
      'Invite to your "Favorites"',
      name: 'InviteToFavoritePlaces',
      desc: '',
      args: [],
    );
  }

  /// `Invite`
  String get Invite {
    return Intl.message('Invite', name: 'Invite', desc: '', args: []);
  }

  /// `Select date`
  String get SelectDate {
    return Intl.message('Select date', name: 'SelectDate', desc: '', args: []);
  }

  /// `Next`
  String get Next {
    return Intl.message('Next', name: 'Next', desc: '', args: []);
  }

  /// `By continuing you accept the `
  String get ByContinuingYouAcceptThe {
    return Intl.message(
      'By continuing you accept the ',
      name: 'ByContinuingYouAcceptThe',
      desc: '',
      args: [],
    );
  }

  /// ` And `
  String get AndWithWhitespaces {
    return Intl.message(
      ' And ',
      name: 'AndWithWhitespaces',
      desc: '',
      args: [],
    );
  }

  /// `Get code`
  String get GetCode {
    return Intl.message('Get code', name: 'GetCode', desc: '', args: []);
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

  /// `Now let's get to know each other`
  String get NowLetsGetToKnowEachOther {
    return Intl.message(
      'Now let\'s get to know each other',
      name: 'NowLetsGetToKnowEachOther',
      desc: '',
      args: [],
    );
  }

  /// `The more info we get about you, the better`
  String get TheMoreInfoWeAboutYouGetTheBetter {
    return Intl.message(
      'The more info we get about you, the better',
      name: 'TheMoreInfoWeAboutYouGetTheBetter',
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

  /// ` will be.`
  String get WillBe {
    return Intl.message(' will be.', name: 'WillBe', desc: '', args: []);
  }

  /// `Nickname`
  String get Nickname {
    return Intl.message('Nickname', name: 'Nickname', desc: '', args: []);
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
    return Intl.message('Your age', name: 'YourAge', desc: '', args: []);
  }

  /// `Gender`
  String get Gender {
    return Intl.message('Gender', name: 'Gender', desc: '', args: []);
  }

  /// `Confirm`
  String get Confirm {
    return Intl.message('Confirm', name: 'Confirm', desc: '', args: []);
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

  /// `This is`
  String get ThisIs {
    return Intl.message('This is', name: 'ThisIs', desc: '', args: []);
  }

  /// `Smart leisure selection for everyone, everywhere`
  String get SmartLeisureSelection {
    return Intl.message(
      'Smart leisure selection for everyone, everywhere',
      name: 'SmartLeisureSelection',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get Welcome {
    return Intl.message('Welcome', name: 'Welcome', desc: '', args: []);
  }

  /// `Get started`
  String get GetStarted {
    return Intl.message('Get started', name: 'GetStarted', desc: '', args: []);
  }

  /// `What is \n`
  String get WhatIs {
    return Intl.message('What is \n', name: 'WhatIs', desc: '', args: []);
  }

  /// `For`
  String get For {
    return Intl.message('For', name: 'For', desc: '', args: []);
  }

  /// `Through a non-\naggregator system \nespecially for you`
  String get ThroughANonAggregatorSystem {
    return Intl.message(
      'Through a non-\naggregator system \nespecially for you',
      name: 'ThroughANonAggregatorSystem',
      desc: '',
      args: [],
    );
  }

  /// `With your\npreferences`
  String get WithYourPreferences {
    return Intl.message(
      'With your\npreferences',
      name: 'WithYourPreferences',
      desc: '',
      args: [],
    );
  }

  /// `Don't be alone`
  String get DontBeAlone {
    return Intl.message(
      'Don\'t be alone',
      name: 'DontBeAlone',
      desc: '',
      args: [],
    );
  }

  /// `Lovely-touch amazing\ninteraction`
  String get LovelyTouchAmazingInteraction {
    return Intl.message(
      'Lovely-touch amazing\ninteraction',
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
      '\nfree places',
      name: 'FreePlaces',
      desc: '',
      args: [],
    );
  }

  /// `Top content rated{separator}by`
  String TopPlacesRatedBy(Object separator) {
    return Intl.message(
      'Top content rated${separator}by',
      name: 'TopPlacesRatedBy',
      desc: '',
      args: [separator],
    );
  }

  /// `Next {elements}`
  String NextElements(Object elements) {
    return Intl.message(
      'Next $elements',
      name: 'NextElements',
      desc: '',
      args: [elements],
    );
  }

  /// `You’ll find it`
  String get YoullFindIt {
    return Intl.message(
      'You’ll find it',
      name: 'YoullFindIt',
      desc: '',
      args: [],
    );
  }

  /// `Describe your claim`
  String get DescribeYourClaim {
    return Intl.message(
      'Describe your claim',
      name: 'DescribeYourClaim',
      desc: '',
      args: [],
    );
  }

  /// `Your name`
  String get YourName {
    return Intl.message('Your name', name: 'YourName', desc: '', args: []);
  }

  /// `Your email`
  String get YourEmail {
    return Intl.message('Your email', name: 'YourEmail', desc: '', args: []);
  }

  /// `Describe your issue`
  String get DescribeYourIssue {
    return Intl.message(
      'Describe your issue',
      name: 'DescribeYourIssue',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get Send {
    return Intl.message('Send', name: 'Send', desc: '', args: []);
  }

  /// `Invite people`
  String get InvitePeople {
    return Intl.message(
      'Invite people',
      name: 'InvitePeople',
      desc: '',
      args: [],
    );
  }

  /// `You sent an invitation to {amountOfInvitedPersons} people`
  String YouSentInvitationToNPeople(Object amountOfInvitedPersons) {
    return Intl.message(
      'You sent an invitation to $amountOfInvitedPersons people',
      name: 'YouSentInvitationToNPeople',
      desc: '',
      args: [amountOfInvitedPersons],
    );
  }

  /// `Invitations can be viewed in private messages`
  String get InvitationsCanBeViewedInPrivateMessages {
    return Intl.message(
      'Invitations can be viewed in private messages',
      name: 'InvitationsCanBeViewedInPrivateMessages',
      desc: '',
      args: [],
    );
  }

  /// `Delete from list`
  String get DeleteFromList {
    return Intl.message(
      'Delete from list',
      name: 'DeleteFromList',
      desc: '',
      args: [],
    );
  }

  /// `Add yourself to list`
  String get AddYourselfToList {
    return Intl.message(
      'Add yourself to list',
      name: 'AddYourselfToList',
      desc: '',
      args: [],
    );
  }

  /// `No date selected`
  String get NoDateSelected {
    return Intl.message(
      'No date selected',
      name: 'NoDateSelected',
      desc: '',
      args: [],
    );
  }

  /// `Describe your wishes`
  String get DescribeYourWishes {
    return Intl.message(
      'Describe your wishes',
      name: 'DescribeYourWishes',
      desc: '',
      args: [],
    );
  }

  /// `Please fill out your wishes`
  String get PleaseFillOutYourWishes {
    return Intl.message(
      'Please fill out your wishes',
      name: 'PleaseFillOutYourWishes',
      desc: '',
      args: [],
    );
  }

  /// `Please fill out date`
  String get PleaseFillOutDate {
    return Intl.message(
      'Please fill out date',
      name: 'PleaseFillOutDate',
      desc: '',
      args: [],
    );
  }

  /// `Please fill out your wishes and select date`
  String get PleaseFillOutYourWishesAndSelectDate {
    return Intl.message(
      'Please fill out your wishes and select date',
      name: 'PleaseFillOutYourWishesAndSelectDate',
      desc: '',
      args: [],
    );
  }

  /// `Type here`
  String get TypeHere {
    return Intl.message('Type here', name: 'TypeHere', desc: '', args: []);
  }

  /// `Notifications`
  String get Notifications {
    return Intl.message(
      'Notifications',
      name: 'Notifications',
      desc: '',
      args: [],
    );
  }

  /// `Use notifications`
  String get UsingNotifications {
    return Intl.message(
      'Use notifications',
      name: 'UsingNotifications',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get SeeAll {
    return Intl.message('See all', name: 'SeeAll', desc: '', args: []);
  }

  /// `Edit Profile`
  String get EditProfile {
    return Intl.message(
      'Edit Profile',
      name: 'EditProfile',
      desc: '',
      args: [],
    );
  }

  /// `Change photo`
  String get ChangePhoto {
    return Intl.message(
      'Change photo',
      name: 'ChangePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Premium`
  String get Premium {
    return Intl.message('Premium', name: 'Premium', desc: '', args: []);
  }

  /// `Pro`
  String get Pro {
    return Intl.message('Pro', name: 'Pro', desc: '', args: []);
  }

  /// `Be in search`
  String get BeInSearch {
    return Intl.message('Be in search', name: 'BeInSearch', desc: '', args: []);
  }

  /// `Phone`
  String get Phone {
    return Intl.message('Phone', name: 'Phone', desc: '', args: []);
  }

  /// `Date of birth`
  String get DateOfBirth {
    return Intl.message(
      'Date of birth',
      name: 'DateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Activity type`
  String get ActivityType {
    return Intl.message(
      'Activity type',
      name: 'ActivityType',
      desc: '',
      args: [],
    );
  }

  /// `Preferences`
  String get Preferences {
    return Intl.message('Preferences', name: 'Preferences', desc: '', args: []);
  }

  /// `Save`
  String get Save {
    return Intl.message('Save', name: 'Save', desc: '', args: []);
  }

  /// `Balance`
  String get Balance {
    return Intl.message('Balance', name: 'Balance', desc: '', args: []);
  }

  /// `Details`
  String get Details {
    return Intl.message('Details', name: 'Details', desc: '', args: []);
  }

  /// `Points`
  String get Points {
    return Intl.message('Points', name: 'Points', desc: '', args: []);
  }

  /// `Spent`
  String get Spent {
    return Intl.message('Spent', name: 'Spent', desc: '', args: []);
  }

  /// `Followings`
  String get Followings {
    return Intl.message('Followings', name: 'Followings', desc: '', args: []);
  }

  /// `Followers`
  String get Followers {
    return Intl.message('Followers', name: 'Followers', desc: '', args: []);
  }

  /// `Nothing found`
  String get NothingFound {
    return Intl.message(
      'Nothing found',
      name: 'NothingFound',
      desc: '',
      args: [],
    );
  }

  /// `Find someone to hang out with`
  String get FindSomeoneToHangOutWith {
    return Intl.message(
      'Find someone to hang out with',
      name: 'FindSomeoneToHangOutWith',
      desc: '',
      args: [],
    );
  }

  /// `{placeIndex} place`
  String NPlace(Object placeIndex) {
    return Intl.message(
      '$placeIndex place',
      name: 'NPlace',
      desc: '',
      args: [placeIndex],
    );
  }

  /// `My events`
  String get MyEvents {
    return Intl.message('My events', name: 'MyEvents', desc: '', args: []);
  }

  /// `Ask or support`
  String get AskOrSupport {
    return Intl.message(
      'Ask or support',
      name: 'AskOrSupport',
      desc: '',
      args: [],
    );
  }

  /// `Fulfill the dream`
  String get FulfillTheDream {
    return Intl.message(
      'Fulfill the dream',
      name: 'FulfillTheDream',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get Support {
    return Intl.message('Support', name: 'Support', desc: '', args: []);
  }

  /// `Enable hint system`
  String get EnableHintSystem {
    return Intl.message(
      'Enable hint system',
      name: 'EnableHintSystem',
      desc: '',
      args: [],
    );
  }

  /// `Faq`
  String get Faq {
    return Intl.message('Faq', name: 'Faq', desc: '', args: []);
  }

  /// `Will be implemented soon`
  String get WillBeImplementedSoon {
    return Intl.message(
      'Will be implemented soon',
      name: 'WillBeImplementedSoon',
      desc: '',
      args: [],
    );
  }

  /// `Your niche`
  String get YourNiche {
    return Intl.message('Your niche', name: 'YourNiche', desc: '', args: []);
  }

  /// `Don't miss it`
  String get DontMissIt {
    return Intl.message(
      'Don\'t miss it',
      name: 'DontMissIt',
      desc: '',
      args: [],
    );
  }

  /// `How’re you feeling tonight?`
  String get HowAreYouFeelingTonight {
    return Intl.message(
      'How’re you feeling tonight?',
      name: 'HowAreYouFeelingTonight',
      desc: '',
      args: [],
    );
  }

  /// `How’re you feeling today?`
  String get HowAreYouFeelingToday {
    return Intl.message(
      'How’re you feeling today?',
      name: 'HowAreYouFeelingToday',
      desc: '',
      args: [],
    );
  }

  /// `How’re you feeling this morning?`
  String get HowAreYouFeelingThisMorning {
    return Intl.message(
      'How’re you feeling this morning?',
      name: 'HowAreYouFeelingThisMorning',
      desc: '',
      args: [],
    );
  }

  /// `Guess`
  String get Guess {
    return Intl.message('Guess', name: 'Guess', desc: '', args: []);
  }

  /// `You better check this out`
  String get YouBetterCheckThisOut {
    return Intl.message(
      'You better check this out',
      name: 'YouBetterCheckThisOut',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get Favorites {
    return Intl.message('Favorites', name: 'Favorites', desc: '', args: []);
  }

  /// `Small`
  String get Small {
    return Intl.message('Small', name: 'Small', desc: '', args: []);
  }

  /// `Please select a niche`
  String get PleaseSelectANiche {
    return Intl.message(
      'Please select a niche',
      name: 'PleaseSelectANiche',
      desc: '',
      args: [],
    );
  }

  /// `Please select at least one price segment`
  String get PleaseSelectAtLeastOnePriceSegment {
    return Intl.message(
      'Please select at least one price segment',
      name: 'PleaseSelectAtLeastOnePriceSegment',
      desc: '',
      args: [],
    );
  }

  /// `Please select at least one age range`
  String get PleaseSelectAtLeastOneAgeRange {
    return Intl.message(
      'Please select at least one age range',
      name: 'PleaseSelectAtLeastOneAgeRange',
      desc: '',
      args: [],
    );
  }

  /// `The more info we get, the better `
  String get TheMoreInfoWeGetTheBetter {
    return Intl.message(
      'The more info we get, the better ',
      name: 'TheMoreInfoWeGetTheBetter',
      desc: '',
      args: [],
    );
  }

  /// `Your traffic`
  String get YourTraffic {
    return Intl.message(
      'Your traffic',
      name: 'YourTraffic',
      desc: '',
      args: [],
    );
  }

  /// `Your position`
  String get YourPosition {
    return Intl.message(
      'Your position',
      name: 'YourPosition',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get Title {
    return Intl.message('Title', name: 'Title', desc: '', args: []);
  }

  /// `Contact person`
  String get ContactPerson {
    return Intl.message(
      'Contact person',
      name: 'ContactPerson',
      desc: '',
      args: [],
    );
  }

  /// `Position`
  String get Position {
    return Intl.message('Position', name: 'Position', desc: '', args: []);
  }

  /// `Your price segment`
  String get YourPriceSegment {
    return Intl.message(
      'Your price segment',
      name: 'YourPriceSegment',
      desc: '',
      args: [],
    );
  }

  /// `Your audience age`
  String get YourAudienceAge {
    return Intl.message(
      'Your audience age',
      name: 'YourAudienceAge',
      desc: '',
      args: [],
    );
  }

  /// `Shuffle`
  String get Shuffle {
    return Intl.message('Shuffle', name: 'Shuffle', desc: '', args: []);
  }

  /// `Shuffle `
  String get ShuffleWithRightWhitespace {
    return Intl.message(
      'Shuffle ',
      name: 'ShuffleWithRightWhitespace',
      desc: '',
      args: [],
    );
  }

  /// `Places`
  String get Places {
    return Intl.message('Places', name: 'Places', desc: '', args: []);
  }

  /// `Create your place and invite people`
  String get CreateYourPlaceAndInvitePeople {
    return Intl.message(
      'Create your place and invite people',
      name: 'CreateYourPlaceAndInvitePeople',
      desc: '',
      args: [],
    );
  }

  /// `Create place`
  String get CreatePlace {
    return Intl.message(
      'Create place',
      name: 'CreatePlace',
      desc: '',
      args: [],
    );
  }

  /// `Website`
  String get Website {
    return Intl.message('Website', name: 'Website', desc: '', args: []);
  }

  /// `Location`
  String get Location {
    return Intl.message('Location', name: 'Location', desc: '', args: []);
  }

  /// `Work hours`
  String get WorkHours {
    return Intl.message('Work hours', name: 'WorkHours', desc: '', args: []);
  }

  /// `{title} is required`
  String XIsRequired(Object title) {
    return Intl.message(
      '$title is required',
      name: 'XIsRequired',
      desc: '',
      args: [title],
    );
  }

  /// `Description`
  String get Description {
    return Intl.message('Description', name: 'Description', desc: '', args: []);
  }

  /// `Photos`
  String get Photos {
    return Intl.message('Photos', name: 'Photos', desc: '', args: []);
  }

  /// `Logo`
  String get Logo {
    return Intl.message('Logo', name: 'Logo', desc: '', args: []);
  }

  /// `Place`
  String get Place {
    return Intl.message('Place', name: 'Place', desc: '', args: []);
  }

  /// `Open from`
  String get OpenFrom {
    return Intl.message('Open from', name: 'OpenFrom', desc: '', args: []);
  }

  /// `Open to`
  String get OpenTo {
    return Intl.message('Open to', name: 'OpenTo', desc: '', args: []);
  }

  /// `Days of week`
  String get DaysOfWeek {
    return Intl.message('Days of week', name: 'DaysOfWeek', desc: '', args: []);
  }

  /// `Select days `
  String get SelectDays {
    return Intl.message('Select days ', name: 'SelectDays', desc: '', args: []);
  }

  /// `Daily `
  String get Daily {
    return Intl.message('Daily ', name: 'Daily', desc: '', args: []);
  }

  /// `Address`
  String get Address {
    return Intl.message('Address', name: 'Address', desc: '', args: []);
  }

  /// `Base properties`
  String get BaseProperties {
    return Intl.message(
      'Base properties',
      name: 'BaseProperties',
      desc: '',
      args: [],
    );
  }

  /// `Unique properties`
  String get UniqueProperties {
    return Intl.message(
      'Unique properties',
      name: 'UniqueProperties',
      desc: '',
      args: [],
    );
  }

  /// `Cuisine type`
  String get CuisineType {
    return Intl.message(
      'Cuisine type',
      name: 'CuisineType',
      desc: '',
      args: [],
    );
  }

  /// `Museum type`
  String get MuseumType {
    return Intl.message('Museum type', name: 'MuseumType', desc: '', args: []);
  }

  /// `Gallery type`
  String get GalleryType {
    return Intl.message(
      'Gallery type',
      name: 'GalleryType',
      desc: '',
      args: [],
    );
  }

  /// `Music type`
  String get MusicType {
    return Intl.message('Music type', name: 'MusicType', desc: '', args: []);
  }

  /// `Create Event`
  String get CreateEvent {
    return Intl.message(
      'Create Event',
      name: 'CreateEvent',
      desc: '',
      args: [],
    );
  }

  /// `Event type`
  String get EventType {
    return Intl.message('Event type', name: 'EventType', desc: '', args: []);
  }

  /// `Is recurrent`
  String get IsRecurrent {
    return Intl.message(
      'Is recurrent',
      name: 'IsRecurrent',
      desc: '',
      args: [],
    );
  }

  /// `Opening hours`
  String get OpeningHours {
    return Intl.message(
      'Opening hours',
      name: 'OpeningHours',
      desc: '',
      args: [],
    );
  }

  /// `Tap to set address`
  String get TapToSetAddress {
    return Intl.message(
      'Tap to set address',
      name: 'TapToSetAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter {inputType}`
  String EnterInputType(Object inputType) {
    return Intl.message(
      'Enter $inputType',
      name: 'EnterInputType',
      desc: '',
      args: [inputType],
    );
  }

  /// `Show result`
  String get ShowResult {
    return Intl.message('Show result', name: 'ShowResult', desc: '', args: []);
  }

  /// `Then check this out`
  String get ThenCheckThisOut {
    return Intl.message(
      'Then check this out',
      name: 'ThenCheckThisOut',
      desc: '',
      args: [],
    );
  }

  /// `We have solution just for you`
  String get WeHavePlacesJustForYou {
    return Intl.message(
      'We have solution just for you',
      name: 'WeHavePlacesJustForYou',
      desc: '',
      args: [],
    );
  }

  /// `Get reward`
  String get GetReward {
    return Intl.message('Get reward', name: 'GetReward', desc: '', args: []);
  }

  /// `Archived`
  String get Archived {
    return Intl.message('Archived', name: 'Archived', desc: '', args: []);
  }

  /// `Event`
  String get Event {
    return Intl.message('Event', name: 'Event', desc: '', args: []);
  }

  /// `Time`
  String get Time {
    return Intl.message('Time', name: 'Time', desc: '', args: []);
  }

  /// `Dates`
  String get Dates {
    return Intl.message('Dates', name: 'Dates', desc: '', args: []);
  }

  /// `select {type}`
  String SelectType(Object type) {
    return Intl.message(
      'select $type',
      name: 'SelectType',
      desc: '',
      args: [type],
    );
  }

  /// `Day`
  String get Day {
    return Intl.message('Day', name: 'Day', desc: '', args: []);
  }

  /// `Place type`
  String get PlaceType {
    return Intl.message('Place type', name: 'PlaceType', desc: '', args: []);
  }

  /// `Depending on...`
  String get DependingOn {
    return Intl.message(
      'Depending on...',
      name: 'DependingOn',
      desc: '',
      args: [],
    );
  }

  /// `You get exactly what you need`
  String get YouGetExactlyWhatYouNeed {
    return Intl.message(
      'You get exactly what you need',
      name: 'YouGetExactlyWhatYouNeed',
      desc: '',
      args: [],
    );
  }

  /// `How it\nworks`
  String get HowItWorks {
    return Intl.message(
      'How it\nworks',
      name: 'HowItWorks',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get Today {
    return Intl.message('Today', name: 'Today', desc: '', args: []);
  }

  /// `Check in`
  String get CheckIn {
    return Intl.message('Check in', name: 'CheckIn', desc: '', args: []);
  }

  /// `Visit first to open next`
  String get VisitFirstToOpenNext {
    return Intl.message(
      'Visit first to open next',
      name: 'VisitFirstToOpenNext',
      desc: '',
      args: [],
    );
  }

  /// `Photo`
  String get Photo {
    return Intl.message('Photo', name: 'Photo', desc: '', args: []);
  }

  /// `Video`
  String get Video {
    return Intl.message('Video', name: 'Video', desc: '', args: []);
  }

  /// `Or drag files here`
  String get OrDragFilesHere {
    return Intl.message(
      'Or drag files here',
      name: 'OrDragFilesHere',
      desc: '',
      args: [],
    );
  }

  /// `Logo (upload Files)`
  String get LogoUploadFiles {
    return Intl.message(
      'Logo (upload Files)',
      name: 'LogoUploadFiles',
      desc: '',
      args: [],
    );
  }

  /// `Photo (upload Files)`
  String get PhotoUploadFiles {
    return Intl.message(
      'Photo (upload Files)',
      name: 'PhotoUploadFiles',
      desc: '',
      args: [],
    );
  }

  /// `Video (upload Files)`
  String get VideoUploadFiles {
    return Intl.message(
      'Video (upload Files)',
      name: 'VideoUploadFiles',
      desc: '',
      args: [],
    );
  }

  /// `Published`
  String get Published {
    return Intl.message('Published', name: 'Published', desc: '', args: []);
  }

  /// `{editingType} place`
  String EditingTypePlace(Object editingType) {
    return Intl.message(
      '$editingType place',
      name: 'EditingTypePlace',
      desc: '',
      args: [editingType],
    );
  }

  /// `Update`
  String get Update {
    return Intl.message('Update', name: 'Update', desc: '', args: []);
  }

  /// `Create`
  String get Create {
    return Intl.message('Create', name: 'Create', desc: '', args: []);
  }

  /// `Book it`
  String get BookIt {
    return Intl.message('Book it', name: 'BookIt', desc: '', args: []);
  }

  /// `Upgrade {forNMoney}`
  String UpgradeForNmoney(Object forNMoney) {
    return Intl.message(
      'Upgrade $forNMoney',
      name: 'UpgradeForNmoney',
      desc: '',
      args: [forNMoney],
    );
  }

  /// `For {formattedPrice}`
  String ForFormattedPrice(Object formattedPrice) {
    return Intl.message(
      'For $formattedPrice',
      name: 'ForFormattedPrice',
      desc: '',
      args: [formattedPrice],
    );
  }

  /// `Error occured without message`
  String get ErrorOccuredWithoutMessage {
    return Intl.message(
      'Error occured without message',
      name: 'ErrorOccuredWithoutMessage',
      desc: '',
      args: [],
    );
  }

  /// `Permissions`
  String get Permissions {
    return Intl.message('Permissions', name: 'Permissions', desc: '', args: []);
  }

  /// `Continue to use geolocation`
  String get AllowGeolocation {
    return Intl.message(
      'Continue to use geolocation',
      name: 'AllowGeolocation',
      desc: '',
      args: [],
    );
  }

  /// `Our recommendation system is based on many factors. Geolocation is only part of the system, which will allow us to correctly prioritize, both in terms of distance and the nearest landscape features (mountains, reservoirs, plains, deserts)`
  String get OurRecommendationsAboutGeolocation {
    return Intl.message(
      'Our recommendation system is based on many factors. Geolocation is only part of the system, which will allow us to correctly prioritize, both in terms of distance and the nearest landscape features (mountains, reservoirs, plains, deserts)',
      name: 'OurRecommendationsAboutGeolocation',
      desc: '',
      args: [],
    );
  }

  /// `Continue to {allowValue}`
  String AllowX(Object allowValue) {
    return Intl.message(
      'Continue to $allowValue',
      name: 'AllowX',
      desc: '',
      args: [allowValue],
    );
  }

  /// `We do not spam all kinds of notifications and advertisements. Only those notifications that may be important to you and match your preferences`
  String get WeDoNotSpamAllKindsOfNotifications {
    return Intl.message(
      'We do not spam all kinds of notifications and advertisements. Only those notifications that may be important to you and match your preferences',
      name: 'WeDoNotSpamAllKindsOfNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Use health data`
  String get UsingHealthKit {
    return Intl.message(
      'Use health data',
      name: 'UsingHealthKit',
      desc: '',
      args: [],
    );
  }

  /// `Based on your activity, heart rate and other factors, we determine your condition and try to recommend exactly what you need right now, specifically for you`
  String get BasedOnYourActivityWeDetermineYourCondition {
    return Intl.message(
      'Based on your activity, heart rate and other factors, we determine your condition and try to recommend exactly what you need right now, specifically for you',
      name: 'BasedOnYourActivityWeDetermineYourCondition',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get Skip {
    return Intl.message('Skip', name: 'Skip', desc: '', args: []);
  }

  /// `Allow`
  String get Allow {
    return Intl.message('Allow', name: 'Allow', desc: '', args: []);
  }

  /// `Allow all`
  String get AllowAll {
    return Intl.message('Allow all', name: 'AllowAll', desc: '', args: []);
  }

  /// `Wrong security code`
  String get WrongSecurityCode {
    return Intl.message(
      'Wrong security code',
      name: 'WrongSecurityCode',
      desc: '',
      args: [],
    );
  }

  /// `Error occured`
  String get ErrorOccured {
    return Intl.message(
      'Error occured',
      name: 'ErrorOccured',
      desc: '',
      args: [],
    );
  }

  /// `Company name`
  String get CompanyName {
    return Intl.message(
      'Company name',
      name: 'CompanyName',
      desc: '',
      args: [],
    );
  }

  /// `Company position`
  String get CompanyPosition {
    return Intl.message(
      'Company position',
      name: 'CompanyPosition',
      desc: '',
      args: [],
    );
  }

  /// `Personal credentials`
  String get PersonalCredentials {
    return Intl.message(
      'Personal credentials',
      name: 'PersonalCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message('Password', name: 'Password', desc: '', args: []);
  }

  /// `Password must be at least 8 characters`
  String get PasswordMustBeAtLeast8Characters {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'PasswordMustBeAtLeast8Characters',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter, one lowercase letter, one number and one special character`
  String get PasswordConditions {
    return Intl.message(
      'Password must contain at least one uppercase letter, one lowercase letter, one number and one special character',
      name: 'PasswordConditions',
      desc: '',
      args: [],
    );
  }

  /// `Company credentials`
  String get CompanyCredentials {
    return Intl.message(
      'Company credentials',
      name: 'CompanyCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Allow location services to use this function`
  String get AllowLocationServicesToUseThisFunction {
    return Intl.message(
      'Allow location services to use this function',
      name: 'AllowLocationServicesToUseThisFunction',
      desc: '',
      args: [],
    );
  }

  /// `Feeling`
  String get Feeling {
    return Intl.message('Feeling', name: 'Feeling', desc: '', args: []);
  }

  /// `Sunny`
  String get Sunny {
    return Intl.message('Sunny', name: 'Sunny', desc: '', args: []);
  }

  /// `Burned today`
  String get BurnedToday {
    return Intl.message(
      'Burned today',
      name: 'BurnedToday',
      desc: '',
      args: [],
    );
  }

  /// `Undefined`
  String get Undefined {
    return Intl.message('Undefined', name: 'Undefined', desc: '', args: []);
  }

  /// `Nothing was found :c`
  String get NothingWasFoundWithEmoji {
    return Intl.message(
      'Nothing was found :c',
      name: 'NothingWasFoundWithEmoji',
      desc: '',
      args: [],
    );
  }

  /// `Click Enter to search`
  String get ClickEnterToSearch {
    return Intl.message(
      'Click Enter to search',
      name: 'ClickEnterToSearch',
      desc: '',
      args: [],
    );
  }

  /// `My card`
  String get MyCard {
    return Intl.message('My card', name: 'MyCard', desc: '', args: []);
  }

  /// `A new location has opened today. Come! You'll like it!`
  String get NewLocationHasOpenedToday {
    return Intl.message(
      'A new location has opened today. Come! You\'ll like it!',
      name: 'NewLocationHasOpenedToday',
      desc: '',
      args: [],
    );
  }

  /// `{value} successfully updated`
  String XSuccessfullyUpdated(Object value) {
    return Intl.message(
      '$value successfully updated',
      name: 'XSuccessfullyUpdated',
      desc: '',
      args: [value],
    );
  }

  /// `User`
  String get User {
    return Intl.message('User', name: 'User', desc: '', args: []);
  }

  /// `Value must be at least 3 characters long`
  String get ValueMustBeAtLeast3Characters {
    return Intl.message(
      'Value must be at least 3 characters long',
      name: 'ValueMustBeAtLeast3Characters',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get Privacy {
    return Intl.message('Privacy', name: 'Privacy', desc: '', args: []);
  }

  /// `Terms`
  String get Terms {
    return Intl.message('Terms', name: 'Terms', desc: '', args: []);
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message('Cancel', name: 'Cancel', desc: '', args: []);
  }

  /// `Are you sure you want to delete your account?`
  String get AreYouSureYouWantToDeleteYourAccount {
    return Intl.message(
      'Are you sure you want to delete your account?',
      name: 'AreYouSureYouWantToDeleteYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get AreYouSureYouWantToLogOut {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'AreYouSureYouWantToLogOut',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get Yes {
    return Intl.message('Yes', name: 'Yes', desc: '', args: []);
  }

  /// `Premium account`
  String get PremiumAccount {
    return Intl.message(
      'Premium account',
      name: 'PremiumAccount',
      desc: '',
      args: [],
    );
  }

  /// `Pro account`
  String get ProAccount {
    return Intl.message('Pro account', name: 'ProAccount', desc: '', args: []);
  }

  /// `Athlete`
  String get Athlete {
    return Intl.message('Athlete', name: 'Athlete', desc: '', args: []);
  }

  /// `Hard to answer`
  String get HardToAnswer {
    return Intl.message(
      'Hard to answer',
      name: 'HardToAnswer',
      desc: '',
      args: [],
    );
  }

  /// `Not often`
  String get NotOften {
    return Intl.message('Not often', name: 'NotOften', desc: '', args: []);
  }

  /// `{value} could not be empty`
  String XCouldNotBeEmpty(Object value) {
    return Intl.message(
      '$value could not be empty',
      name: 'XCouldNotBeEmpty',
      desc: '',
      args: [value],
    );
  }

  /// `Tags`
  String get Tags {
    return Intl.message('Tags', name: 'Tags', desc: '', args: []);
  }

  /// `Name or nickname`
  String get NameOrNickname {
    return Intl.message(
      'Name or nickname',
      name: 'NameOrNickname',
      desc: '',
      args: [],
    );
  }

  /// `Nickname is taken, try another one`
  String get NicknameIsTakenTryAnotherOne {
    return Intl.message(
      'Nickname is taken, try another one',
      name: 'NicknameIsTakenTryAnotherOne',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your company profile?`
  String get AreYouSureYouWantToDeleteYourCompanyProfile {
    return Intl.message(
      'Are you sure you want to delete your company profile?',
      name: 'AreYouSureYouWantToDeleteYourCompanyProfile',
      desc: '',
      args: [],
    );
  }

  /// `White theme`
  String get WhiteTheme {
    return Intl.message('White theme', name: 'WhiteTheme', desc: '', args: []);
  }

  /// `Name`
  String get Name {
    return Intl.message('Name', name: 'Name', desc: '', args: []);
  }

  /// `Accept donations or help others realize their dreams`
  String get AcceptDonations {
    return Intl.message(
      'Accept donations or help others realize their dreams',
      name: 'AcceptDonations',
      desc: '',
      args: [],
    );
  }

  /// `Day and night`
  String get daynight {
    return Intl.message('Day and night', name: 'daynight', desc: '', args: []);
  }

  /// `Message`
  String get Message {
    return Intl.message('Message', name: 'Message', desc: '', args: []);
  }

  /// `Price`
  String get Price {
    return Intl.message('Price', name: 'Price', desc: '', args: []);
  }

  /// `Category`
  String get Category {
    return Intl.message('Category', name: 'Category', desc: '', args: []);
  }

  /// `Swipe to start`
  String get SwipeToStart {
    return Intl.message(
      'Swipe to start',
      name: 'SwipeToStart',
      desc: '',
      args: [],
    );
  }

  /// `You can switch it at any time in your profile settings`
  String get SwitchAnyTime {
    return Intl.message(
      'You can switch it at any time in your profile settings',
      name: 'SwitchAnyTime',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get key {
    return Intl.message('', name: 'key', desc: '', args: []);
  }

  /// `Invite list`
  String get InviteList {
    return Intl.message('Invite list', name: 'InviteList', desc: '', args: []);
  }

  /// `{count,plural, =0{{count} users} =1{{count} user} =2{{count} users} few{{count} users} many{{count} users} other{{count} users}}`
  String Users(num count) {
    return Intl.plural(
      count,
      zero: '$count users',
      one: '$count user',
      two: '$count users',
      few: '$count users',
      many: '$count users',
      other: '$count users',
      name: 'Users',
      desc: '',
      args: [count],
    );
  }

  /// `Messages`
  String get Messages {
    return Intl.message('Messages', name: 'Messages', desc: '', args: []);
  }

  /// `Services`
  String get Services {
    return Intl.message('Services', name: 'Services', desc: '', args: []);
  }

  /// `Filters`
  String get Filters {
    return Intl.message('Filters', name: 'Filters', desc: '', args: []);
  }

  /// `Reset filters`
  String get ResetFilters {
    return Intl.message(
      'Reset filters',
      name: 'ResetFilters',
      desc: '',
      args: [],
    );
  }

  /// `Recommended`
  String get Recommended {
    return Intl.message('Recommended', name: 'Recommended', desc: '', args: []);
  }

  /// `Sorry, no internet connection`
  String get NoConnection {
    return Intl.message(
      'Sorry, no internet connection',
      name: 'NoConnection',
      desc: '',
      args: [],
    );
  }

  /// `Hall of Fame`
  String get HallOfFame {
    return Intl.message('Hall of Fame', name: 'HallOfFame', desc: '', args: []);
  }

  /// `View all`
  String get ViewAll {
    return Intl.message('View all', name: 'ViewAll', desc: '', args: []);
  }

  /// `No favorites found`
  String get NoFavoritesFound {
    return Intl.message(
      'No favorites found',
      name: 'NoFavoritesFound',
      desc: '',
      args: [],
    );
  }

  /// `Events`
  String get Events {
    return Intl.message('Events', name: 'Events', desc: '', args: []);
  }

  /// `Find someone to network with`
  String get FindSomeoneToNetworkWith {
    return Intl.message(
      'Find someone to network with',
      name: 'FindSomeoneToNetworkWith',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message('Continue', name: 'Continue', desc: '', args: []);
  }

  /// `Please enter place’s address`
  String get EnterPlaceAddressPrompt {
    return Intl.message(
      'Please enter place’s address',
      name: 'EnterPlaceAddressPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Hint system enabled for {days,plural, =0{{days} days} =1{{days} day} =2{{days} days} few{{days} days} many{{days} days} other{{days} days}}`
  String HintSystemEnabled(num days) {
    return Intl.message(
      'Hint system enabled for ${Intl.plural(days, zero: '$days days', one: '$days day', two: '$days days', few: '$days days', many: '$days days', other: '$days days')}',
      name: 'HintSystemEnabled',
      desc: '',
      args: [days],
    );
  }

  /// `Hint system disabled`
  String get HintSystemDisabled {
    return Intl.message(
      'Hint system disabled',
      name: 'HintSystemDisabled',
      desc: '',
      args: [],
    );
  }

  /// `All app notifications`
  String get AllAppNotification {
    return Intl.message(
      'All app notifications',
      name: 'AllAppNotification',
      desc: '',
      args: [],
    );
  }

  /// `Events reminders`
  String get EventsReminders {
    return Intl.message(
      'Events reminders',
      name: 'EventsReminders',
      desc: '',
      args: [],
    );
  }

  /// `New features`
  String get NewFeatures {
    return Intl.message(
      'New features',
      name: 'NewFeatures',
      desc: '',
      args: [],
    );
  }

  /// `New donates`
  String get NewDonates {
    return Intl.message('New donates', name: 'NewDonates', desc: '', args: []);
  }

  /// `New followers`
  String get NewFollowers {
    return Intl.message(
      'New followers',
      name: 'NewFollowers',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get Edit {
    return Intl.message('Edit', name: 'Edit', desc: '', args: []);
  }

  /// `For`
  String get ForPeriod {
    return Intl.message('For', name: 'ForPeriod', desc: '', args: []);
  }

  /// `Eazy`
  String get Easy {
    return Intl.message('Eazy', name: 'Easy', desc: '', args: []);
  }

  /// `Fair`
  String get Fair {
    return Intl.message('Fair', name: 'Fair', desc: '', args: []);
  }

  /// `Hardcore`
  String get Hardcore {
    return Intl.message('Hardcore', name: 'Hardcore', desc: '', args: []);
  }

  /// `Gathering requests for FAQ. \nUnder development`
  String get FaqUnderDev {
    return Intl.message(
      'Gathering requests for FAQ. \nUnder development',
      name: 'FaqUnderDev',
      desc: '',
      args: [],
    );
  }

  /// `{days,plural, =0{days} =1{day} =2{days} few{days} many{days} other{days}}`
  String Days(num days) {
    return Intl.plural(
      days,
      zero: 'days',
      one: 'day',
      two: 'days',
      few: 'days',
      many: 'days',
      other: 'days',
      name: 'Days',
      desc: '',
      args: [days],
    );
  }

  /// `You can create one request per month and spend money only on your dream`
  String get DonationHint {
    return Intl.message(
      'You can create one request per month and spend money only on your dream',
      name: 'DonationHint',
      desc: '',
      args: [],
    );
  }

  /// `To use this function plz upgrade to {type}`
  String UpgradeAccount(Object type) {
    return Intl.message(
      'To use this function plz upgrade to $type',
      name: 'UpgradeAccount',
      desc: '',
      args: [type],
    );
  }

  /// `Upgrade`
  String get UpgradeAccountConfirmation {
    return Intl.message(
      'Upgrade',
      name: 'UpgradeAccountConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Depending on...`
  String get FeedFeelingsHiwTitle {
    return Intl.message(
      'Depending on...',
      name: 'FeedFeelingsHiwTitle',
      desc: '',
      args: [],
    );
  }

  /// `you get exactly what you need`
  String get FeedFeelingsHiwSubtitle {
    return Intl.message(
      'you get exactly what you need',
      name: 'FeedFeelingsHiwSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `{item, plural, =0{your location} =1{your interests} =2{weather around} few{and other 14 scales} other{and other 14 scales}}`
  String FeedFeelingsHiwItems(num item) {
    return Intl.plural(
      item,
      zero: 'your location',
      one: 'your interests',
      two: 'weather around',
      few: 'and other 14 scales',
      other: 'and other 14 scales',
      name: 'FeedFeelingsHiwItems',
      desc: '',
      args: [item],
    );
  }

  /// `Randomizing...`
  String get FeedRandomizerHiwTitle {
    return Intl.message(
      'Randomizing...',
      name: 'FeedRandomizerHiwTitle',
      desc: '',
      args: [],
    );
  }

  /// `you press and get random`
  String get FeedRandomizerHiwSubtitle {
    return Intl.message(
      'you press and get random',
      name: 'FeedRandomizerHiwSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `{item, plural, =0{events & places} =1{filtering by chips} =2{choose chip & press} few{press & scroll\n} other{press & scroll\n}}`
  String FeedRandomizerHiwItems(num item) {
    return Intl.plural(
      item,
      zero: 'events & places',
      one: 'filtering by chips',
      two: 'choose chip & press',
      few: 'press & scroll\n',
      other: 'press & scroll\n',
      name: 'FeedRandomizerHiwItems',
      desc: '',
      args: [item],
    );
  }

  /// `to have some fun`
  String get OnboardingSlide1 {
    return Intl.message(
      'to have some fun',
      name: 'OnboardingSlide1',
      desc: '',
      args: [],
    );
  }

  /// `to explore\nleisure and\nbusiness`
  String get OnboardingSlide2 {
    return Intl.message(
      'to explore\nleisure and\nbusiness',
      name: 'OnboardingSlide2',
      desc: '',
      args: [],
    );
  }

  /// `to just chill out`
  String get OnboardingSlide3 {
    return Intl.message(
      'to just chill out',
      name: 'OnboardingSlide3',
      desc: '',
      args: [],
    );
  }

  /// `Select the type of account you would like to create`
  String get UserTypeSelectionPrompt {
    return Intl.message(
      'Select the type of account you would like to create',
      name: 'UserTypeSelectionPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Personal`
  String get Personal {
    return Intl.message('Personal', name: 'Personal', desc: '', args: []);
  }

  /// `Company`
  String get Company {
    return Intl.message('Company', name: 'Company', desc: '', args: []);
  }

  /// `Letters, numbers, ! “ @ # $ % & symbols, 8 characters`
  String get PasswordHint {
    return Intl.message(
      'Letters, numbers, ! “ @ # \$ % & symbols, 8 characters',
      name: 'PasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get TermsOfService {
    return Intl.message(
      'Terms of Service',
      name: 'TermsOfService',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get PrivacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'PrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Happy to see you`
  String get CredentialsVerificationTitle {
    return Intl.message(
      'Happy to see you',
      name: 'CredentialsVerificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `To gain access you must log in first`
  String get CredentialsVerificationPrompt {
    return Intl.message(
      'To gain access you must log in first',
      name: 'CredentialsVerificationPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get Account {
    return Intl.message('Account', name: 'Account', desc: '', args: []);
  }

  /// `Type of content`
  String get TypeOfContent {
    return Intl.message(
      'Type of content',
      name: 'TypeOfContent',
      desc: '',
      args: [],
    );
  }

  /// `Leisure`
  String get Leisure {
    return Intl.message('Leisure', name: 'Leisure', desc: '', args: []);
  }

  /// `Business`
  String get Business {
    return Intl.message('Business', name: 'Business', desc: '', args: []);
  }

  /// `Both`
  String get Both {
    return Intl.message('Both', name: 'Both', desc: '', args: []);
  }

  /// `Please type verification code sent to`
  String get CredentialsCodeVerificationSubtitle {
    return Intl.message(
      'Please type verification code sent to',
      name: 'CredentialsCodeVerificationSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Email verification`
  String get EmailVerification {
    return Intl.message(
      'Email verification',
      name: 'EmailVerification',
      desc: '',
      args: [],
    );
  }

  /// `Need email verification`
  String get NeedEmailVerification {
    return Intl.message(
      'Need email verification',
      name: 'NeedEmailVerification',
      desc: '',
      args: [],
    );
  }

  /// `Phone verification`
  String get PhoneVerification {
    return Intl.message(
      'Phone verification',
      name: 'PhoneVerification',
      desc: '',
      args: [],
    );
  }

  /// `Resend code`
  String get ResendCode {
    return Intl.message('Resend code', name: 'ResendCode', desc: '', args: []);
  }

  /// `Enter new password`
  String get EnterNewPassword {
    return Intl.message(
      'Enter new password',
      name: 'EnterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get Male {
    return Intl.message('Male', name: 'Male', desc: '', args: []);
  }

  /// `Female`
  String get Female {
    return Intl.message('Female', name: 'Female', desc: '', args: []);
  }

  /// `Other`
  String get Other {
    return Intl.message('Other', name: 'Other', desc: '', args: []);
  }

  /// `Hindu`
  String get Hindu {
    return Intl.message('Hindu', name: 'Hindu', desc: '', args: []);
  }

  /// `Islam`
  String get Islam {
    return Intl.message('Islam', name: 'Islam', desc: '', args: []);
  }

  /// `Judaism`
  String get Judaism {
    return Intl.message('Judaism', name: 'Judaism', desc: '', args: []);
  }

  /// `Atheism`
  String get Atheism {
    return Intl.message('Atheism', name: 'Atheism', desc: '', args: []);
  }

  /// `Buddhism`
  String get Buddhism {
    return Intl.message('Buddhism', name: 'Buddhism', desc: '', args: []);
  }

  /// `Christianity`
  String get Christianity {
    return Intl.message(
      'Christianity',
      name: 'Christianity',
      desc: '',
      args: [],
    );
  }

  /// `Describe your business`
  String get DescribeYourBusiness {
    return Intl.message(
      'Describe your business',
      name: 'DescribeYourBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Read {amount}`
  String Read(Object amount) {
    return Intl.message('Read $amount', name: 'Read', desc: '', args: [amount]);
  }

  /// `more`
  String get More {
    return Intl.message('more', name: 'More', desc: '', args: []);
  }

  /// `less`
  String get Less {
    return Intl.message('less', name: 'Less', desc: '', args: []);
  }

  /// `Upcoming globals`
  String get UpcomingGlobalEvents {
    return Intl.message(
      'Upcoming globals',
      name: 'UpcomingGlobalEvents',
      desc: '',
      args: [],
    );
  }

  /// `Events you don't wanna miss`
  String get SpinnerTitle {
    return Intl.message(
      'Events you don\'t wanna miss',
      name: 'SpinnerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Great match...`
  String get FeedNichesHiwTitle {
    return Intl.message(
      'Great match...',
      name: 'FeedNichesHiwTitle',
      desc: '',
      args: [],
    );
  }

  /// `get exactly what you need`
  String get FeedNichesHiwSubtitle {
    return Intl.message(
      'get exactly what you need',
      name: 'FeedNichesHiwSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `{item, plural, =0{select the niche} =1{press} =2{get selection} few{choose & plan} other{choose & plan}}`
  String FeedNichesHiwItems(num item) {
    return Intl.plural(
      item,
      zero: 'select the niche',
      one: 'press',
      two: 'get selection',
      few: 'choose & plan',
      other: 'choose & plan',
      name: 'FeedNichesHiwItems',
      desc: '',
      args: [item],
    );
  }

  /// `You spin it...`
  String get SpinnerHiwTitle {
    return Intl.message(
      'You spin it...',
      name: 'SpinnerHiwTitle',
      desc: '',
      args: [],
    );
  }

  /// `you find personalized events`
  String get SpinnerHiwSubtitle {
    return Intl.message(
      'you find personalized events',
      name: 'SpinnerHiwSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `{item, plural, =0{for fun} =1{swipe category} =2{choose & plan} few{search & book} other{search & book}}`
  String SpinnerHiwHint(num item) {
    return Intl.plural(
      item,
      zero: 'for fun',
      one: 'swipe category',
      two: 'choose & plan',
      few: 'search & book',
      other: 'search & book',
      name: 'SpinnerHiwHint',
      desc: '',
      args: [item],
    );
  }

  /// `Do not be alone...`
  String get ProfileFindSomeoneHiwTitle {
    return Intl.message(
      'Do not be alone...',
      name: 'ProfileFindSomeoneHiwTitle',
      desc: '',
      args: [],
    );
  }

  /// `go somewhere together`
  String get ProfileFindSomeoneHiwSubtitle {
    return Intl.message(
      'go somewhere together',
      name: 'ProfileFindSomeoneHiwSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `{item, plural, =0{find companions} =1{similar preferences} =2{check point reputation} few{no foes} other{no foes}}`
  String ProfileFindSomeoneHiwHint(num item) {
    return Intl.plural(
      item,
      zero: 'find companions',
      one: 'similar preferences',
      two: 'check point reputation',
      few: 'no foes',
      other: 'no foes',
      name: 'ProfileFindSomeoneHiwHint',
      desc: '',
      args: [item],
    );
  }

  /// `Fulfill the dream...`
  String get ProfileAskOrSupportHiwTitle {
    return Intl.message(
      'Fulfill the dream...',
      name: 'ProfileAskOrSupportHiwTitle',
      desc: '',
      args: [],
    );
  }

  /// `yours or someone else's`
  String get ProfileAskOrSupportHiwSubtitle {
    return Intl.message(
      'yours or someone else\'s',
      name: 'ProfileAskOrSupportHiwSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `{item, plural, =0{post a dream request} =1{write & make video} =2{be convincing and honest} few{donate others} other{donate others}}`
  String ProfileAskOrSupportHiwHint(num item) {
    return Intl.plural(
      item,
      zero: 'post a dream request',
      one: 'write & make video',
      two: 'be convincing and honest',
      few: 'donate others',
      other: 'donate others',
      name: 'ProfileAskOrSupportHiwHint',
      desc: '',
      args: [item],
    );
  }

  /// `Usual search...`
  String get SearchHiwTitle {
    return Intl.message(
      'Usual search...',
      name: 'SearchHiwTitle',
      desc: '',
      args: [],
    );
  }

  /// `search or choose others choice`
  String get SearchHiwSubtitle {
    return Intl.message(
      'search or choose others choice',
      name: 'SearchHiwSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `{item, plural, =0{preferences don’t work} =1{events/places} =2{type & get result} few{use ratings & models} other{use ratings & models}}`
  String SearchHiwHint(num item) {
    return Intl.plural(
      item,
      zero: 'preferences don’t work',
      one: 'events/places',
      two: 'type & get result',
      few: 'use ratings & models',
      other: 'use ratings & models',
      name: 'SearchHiwHint',
      desc: '',
      args: [item],
    );
  }

  /// `Shuffling places...`
  String get ShuffleHiwTitle {
    return Intl.message(
      'Shuffling places...',
      name: 'ShuffleHiwTitle',
      desc: '',
      args: [],
    );
  }

  /// `finding personalized places`
  String get ShuffleHiwSubtitle {
    return Intl.message(
      'finding personalized places',
      name: 'ShuffleHiwSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `{item, plural, =0{swipe any direction} =1{swipe place qualities} =2{like dislike favorite} few{teach our system} other{teach our system}}`
  String ShuffleHiwHint(num item) {
    return Intl.plural(
      item,
      zero: 'swipe any direction',
      one: 'swipe place qualities',
      two: 'like dislike favorite',
      few: 'teach our system',
      other: 'teach our system',
      name: 'ShuffleHiwHint',
      desc: '',
      args: [item],
    );
  }

  /// `Suitable city content will...`
  String get CheckInHiwTitle {
    return Intl.message(
      'Suitable city content will...',
      name: 'CheckInHiwTitle',
      desc: '',
      args: [],
    );
  }

  /// `cure your feeling or enchance it!`
  String get CheckInHiwSubtitle {
    return Intl.message(
      'cure your feeling or enchance it!',
      name: 'CheckInHiwSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `{item, plural, =0{3 difficulty levels} =1{visit first to open next} =2{visit & check in} few{pass & be rewarded} other{pass & be rewarded}}`
  String CheckInHiwHint(num item) {
    return Intl.plural(
      item,
      zero: '3 difficulty levels',
      one: 'visit first to open next',
      two: 'visit & check in',
      few: 'pass & be rewarded',
      other: 'pass & be rewarded',
      name: 'CheckInHiwHint',
      desc: '',
      args: [item],
    );
  }

  /// `Choose yourself`
  String get ChooseYourself {
    return Intl.message(
      'Choose yourself',
      name: 'ChooseYourself',
      desc: '',
      args: [],
    );
  }

  /// `Check it out`
  String get CheckItOut {
    return Intl.message('Check it out', name: 'CheckItOut', desc: '', args: []);
  }

  /// `Useful services and places`
  String get SocialSubtitle {
    return Intl.message(
      'Useful services and places',
      name: 'SocialSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Under service`
  String get UnderService {
    return Intl.message(
      'Under service',
      name: 'UnderService',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =0{{count} points} =1{{count} point} =2{{count} points} few{{count} points} many{{count} points} other{{count} points}}`
  String FindSomeoneCardPoints(num count) {
    return Intl.plural(
      count,
      zero: '$count points',
      one: '$count point',
      two: '$count points',
      few: '$count points',
      many: '$count points',
      other: '$count points',
      name: 'FindSomeoneCardPoints',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =0{{count} common interests} =1{{count} common interest} =2{{count} common interests} few{{count} common interests} many{{count} common interests} other{{count} common interests}}`
  String FindSomeoneCardSameInterests(num count) {
    return Intl.plural(
      count,
      zero: '$count common interests',
      one: '$count common interest',
      two: '$count common interests',
      few: '$count common interests',
      many: '$count common interests',
      other: '$count common interests',
      name: 'FindSomeoneCardSameInterests',
      desc: '',
      args: [count],
    );
  }

  /// `Under development`
  String get UnderDevelopmentMessage {
    return Intl.message(
      'Under development',
      name: 'UnderDevelopmentMessage',
      desc: '',
      args: [],
    );
  }

  /// `raised {actuallyRaised}/${goal}$`
  String DonationRaised(Object actuallyRaised, Object goal) {
    return Intl.message(
      'raised $actuallyRaised/\$$goal\$',
      name: 'DonationRaised',
      desc: '',
      args: [actuallyRaised, goal],
    );
  }

  /// `Exit`
  String get Exit {
    return Intl.message('Exit', name: 'Exit', desc: '', args: []);
  }

  /// `Pro tools`
  String get ProTools {
    return Intl.message('Pro tools', name: 'ProTools', desc: '', args: []);
  }

  /// `Taxi`
  String get Taxi {
    return Intl.message('Taxi', name: 'Taxi', desc: '', args: []);
  }

  /// `Delete account`
  String get DeleteAccount {
    return Intl.message(
      'Delete account',
      name: 'DeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message('Settings', name: 'Settings', desc: '', args: []);
  }

  /// `Yearly`
  String get Yearly {
    return Intl.message('Yearly', name: 'Yearly', desc: '', args: []);
  }

  /// `Monthly`
  String get Monthly {
    return Intl.message('Monthly', name: 'Monthly', desc: '', args: []);
  }

  /// `You can declare yourself and show your expertise in one of the areas of social life of the city or the world`
  String get InfluencerSubscriptionFeature1 {
    return Intl.message(
      'You can declare yourself and show your expertise in one of the areas of social life of the city or the world',
      name: 'InfluencerSubscriptionFeature1',
      desc: '',
      args: [],
    );
  }

  /// `You can gather your own new or supplement an existing audience`
  String get InfluencerSubscriptionFeature2 {
    return Intl.message(
      'You can gather your own new or supplement an existing audience',
      name: 'InfluencerSubscriptionFeature2',
      desc: '',
      args: [],
    );
  }

  /// `Get a set of tools for working with `
  String get InfluencerSubscriptionFeature3 {
    return Intl.message(
      'Get a set of tools for working with ',
      name: 'InfluencerSubscriptionFeature3',
      desc: '',
      args: [],
    );
  }

  /// ` content and interacting with your audience`
  String get InfluencerSubscriptionFeature3v1 {
    return Intl.message(
      ' content and interacting with your audience',
      name: 'InfluencerSubscriptionFeature3v1',
      desc: '',
      args: [],
    );
  }

  /// `Become a thought leader in your field and earn a reputation`
  String get InfluencerSubscriptionFeature4 {
    return Intl.message(
      'Become a thought leader in your field and earn a reputation',
      name: 'InfluencerSubscriptionFeature4',
      desc: '',
      args: [],
    );
  }

  /// `Influence people\'s choices and enhance the significance of places and events`
  String get InfluencerSubscriptionFeature5 {
    return Intl.message(
      'Influence people\\\'s choices and enhance the significance of places and events',
      name: 'InfluencerSubscriptionFeature5',
      desc: '',
      args: [],
    );
  }

  /// `Monetization`
  String get InfluencerSubscriptionFeature6 {
    return Intl.message(
      'Monetization',
      name: 'InfluencerSubscriptionFeature6',
      desc: '',
      args: [],
    );
  }

  /// `Unique feature "Connects".  Search, communicate, meet someone, networking`
  String get PremiumSubscriptionFeature1 {
    return Intl.message(
      'Unique feature "Connects".  Search, communicate, meet someone, networking',
      name: 'PremiumSubscriptionFeature1',
      desc: '',
      args: [],
    );
  }

  /// `Special profile label`
  String get PremiumSubscriptionFeature2 {
    return Intl.message(
      'Special profile label',
      name: 'PremiumSubscriptionFeature2',
      desc: '',
      args: [],
    );
  }

  /// `Ability to leave reviews, shoot video-reactions about places and events, participate in ratings`
  String get PremiumSubscriptionFeature3 {
    return Intl.message(
      'Ability to leave reviews, shoot video-reactions about places and events, participate in ratings',
      name: 'PremiumSubscriptionFeature3',
      desc: '',
      args: [],
    );
  }

  /// `Ability to add/suggest favorite places`
  String get PremiumSubscriptionFeature4 {
    return Intl.message(
      'Ability to add/suggest favorite places',
      name: 'PremiumSubscriptionFeature4',
      desc: '',
      args: [],
    );
  }

  /// `Ability to switch dark/light design theme`
  String get PremiumSubscriptionFeature5 {
    return Intl.message(
      'Ability to switch dark/light design theme',
      name: 'PremiumSubscriptionFeature5',
      desc: '',
      args: [],
    );
  }

  /// `Ability to become an Influencer`
  String get PremiumSubscriptionFeature6 {
    return Intl.message(
      'Ability to become an Influencer',
      name: 'PremiumSubscriptionFeature6',
      desc: '',
      args: [],
    );
  }

  /// `Ability to create and share convenient stacks of favorites`
  String get PremiumSubscriptionFeature7 {
    return Intl.message(
      'Ability to create and share convenient stacks of favorites',
      name: 'PremiumSubscriptionFeature7',
      desc: '',
      args: [],
    );
  }

  /// `Have your own event scheduler`
  String get PremiumSubscriptionFeature8 {
    return Intl.message(
      'Have your own event scheduler',
      name: 'PremiumSubscriptionFeature8',
      desc: '',
      args: [],
    );
  }

  /// `Special profile label`
  String get ProSubscriptionFeature1 {
    return Intl.message(
      'Special profile label',
      name: 'ProSubscriptionFeature1',
      desc: '',
      args: [],
    );
  }

  /// `Ability to create your own events`
  String get ProSubscriptionFeature2 {
    return Intl.message(
      'Ability to create your own events',
      name: 'ProSubscriptionFeature2',
      desc: '',
      args: [],
    );
  }

  /// `Additional motivation of potential audience (clients/visitors) with the help of points system`
  String get ProSubscriptionFeature3 {
    return Intl.message(
      'Additional motivation of potential audience (clients/visitors) with the help of points system',
      name: 'ProSubscriptionFeature3',
      desc: '',
      args: [],
    );
  }

  /// `Ability to sell related services through ticket booking`
  String get ProSubscriptionFeature4 {
    return Intl.message(
      'Ability to sell related services through ticket booking',
      name: 'ProSubscriptionFeature4',
      desc: '',
      args: [],
    );
  }

  /// `Upsales`
  String get ProSubscriptionFeature5 {
    return Intl.message(
      'Upsales',
      name: 'ProSubscriptionFeature5',
      desc: '',
      args: [],
    );
  }

  /// `Internal targeted promotion of your events, statistics and analytics`
  String get ProSubscriptionFeature6 {
    return Intl.message(
      'Internal targeted promotion of your events, statistics and analytics',
      name: 'ProSubscriptionFeature6',
      desc: '',
      args: [],
    );
  }

  /// `Ability to use specialised notifications`
  String get ProSubscriptionFeature7 {
    return Intl.message(
      'Ability to use specialised notifications',
      name: 'ProSubscriptionFeature7',
      desc: '',
      args: [],
    );
  }

  /// `Pick from map`
  String get PickFromMap {
    return Intl.message(
      'Pick from map',
      name: 'PickFromMap',
      desc: '',
      args: [],
    );
  }

  /// `Add promotion`
  String get AddPromotion {
    return Intl.message(
      'Add promotion',
      name: 'AddPromotion',
      desc: '',
      args: [],
    );
  }

  /// `Archive`
  String get Archive {
    return Intl.message('Archive', name: 'Archive', desc: '', args: []);
  }

  /// `Delete company`
  String get DeleteCompany {
    return Intl.message(
      'Delete company',
      name: 'DeleteCompany',
      desc: '',
      args: [],
    );
  }

  /// `Select Date Range`
  String get SelectDateRange {
    return Intl.message(
      'Select Date Range',
      name: 'SelectDateRange',
      desc: '',
      args: [],
    );
  }

  /// `Date Range`
  String get DateRange {
    return Intl.message('Date Range', name: 'DateRange', desc: '', args: []);
  }

  /// `Reset`
  String get Reset {
    return Intl.message('Reset', name: 'Reset', desc: '', args: []);
  }

  /// `Thanks!\nNow we know you better`
  String get NowWeKnowYouBetter {
    return Intl.message(
      'Thanks!\nNow we know you better',
      name: 'NowWeKnowYouBetter',
      desc: '',
      args: [],
    );
  }

  /// `Tell us more`
  String get TellUsMore {
    return Intl.message('Tell us more', name: 'TellUsMore', desc: '', args: []);
  }

  /// `Very often`
  String get VeryOften {
    return Intl.message('Very often', name: 'VeryOften', desc: '', args: []);
  }

  /// `in {days} {days, plural, =0{days} =1{day} =2{days} few{days} many{days} other{days}}`
  String WithInDays(num days) {
    return Intl.message(
      'in $days ${Intl.plural(days, zero: 'days', one: 'day', two: 'days', few: 'days', many: 'days', other: 'days')}',
      name: 'WithInDays',
      desc: '',
      args: [days],
    );
  }

  /// `Happiness for children and family`
  String get SearchChooseYourself1 {
    return Intl.message(
      'Happiness for children and family',
      name: 'SearchChooseYourself1',
      desc: '',
      args: [],
    );
  }

  /// `Thirst for adventure`
  String get SearchChooseYourself2 {
    return Intl.message(
      'Thirst for adventure',
      name: 'SearchChooseYourself2',
      desc: '',
      args: [],
    );
  }

  /// `Parties and dancing`
  String get SearchChooseYourself3 {
    return Intl.message(
      'Parties and dancing',
      name: 'SearchChooseYourself3',
      desc: '',
      args: [],
    );
  }

  /// `Extremes and thrills`
  String get SearchChooseYourself4 {
    return Intl.message(
      'Extremes and thrills',
      name: 'SearchChooseYourself4',
      desc: '',
      args: [],
    );
  }

  /// `Age of enlightenment`
  String get SearchChooseYourself5 {
    return Intl.message(
      'Age of enlightenment',
      name: 'SearchChooseYourself5',
      desc: '',
      args: [],
    );
  }

  /// `Fine dining`
  String get SearchChooseYourself6 {
    return Intl.message(
      'Fine dining',
      name: 'SearchChooseYourself6',
      desc: '',
      args: [],
    );
  }

  /// `Bliss and chill`
  String get SearchChooseYourself7 {
    return Intl.message(
      'Bliss and chill',
      name: 'SearchChooseYourself7',
      desc: '',
      args: [],
    );
  }

  /// `Sporty movements`
  String get SearchChooseYourself8 {
    return Intl.message(
      'Sporty movements',
      name: 'SearchChooseYourself8',
      desc: '',
      args: [],
    );
  }

  /// `Self-care (Health and beauty/self-love)`
  String get SearchChooseYourself9 {
    return Intl.message(
      'Self-care (Health and beauty/self-love)',
      name: 'SearchChooseYourself9',
      desc: '',
      args: [],
    );
  }

  /// `Time for update`
  String get UpdateAppMessageTitle {
    return Intl.message(
      'Time for update',
      name: 'UpdateAppMessageTitle',
      desc: '',
      args: [],
    );
  }

  /// `It's been a while since you've updated our app, and we've added a lot of handy stuff in the meantime`
  String get UpdateAppMessage {
    return Intl.message(
      'It\'s been a while since you\'ve updated our app, and we\'ve added a lot of handy stuff in the meantime',
      name: 'UpdateAppMessage',
      desc: '',
      args: [],
    );
  }

  /// `Business clubs`
  String get SearchBusinessChooseYourself1 {
    return Intl.message(
      'Business clubs',
      name: 'SearchBusinessChooseYourself1',
      desc: '',
      args: [],
    );
  }

  /// `Digital & IT conferences`
  String get SearchBusinessChooseYourself2 {
    return Intl.message(
      'Digital & IT conferences',
      name: 'SearchBusinessChooseYourself2',
      desc: '',
      args: [],
    );
  }

  /// `Pitch sessions`
  String get SearchBusinessChooseYourself3 {
    return Intl.message(
      'Pitch sessions',
      name: 'SearchBusinessChooseYourself3',
      desc: '',
      args: [],
    );
  }

  /// `Business games`
  String get SearchBusinessChooseYourself4 {
    return Intl.message(
      'Business games',
      name: 'SearchBusinessChooseYourself4',
      desc: '',
      args: [],
    );
  }

  /// `Forums (industry exhibitions)`
  String get SearchBusinessChooseYourself5 {
    return Intl.message(
      'Forums (industry exhibitions)',
      name: 'SearchBusinessChooseYourself5',
      desc: '',
      args: [],
    );
  }

  /// `Networking`
  String get SearchBusinessChooseYourself6 {
    return Intl.message(
      'Networking',
      name: 'SearchBusinessChooseYourself6',
      desc: '',
      args: [],
    );
  }

  /// `Seminars and trainings`
  String get SearchBusinessChooseYourself7 {
    return Intl.message(
      'Seminars and trainings',
      name: 'SearchBusinessChooseYourself7',
      desc: '',
      args: [],
    );
  }

  /// `Continue with {provider}`
  String LoginWith(Object provider) {
    return Intl.message(
      'Continue with $provider',
      name: 'LoginWith',
      desc: '',
      args: [provider],
    );
  }

  /// `Control`
  String get Control {
    return Intl.message('Control', name: 'Control', desc: '', args: []);
  }

  /// `Rating`
  String get Rating {
    return Intl.message('Rating', name: 'Rating', desc: '', args: []);
  }

  /// `Add feedback`
  String get AddFeedback {
    return Intl.message(
      'Add feedback',
      name: 'AddFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Describe your experience`
  String get AddFeedbackFieldTitle {
    return Intl.message(
      'Describe your experience',
      name: 'AddFeedbackFieldTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tell us what you liked or remember`
  String get AddFeedbackFieldHint {
    return Intl.message(
      'Tell us what you liked or remember',
      name: 'AddFeedbackFieldHint',
      desc: '',
      args: [],
    );
  }

  /// `Add review`
  String get AddReview {
    return Intl.message('Add review', name: 'AddReview', desc: '', args: []);
  }

  /// `Write a useful addition`
  String get AddReviewFieldHint {
    return Intl.message(
      'Write a useful addition',
      name: 'AddReviewFieldHint',
      desc: '',
      args: [],
    );
  }

  /// `Describe your experience`
  String get AddReviewFieldTitle {
    return Intl.message(
      'Describe your experience',
      name: 'AddReviewFieldTitle',
      desc: '',
      args: [],
    );
  }

  /// `Personal respect`
  String get PersonalRespect {
    return Intl.message(
      'Personal respect',
      name: 'PersonalRespect',
      desc: '',
      args: [],
    );
  }

  /// `Add to personal TOP`
  String get AddToPersonalTop {
    return Intl.message(
      'Add to personal TOP',
      name: 'AddToPersonalTop',
      desc: '',
      args: [],
    );
  }

  /// `Write a detailed review, use all the available characters so that as many people as possible can appreciate it`
  String get AddInfluencerFeedbackPopOverText {
    return Intl.message(
      'Write a detailed review, use all the available characters so that as many people as possible can appreciate it',
      name: 'AddInfluencerFeedbackPopOverText',
      desc: '',
      args: [],
    );
  }

  /// `Title your TOP`
  String get TitleYourTop {
    return Intl.message(
      'Title your TOP',
      name: 'TitleYourTop',
      desc: '',
      args: [],
    );
  }

  /// `Write an addition to the review that will be useful for other visitors.`
  String get AddReviewPopOverText {
    return Intl.message(
      'Write an addition to the review that will be useful for other visitors.',
      name: 'AddReviewPopOverText',
      desc: '',
      args: [],
    );
  }

  /// `Your feedback has been successfully added`
  String get FeedbackAddedSuccessfullyMessage {
    return Intl.message(
      'Your feedback has been successfully added',
      name: 'FeedbackAddedSuccessfullyMessage',
      desc: '',
      args: [],
    );
  }

  /// `Add reaction`
  String get AddReactions {
    return Intl.message(
      'Add reaction',
      name: 'AddReactions',
      desc: '',
      args: [],
    );
  }

  /// `Reactions\nby`
  String get ReactionsBy {
    return Intl.message(
      'Reactions\nby',
      name: 'ReactionsBy',
      desc: '',
      args: [],
    );
  }

  /// `Albums`
  String get Albums {
    return Intl.message('Albums', name: 'Albums', desc: '', args: []);
  }

  /// `All albums`
  String get AllAlbums {
    return Intl.message('All albums', name: 'AllAlbums', desc: '', args: []);
  }

  /// `Go`
  String get GoNoExclamation {
    return Intl.message('Go', name: 'GoNoExclamation', desc: '', args: []);
  }

  /// `Your reaction has been successfully added`
  String get VideoReactionAdded {
    return Intl.message(
      'Your reaction has been successfully added',
      name: 'VideoReactionAdded',
      desc: '',
      args: [],
    );
  }

  /// `You missed a lot`
  String get YouMissedALot {
    return Intl.message(
      'You missed a lot',
      name: 'YouMissedALot',
      desc: '',
      args: [],
    );
  }

  /// `More about this place`
  String get MoreAboutThisPlace {
    return Intl.message(
      'More about this place',
      name: 'MoreAboutThisPlace',
      desc: '',
      args: [],
    );
  }

  /// `More about this event`
  String get MoreAboutThisEvent {
    return Intl.message(
      'More about this event',
      name: 'MoreAboutThisEvent',
      desc: '',
      args: [],
    );
  }

  /// `Reactions by critics`
  String get ReactionsByCritics {
    return Intl.message(
      'Reactions by critics',
      name: 'ReactionsByCritics',
      desc: '',
      args: [],
    );
  }

  /// `Make sure you are close and try check in again`
  String get MakeSureYouAreCloseToMakeCheckIn {
    return Intl.message(
      'Make sure you are close and try check in again',
      name: 'MakeSureYouAreCloseToMakeCheckIn',
      desc: '',
      args: [],
    );
  }

  /// `Location is required to procceed check in`
  String get LocationIsRequired {
    return Intl.message(
      'Location is required to procceed check in',
      name: 'LocationIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `You can get`
  String get YouCanGet {
    return Intl.message('You can get', name: 'YouCanGet', desc: '', args: []);
  }

  /// `Different number of points`
  String get DifferentNumberOfPoints {
    return Intl.message(
      'Different number of points',
      name: 'DifferentNumberOfPoints',
      desc: '',
      args: [],
    );
  }

  /// `Real money`
  String get RealMoney {
    return Intl.message('Real money', name: 'RealMoney', desc: '', args: []);
  }

  /// `Inventory items`
  String get InventoryItems {
    return Intl.message(
      'Inventory items',
      name: 'InventoryItems',
      desc: '',
      args: [],
    );
  }

  /// `Dubai Event Ticket`
  String get DubaiEventTicket {
    return Intl.message(
      'Dubai Event Ticket',
      name: 'DubaiEventTicket',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations`
  String get Congratulations {
    return Intl.message(
      'Congratulations',
      name: 'Congratulations',
      desc: '',
      args: [],
    );
  }

  /// `You received`
  String get YouReceived {
    return Intl.message(
      'You received',
      name: 'YouReceived',
      desc: '',
      args: [],
    );
  }

  /// `Give access to health kit usage otherwise the result will be random`
  String get HealthRandomAlert {
    return Intl.message(
      'Give access to health kit usage otherwise the result will be random',
      name: 'HealthRandomAlert',
      desc: '',
      args: [],
    );
  }

  /// `Mon`
  String get MondayShort {
    return Intl.message('Mon', name: 'MondayShort', desc: '', args: []);
  }

  /// `Tue`
  String get TuesdayShort {
    return Intl.message('Tue', name: 'TuesdayShort', desc: '', args: []);
  }

  /// `Wed`
  String get WednesdayShort {
    return Intl.message('Wed', name: 'WednesdayShort', desc: '', args: []);
  }

  /// `Thu`
  String get ThursdayShort {
    return Intl.message('Thu', name: 'ThursdayShort', desc: '', args: []);
  }

  /// `Fri`
  String get FridayShort {
    return Intl.message('Fri', name: 'FridayShort', desc: '', args: []);
  }

  /// `Sat`
  String get SaturdayShort {
    return Intl.message('Sat', name: 'SaturdayShort', desc: '', args: []);
  }

  /// `Sun`
  String get SundayShort {
    return Intl.message('Sun', name: 'SundayShort', desc: '', args: []);
  }

  /// `Not set`
  String get NotSet {
    return Intl.message('Not set', name: 'NotSet', desc: '', args: []);
  }

  /// `Unfollow`
  String get Unfollow {
    return Intl.message('Unfollow', name: 'Unfollow', desc: '', args: []);
  }

  /// `{count, plural, =0{followers} =1{follower} =2{followers} few{followers} many{followers} other{followers}}`
  String FollowersCount(num count) {
    return Intl.plural(
      count,
      zero: 'followers',
      one: 'follower',
      two: 'followers',
      few: 'followers',
      many: 'followers',
      other: 'followers',
      name: 'FollowersCount',
      desc: '',
      args: [count],
    );
  }

  /// `Contacts`
  String get Contacts {
    return Intl.message('Contacts', name: 'Contacts', desc: '', args: []);
  }

  /// `{count, plural, =0{reviews} =1{review} =2{reviews} few{reviews} many{reviews} other{reviews}}`
  String ReviewsReceived(num count) {
    return Intl.plural(
      count,
      zero: 'reviews',
      one: 'review',
      two: 'reviews',
      few: 'reviews',
      many: 'reviews',
      other: 'reviews',
      name: 'ReviewsReceived',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =0{bookings} =1{booking} =2{bookings} few{bookings} many{bookings} other{bookings}}`
  String Bookings(num count) {
    return Intl.plural(
      count,
      zero: 'bookings',
      one: 'booking',
      two: 'bookings',
      few: 'bookings',
      many: 'bookings',
      other: 'bookings',
      name: 'Bookings',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =0{events} =1{event} =2{events} few{events} many{events} other{events}}`
  String EventsCount(num count) {
    return Intl.plural(
      count,
      zero: 'events',
      one: 'event',
      two: 'events',
      few: 'events',
      many: 'events',
      other: 'events',
      name: 'EventsCount',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =0{visits} =1{visit} =2{visits} few{visits} many{visits} other{visits}}`
  String PlacesVisited(num count) {
    return Intl.plural(
      count,
      zero: 'visits',
      one: 'visit',
      two: 'visits',
      few: 'visits',
      many: 'visits',
      other: 'visits',
      name: 'PlacesVisited',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =0{reviews} =1{review} =2{reviews} few{reviews} many{reviews} other{reviews}}`
  String ReviewsPosted(num count) {
    return Intl.plural(
      count,
      zero: 'reviews',
      one: 'review',
      two: 'reviews',
      few: 'reviews',
      many: 'reviews',
      other: 'reviews',
      name: 'ReviewsPosted',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =0{points} =1{point} =2{points} few{points} many{points} other{points}}`
  String PointsEarned(num count) {
    return Intl.plural(
      count,
      zero: 'points',
      one: 'point',
      two: 'points',
      few: 'points',
      many: 'points',
      other: 'points',
      name: 'PointsEarned',
      desc: '',
      args: [count],
    );
  }

  /// `New`
  String get New {
    return Intl.message('New', name: 'New', desc: '', args: []);
  }

  /// `Voice`
  String get Voice {
    return Intl.message('Voice', name: 'Voice', desc: '', args: []);
  }

  /// `Ideal route`
  String get IdealRoute {
    return Intl.message('Ideal route', name: 'IdealRoute', desc: '', args: []);
  }

  /// `Interview`
  String get Interview {
    return Intl.message('Interview', name: 'Interview', desc: '', args: []);
  }

  /// `Chat`
  String get Chat {
    return Intl.message('Chat', name: 'Chat', desc: '', args: []);
  }

  /// `NFT`
  String get NFT {
    return Intl.message('NFT', name: 'NFT', desc: '', args: []);
  }

  /// `Contest`
  String get Contest {
    return Intl.message('Contest', name: 'Contest', desc: '', args: []);
  }

  /// `{count, plural, =0{comments} =1{comment} =2{comments} few{comments} many{comments} other{comments}}`
  String Comments(num count) {
    return Intl.plural(
      count,
      zero: 'comments',
      one: 'comment',
      two: 'comments',
      few: 'comments',
      many: 'comments',
      other: 'comments',
      name: 'Comments',
      desc: '',
      args: [count],
    );
  }

  /// `Respect`
  String get Respect {
    return Intl.message('Respect', name: 'Respect', desc: '', args: []);
  }

  /// `Top`
  String get Top {
    return Intl.message('Top', name: 'Top', desc: '', args: []);
  }

  /// `Personal TOP`
  String get PersonalTop {
    return Intl.message(
      'Personal TOP',
      name: 'PersonalTop',
      desc: '',
      args: [],
    );
  }

  /// `Bookings and Invites`
  String get BookingsAndInvites {
    return Intl.message(
      'Bookings and Invites',
      name: 'BookingsAndInvites',
      desc: '',
      args: [],
    );
  }

  /// `Building number`
  String get BuildingNumber {
    return Intl.message(
      'Building number',
      name: 'BuildingNumber',
      desc: '',
      args: [],
    );
  }

  /// `Office or appt number`
  String get OfficeAppartmentNumber {
    return Intl.message(
      'Office or appt number',
      name: 'OfficeAppartmentNumber',
      desc: '',
      args: [],
    );
  }

  /// `Average bill`
  String get AverageBill {
    return Intl.message(
      'Average bill',
      name: 'AverageBill',
      desc: '',
      args: [],
    );
  }

  /// `Select price or price range`
  String get HintAverageBill {
    return Intl.message(
      'Select price or price range',
      name: 'HintAverageBill',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get SubscribeToProfile {
    return Intl.message(
      'Follow',
      name: 'SubscribeToProfile',
      desc: '',
      args: [],
    );
  }

  /// `Unfollow`
  String get UnsubscribeFromProfile {
    return Intl.message(
      'Unfollow',
      name: 'UnsubscribeFromProfile',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get Reviews {
    return Intl.message('Reviews', name: 'Reviews', desc: '', args: []);
  }

  /// `Religion`
  String get Religion {
    return Intl.message('Religion', name: 'Religion', desc: '', args: []);
  }

  /// `Select gender`
  String get SelectGender {
    return Intl.message(
      'Select gender',
      name: 'SelectGender',
      desc: '',
      args: [],
    );
  }

  /// `Build your business with`
  String get BuildYOurBusiness {
    return Intl.message(
      'Build your business with',
      name: 'BuildYOurBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Restore purchases`
  String get RestorePurchase {
    return Intl.message(
      'Restore purchases',
      name: 'RestorePurchase',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get Success {
    return Intl.message('Success', name: 'Success', desc: '', args: []);
  }

  /// `Oops`
  String get Oops {
    return Intl.message('Oops', name: 'Oops', desc: '', args: []);
  }

  /// `Something went wrong. Please try again.`
  String get SomethingWentWrong {
    return Intl.message(
      'Something went wrong. Please try again.',
      name: 'SomethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `All {value} features are now available!`
  String AllXFeaturesAvailable(Object value) {
    return Intl.message(
      'All $value features are now available!',
      name: 'AllXFeaturesAvailable',
      desc: '',
      args: [value],
    );
  }

  /// `3 events available & add more for extra price`
  String get HintNumberEventsForPro {
    return Intl.message(
      '3 events available & add more for extra price',
      name: 'HintNumberEventsForPro',
      desc: '',
      args: [],
    );
  }

  /// `Create your event and invite people`
  String get CreateYourEventAndInvitePeople {
    return Intl.message(
      'Create your event and invite people',
      name: 'CreateYourEventAndInvitePeople',
      desc: '',
      args: [],
    );
  }

  /// `Trial period`
  String get TrialPeriod {
    return Intl.message(
      'Trial period',
      name: 'TrialPeriod',
      desc: '',
      args: [],
    );
  }

  /// `You get access to all benefits free of charge for`
  String get YouGetAccessToTrial {
    return Intl.message(
      'You get access to all benefits free of charge for',
      name: 'YouGetAccessToTrial',
      desc: '',
      args: [],
    );
  }

  /// `Free`
  String get Free {
    return Intl.message('Free', name: 'Free', desc: '', args: []);
  }

  /// `Set work schedule`
  String get SetWorkHours {
    return Intl.message(
      'Set work schedule',
      name: 'SetWorkHours',
      desc: '',
      args: [],
    );
  }

  /// `Select currency`
  String get SelectCurrency {
    return Intl.message(
      'Select currency',
      name: 'SelectCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Enter price`
  String get EnterPrice {
    return Intl.message('Enter price', name: 'EnterPrice', desc: '', args: []);
  }

  /// `Price range`
  String get PriceRange {
    return Intl.message('Price range', name: 'PriceRange', desc: '', args: []);
  }

  /// `Invites`
  String get Invites {
    return Intl.message('Invites', name: 'Invites', desc: '', args: []);
  }

  /// `Bookings`
  String get BookingsHeading {
    return Intl.message(
      'Bookings',
      name: 'BookingsHeading',
      desc: '',
      args: [],
    );
  }

  /// `Select price and currency`
  String get SelectPriceAndCurrency {
    return Intl.message(
      'Select price and currency',
      name: 'SelectPriceAndCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get Submit {
    return Intl.message('Submit', name: 'Submit', desc: '', args: []);
  }

  /// `Enter location`
  String get EnterLocation {
    return Intl.message(
      'Enter location',
      name: 'EnterLocation',
      desc: '',
      args: [],
    );
  }

  /// `Enter title`
  String get EnterTitle {
    return Intl.message('Enter title', name: 'EnterTitle', desc: '', args: []);
  }

  /// `Why do you love it?`
  String get WhyDoYouLoveIt {
    return Intl.message(
      'Why do you love it?',
      name: 'WhyDoYouLoveIt',
      desc: '',
      args: [],
    );
  }

  /// `Submit content`
  String get SubmitContent {
    return Intl.message(
      'Submit content',
      name: 'SubmitContent',
      desc: '',
      args: [],
    );
  }

  /// `Place submitted successfully`
  String get PlaceSubmittedSuccessfully {
    return Intl.message(
      'Place submitted successfully',
      name: 'PlaceSubmittedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get Feedback {
    return Intl.message('Feedback', name: 'Feedback', desc: '', args: []);
  }

  /// `Reply`
  String get Reply {
    return Intl.message('Reply', name: 'Reply', desc: '', args: []);
  }

  /// `Write the answer`
  String get WriteTheAnswer {
    return Intl.message(
      'Write the answer',
      name: 'WriteTheAnswer',
      desc: '',
      args: [],
    );
  }

  /// `Successfully answered`
  String get SuccessfullyAnswered {
    return Intl.message(
      'Successfully answered',
      name: 'SuccessfullyAnswered',
      desc: '',
      args: [],
    );
  }

  /// `Range end value is less than begining one`
  String get RangeEndValueIsLessThanBeginingOne {
    return Intl.message(
      'Range end value is less than begining one',
      name: 'RangeEndValueIsLessThanBeginingOne',
      desc: '',
      args: [],
    );
  }

  /// `{minutes}m ago`
  String MinutesAgo(Object minutes) {
    return Intl.message(
      '${minutes}m ago',
      name: 'MinutesAgo',
      desc: '',
      args: [minutes],
    );
  }

  /// `{hours}h ago`
  String HoursAgo(Object hours) {
    return Intl.message(
      '${hours}h ago',
      name: 'HoursAgo',
      desc: '',
      args: [hours],
    );
  }

  /// `Yesterday`
  String get Yesterday {
    return Intl.message('Yesterday', name: 'Yesterday', desc: '', args: []);
  }

  /// `a week ago`
  String get WeekAgo {
    return Intl.message('a week ago', name: 'WeekAgo', desc: '', args: []);
  }

  /// `In any case, content will be moderated, please take care of the quality`
  String get ContentQualityNotice {
    return Intl.message(
      'In any case, content will be moderated, please take care of the quality',
      name: 'ContentQualityNotice',
      desc: '',
      args: [],
    );
  }

  /// `Select your specialty`
  String get SelectYourSpecialty {
    return Intl.message(
      'Select your specialty',
      name: 'SelectYourSpecialty',
      desc: '',
      args: [],
    );
  }

  /// `Content that is available for you to view will appear here`
  String get ContentThatIsAvailableForYouToViewWillAppearHere {
    return Intl.message(
      'Content that is available for you to view will appear here',
      name: 'ContentThatIsAvailableForYouToViewWillAppearHere',
      desc: '',
      args: [],
    );
  }

  /// `To become an influencer you need to do`
  String get ToBecomeAnInfluencerYouNeedToDo {
    return Intl.message(
      'To become an influencer you need to do',
      name: 'ToBecomeAnInfluencerYouNeedToDo',
      desc: '',
      args: [],
    );
  }

  /// `{count} Video-Reaction`
  String CountVideoReaction(Object count) {
    return Intl.message(
      '$count Video-Reaction',
      name: 'CountVideoReaction',
      desc: '',
      args: [count],
    );
  }

  /// `{count} Reviews`
  String CountReviews(Object count) {
    return Intl.message(
      '$count Reviews',
      name: 'CountReviews',
      desc: '',
      args: [count],
    );
  }

  /// `Your progress`
  String get YourProgress {
    return Intl.message(
      'Your progress',
      name: 'YourProgress',
      desc: '',
      args: [],
    );
  }

  /// `These content is on your other lists. When added, it will be removed from the current.`
  String get TheseContentIsOnYourOtherLists {
    return Intl.message(
      'These content is on your other lists. When added, it will be removed from the current.',
      name: 'TheseContentIsOnYourOtherLists',
      desc: '',
      args: [],
    );
  }

  /// `The best parties`
  String get TheBestParties {
    return Intl.message(
      'The best parties',
      name: 'TheBestParties',
      desc: '',
      args: [],
    );
  }

  /// `Must visit technology conf`
  String get MustVisitTechnologyConf {
    return Intl.message(
      'Must visit technology conf',
      name: 'MustVisitTechnologyConf',
      desc: '',
      args: [],
    );
  }

  /// `shared with you`
  String get SharedWithYou {
    return Intl.message(
      'shared with you',
      name: 'SharedWithYou',
      desc: '',
      args: [],
    );
  }

  /// `The best technologies conf`
  String get TheBestTechnologiesConf {
    return Intl.message(
      'The best technologies conf',
      name: 'TheBestTechnologiesConf',
      desc: '',
      args: [],
    );
  }

  /// `The best tech conf`
  String get TheBestTechConf {
    return Intl.message(
      'The best tech conf',
      name: 'TheBestTechConf',
      desc: '',
      args: [],
    );
  }

  /// `Add to my favorites`
  String get AddToMyFavorites {
    return Intl.message(
      'Add to my favorites',
      name: 'AddToMyFavorites',
      desc: '',
      args: [],
    );
  }

  /// `List “The best technologies conf” successfully added`
  String get TheBestTechListSuccessfullyAdded {
    return Intl.message(
      'List “The best technologies conf” successfully added',
      name: 'TheBestTechListSuccessfullyAdded',
      desc: '',
      args: [],
    );
  }

  /// `Recently added`
  String get RecentlyAdded {
    return Intl.message(
      'Recently added',
      name: 'RecentlyAdded',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get Date {
    return Intl.message('Date', name: 'Date', desc: '', args: []);
  }

  /// `Properties`
  String get Properties {
    return Intl.message('Properties', name: 'Properties', desc: '', args: []);
  }

  /// `Search or add tag`
  String get SearchOrAddTag {
    return Intl.message(
      'Search or add tag',
      name: 'SearchOrAddTag',
      desc: '',
      args: [],
    );
  }

  /// `Activity types`
  String get ActivityTypes {
    return Intl.message(
      'Activity types',
      name: 'ActivityTypes',
      desc: '',
      args: [],
    );
  }

  /// `Voices`
  String get Voices {
    return Intl.message('Voices', name: 'Voices', desc: '', args: []);
  }

  /// `News`
  String get News {
    return Intl.message('News', name: 'News', desc: '', args: []);
  }

  /// `You will receive new tools`
  String get YouWillReceiveNewTools {
    return Intl.message(
      'You will receive new tools',
      name: 'YouWillReceiveNewTools',
      desc: '',
      args: [],
    );
  }

  /// `Your new tools`
  String get YourNewTools {
    return Intl.message(
      'Your new tools',
      name: 'YourNewTools',
      desc: '',
      args: [],
    );
  }

  /// `To open the next set of tools you need to do`
  String get ToOpenTheNextSetOfToolsYouNeedToDo {
    return Intl.message(
      'To open the next set of tools you need to do',
      name: 'ToOpenTheNextSetOfToolsYouNeedToDo',
      desc: '',
      args: [],
    );
  }

  /// `Icons`
  String get Icons {
    return Intl.message('Icons', name: 'Icons', desc: '', args: []);
  }

  /// `Related properties`
  String get RelatedProperties {
    return Intl.message(
      'Related properties',
      name: 'RelatedProperties',
      desc: '',
      args: [],
    );
  }

  /// `Search property`
  String get SearchProperty {
    return Intl.message(
      'Search property',
      name: 'SearchProperty',
      desc: '',
      args: [],
    );
  }

  /// `Album`
  String get Album {
    return Intl.message('Album', name: 'Album', desc: '', args: []);
  }

  /// `You must select at least one video`
  String get MustSelectVideo {
    return Intl.message(
      'You must select at least one video',
      name: 'MustSelectVideo',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get Back {
    return Intl.message('Back', name: 'Back', desc: '', args: []);
  }

  /// `File does not exist`
  String get FileNotExistsMessage {
    return Intl.message(
      'File does not exist',
      name: 'FileNotExistsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Content id not provided`
  String get ContentIdNotProvidedError {
    return Intl.message(
      'Content id not provided',
      name: 'ContentIdNotProvidedError',
      desc: '',
      args: [],
    );
  }

  /// `Reaction successfully added`
  String get VideoReactionUploadedMessage {
    return Intl.message(
      'Reaction successfully added',
      name: 'VideoReactionUploadedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Cutting video`
  String get CuttingVideo {
    return Intl.message(
      'Cutting video',
      name: 'CuttingVideo',
      desc: '',
      args: [],
    );
  }

  /// `Compressing video`
  String get CompressingVideo {
    return Intl.message(
      'Compressing video',
      name: 'CompressingVideo',
      desc: '',
      args: [],
    );
  }

  /// `Uploading video`
  String get UploadingVideo {
    return Intl.message(
      'Uploading video',
      name: 'UploadingVideo',
      desc: '',
      args: [],
    );
  }

  /// `Video file not cut`
  String get VideoFileNotCut {
    return Intl.message(
      'Video file not cut',
      name: 'VideoFileNotCut',
      desc: '',
      args: [],
    );
  }

  /// `Compressing video {progress}%`
  String CompressingVideoProgress(Object progress) {
    return Intl.message(
      'Compressing video $progress%',
      name: 'CompressingVideoProgress',
      desc: '',
      args: [progress],
    );
  }

  /// `Okay`
  String get Okay {
    return Intl.message('Okay', name: 'Okay', desc: '', args: []);
  }

  /// `My reactions`
  String get MyReactions {
    return Intl.message(
      'My reactions',
      name: 'MyReactions',
      desc: '',
      args: [],
    );
  }

  /// `My feedback`
  String get MyFeedback {
    return Intl.message('My feedback', name: 'MyFeedback', desc: '', args: []);
  }

  /// `Visit places and events in Shuffle and share your impressions`
  String get NoFeedbacksYet {
    return Intl.message(
      'Visit places and events in Shuffle and share your impressions',
      name: 'NoFeedbacksYet',
      desc: '',
      args: [],
    );
  }

  /// `No people available to invite`
  String get NoPeopleAvailableToInvite {
    return Intl.message(
      'No people available to invite',
      name: 'NoPeopleAvailableToInvite',
      desc: '',
      args: [],
    );
  }

  /// `Be the first to review`
  String get NoReviewsMessage {
    return Intl.message(
      'Be the first to review',
      name: 'NoReviewsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Be the first`
  String get BeFirstToInvite {
    return Intl.message(
      'Be the first',
      name: 'BeFirstToInvite',
      desc: '',
      args: [],
    );
  }

  /// `Reviews by critics`
  String get ReviewsByCritics {
    return Intl.message(
      'Reviews by critics',
      name: 'ReviewsByCritics',
      desc: '',
      args: [],
    );
  }

  /// `Visit places and events in Shuffle and make amazing video-reactions`
  String get NoVideoReactionsYet {
    return Intl.message(
      'Visit places and events in Shuffle and make amazing video-reactions',
      name: 'NoVideoReactionsYet',
      desc: '',
      args: [],
    );
  }

  /// `Accrual`
  String get Accrual {
    return Intl.message('Accrual', name: 'Accrual', desc: '', args: []);
  }

  /// `Activation`
  String get Activation {
    return Intl.message('Activation', name: 'Activation', desc: '', args: []);
  }

  /// `View history`
  String get ViewHistory {
    return Intl.message(
      'View history',
      name: 'ViewHistory',
      desc: '',
      args: [],
    );
  }

  /// `Icon`
  String get Icon {
    return Intl.message('Icon', name: 'Icon', desc: '', args: []);
  }

  /// `Info`
  String get Info {
    return Intl.message('Info', name: 'Info', desc: '', args: []);
  }

  /// `Video-reactions`
  String get VideoReactions {
    return Intl.message(
      'Video-reactions',
      name: 'VideoReactions',
      desc: '',
      args: [],
    );
  }

  /// `Show deleted`
  String get ShowDeleted {
    return Intl.message(
      'Show deleted',
      name: 'ShowDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Expand thread`
  String get ExpandThread {
    return Intl.message(
      'Expand thread',
      name: 'ExpandThread',
      desc: '',
      args: [],
    );
  }

  /// `Collapse thread`
  String get CollapseThread {
    return Intl.message(
      'Collapse thread',
      name: 'CollapseThread',
      desc: '',
      args: [],
    );
  }

  /// `You can view this profile once it becomes an influencer`
  String get CantSeePublicProfileMessage {
    return Intl.message(
      'You can view this profile once it becomes an influencer',
      name: 'CantSeePublicProfileMessage',
      desc: '',
      args: [],
    );
  }

  /// `To enable health kit please go to Privacy & Security section in Settings, then go to Health section and select Shuffle App there`
  String get InstructionsToEnableHealthKit {
    return Intl.message(
      'To enable health kit please go to Privacy & Security section in Settings, then go to Health section and select Shuffle App there',
      name: 'InstructionsToEnableHealthKit',
      desc: '',
      args: [],
    );
  }

  /// `Push up your business`
  String get PushUpYourBusiness {
    return Intl.message(
      'Push up your business',
      name: 'PushUpYourBusiness',
      desc: '',
      args: [],
    );
  }

  /// `Show\nmore`
  String get ShowMore {
    return Intl.message('Show\nmore', name: 'ShowMore', desc: '', args: []);
  }

  /// `Go ahead and grow your business`
  String get GoAheadAndGrowYourBusiness {
    return Intl.message(
      'Go ahead and grow your business',
      name: 'GoAheadAndGrowYourBusiness',
      desc: '',
      args: [],
    );
  }

  /// `about us`
  String get AboutUs {
    return Intl.message('about us', name: 'AboutUs', desc: '', args: []);
  }

  /// `Open now`
  String get OpenNow {
    return Intl.message('Open now', name: 'OpenNow', desc: '', args: []);
  }

  /// `It is a non-public profile that allows you to post your places, branches, and place's events`
  String get CompanyPresentationSlider1 {
    return Intl.message(
      'It is a non-public profile that allows you to post your places, branches, and place\'s events',
      name: 'CompanyPresentationSlider1',
      desc: '',
      args: [],
    );
  }

  /// `You can create branches; in a  place card users will see the entire brench network`
  String get CompanyPresentationSlider2 {
    return Intl.message(
      'You can create branches; in a  place card users will see the entire brench network',
      name: 'CompanyPresentationSlider2',
      desc: '',
      args: [],
    );
  }

  /// `Your content appears in the app's rotation and is recommended to users through the unique Shuffle system, - with user and content properties, behavioral factors, geo, weather, etc`
  String get CompanyPresentationSlider3 {
    return Intl.message(
      'Your content appears in the app\'s rotation and is recommended to users through the unique Shuffle system, - with user and content properties, behavioral factors, geo, weather, etc',
      name: 'CompanyPresentationSlider3',
      desc: '',
      args: [],
    );
  }

  /// `Increase awareness & traffic to your places and events. All app's & users features are around your content cards`
  String get CompanyPresentationSlider4 {
    return Intl.message(
      'Increase awareness & traffic to your places and events. All app\'s & users features are around your content cards',
      name: 'CompanyPresentationSlider4',
      desc: '',
      args: [],
    );
  }

  /// `You attract specialized Shuffle influencers who will elevate the status of your places`
  String get CompanyPresentationSlider5 {
    return Intl.message(
      'You attract specialized Shuffle influencers who will elevate the status of your places',
      name: 'CompanyPresentationSlider5',
      desc: '',
      args: [],
    );
  }

  /// `You can interact with your audience through the unique functionality of special notifications, reminders, offers and presales`
  String get CompanyPresentationSlider6 {
    return Intl.message(
      'You can interact with your audience through the unique functionality of special notifications, reminders, offers and presales',
      name: 'CompanyPresentationSlider6',
      desc: '',
      args: [],
    );
  }

  /// `You can use the internal targeted advertising system`
  String get CompanyPresentationSlider7 {
    return Intl.message(
      'You can use the internal targeted advertising system',
      name: 'CompanyPresentationSlider7',
      desc: '',
      args: [],
    );
  }

  /// `You can integrate your booking system into content cards or use the Shuffle booking system in the future`
  String get CompanyPresentationSlider8 {
    return Intl.message(
      'You can integrate your booking system into content cards or use the Shuffle booking system in the future',
      name: 'CompanyPresentationSlider8',
      desc: '',
      args: [],
    );
  }

  /// `Branches`
  String get Branches {
    return Intl.message('Branches', name: 'Branches', desc: '', args: []);
  }

  /// `Restaurant`
  String get Restaurant {
    return Intl.message('Restaurant', name: 'Restaurant', desc: '', args: []);
  }

  /// `Open`
  String get Open {
    return Intl.message('Open', name: 'Open', desc: '', args: []);
  }

  /// `min`
  String get Min {
    return Intl.message('min', name: 'Min', desc: '', args: []);
  }

  /// `Tasty coffee`
  String get TastyCoffee {
    return Intl.message(
      'Tasty coffee',
      name: 'TastyCoffee',
      desc: '',
      args: [],
    );
  }

  /// `Calm atmosphere`
  String get CalmAtmosphere {
    return Intl.message(
      'Calm atmosphere',
      name: 'CalmAtmosphere',
      desc: '',
      args: [],
    );
  }

  /// `Tea list`
  String get TeaList {
    return Intl.message('Tea list', name: 'TeaList', desc: '', args: []);
  }

  /// `Great interview with the owner`
  String get GreatInterviewWithOwner {
    return Intl.message(
      'Great interview with the owner',
      name: 'GreatInterviewWithOwner',
      desc: '',
      args: [],
    );
  }

  /// `Spend it`
  String get SpendIt {
    return Intl.message('Spend it', name: 'SpendIt', desc: '', args: []);
  }

  /// `There are no reactions yet, be the first`
  String get NoReactionsMessage {
    return Intl.message(
      'There are no reactions yet, be the first',
      name: 'NoReactionsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Show the barcode at the checkout when paying`
  String get ShowTheBarcode {
    return Intl.message(
      'Show the barcode at the checkout when paying',
      name: 'ShowTheBarcode',
      desc: '',
      args: [],
    );
  }

  /// `{x} successfully activated`
  String XSuccessfullyActivated(Object x) {
    return Intl.message(
      '$x successfully activated',
      name: 'XSuccessfullyActivated',
      desc: '',
      args: [x],
    );
  }

  /// `Spent my points`
  String get SpentMyPoints {
    return Intl.message(
      'Spent my points',
      name: 'SpentMyPoints',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get Categories {
    return Intl.message('Categories', name: 'Categories', desc: '', args: []);
  }

  /// `Entertainment`
  String get Entertainment {
    return Intl.message(
      'Entertainment',
      name: 'Entertainment',
      desc: '',
      args: [],
    );
  }

  /// `Related personal properties`
  String get RelatedPersonalProperties {
    return Intl.message(
      'Related personal properties',
      name: 'RelatedPersonalProperties',
      desc: '',
      args: [],
    );
  }

  /// `Add category`
  String get AddCategory {
    return Intl.message(
      'Add category',
      name: 'AddCategory',
      desc: '',
      args: [],
    );
  }

  /// `Add property`
  String get AddProperty {
    return Intl.message(
      'Add property',
      name: 'AddProperty',
      desc: '',
      args: [],
    );
  }

  /// `Add place type`
  String get AddPlaceType {
    return Intl.message(
      'Add place type',
      name: 'AddPlaceType',
      desc: '',
      args: [],
    );
  }

  /// `{item, plural, =0{drag & and drop cards} =1{create and name stack} =2{line up stacks order} few{share your stacks} other{share your stacks}}`
  String FeedFavoritesHiwItems(num item) {
    return Intl.plural(
      item,
      zero: 'drag & and drop cards',
      one: 'create and name stack',
      two: 'line up stacks order',
      few: 'share your stacks',
      other: 'share your stacks',
      name: 'FeedFavoritesHiwItems',
      desc: '',
      args: [item],
    );
  }

  /// `сonvenient, clear and useful`
  String get ConvenientClearAndUseful {
    return Intl.message(
      'сonvenient, clear and useful',
      name: 'ConvenientClearAndUseful',
      desc: '',
      args: [],
    );
  }

  /// `Stacks are on`
  String get StacksAreOn {
    return Intl.message(
      'Stacks are on',
      name: 'StacksAreOn',
      desc: '',
      args: [],
    );
  }

  /// `Stacks and something else are available for you...`
  String get StacksAndSomethingElseAreAvailableForYou {
    return Intl.message(
      'Stacks and something else are available for you...',
      name: 'StacksAndSomethingElseAreAvailableForYou',
      desc: '',
      args: [],
    );
  }

  /// `Influencer`
  String get Influencer {
    return Intl.message('Influencer', name: 'Influencer', desc: '', args: []);
  }

  /// `Entertainment specialist`
  String get EntertainmentSpecialist {
    return Intl.message(
      'Entertainment specialist',
      name: 'EntertainmentSpecialist',
      desc: '',
      args: [],
    );
  }

  /// `Go premium`
  String get GoPremium {
    return Intl.message('Go premium', name: 'GoPremium', desc: '', args: []);
  }

  /// `GO pro`
  String get GoPro {
    return Intl.message('GO pro', name: 'GoPro', desc: '', args: []);
  }

  /// `No messages yet`
  String get NoMessagesYet {
    return Intl.message(
      'No messages yet',
      name: 'NoMessagesYet',
      desc: '',
      args: [],
    );
  }

  /// `Created on {creationDate}.\nWill be deleted on {deletionDate}`
  String ChatDeletionAndCreationMessage(
    Object creationDate,
    Object deletionDate,
  ) {
    return Intl.message(
      'Created on $creationDate.\nWill be deleted on $deletionDate',
      name: 'ChatDeletionAndCreationMessage',
      desc: '',
      args: [creationDate, deletionDate],
    );
  }

  /// `{count, plural, =0{{count} members} =1{{count} member} =2{{count} members} few{{count} members} many{{count} members} other{{count} members}}`
  String MembersCount(num count) {
    return Intl.plural(
      count,
      zero: '$count members',
      one: '$count member',
      two: '$count members',
      few: '$count members',
      many: '$count members',
      other: '$count members',
      name: 'MembersCount',
      desc: '',
      args: [count],
    );
  }

  /// `Replying to {message}`
  String ReplyingTo(Object message) {
    return Intl.message(
      'Replying to $message',
      name: 'ReplyingTo',
      desc: '',
      args: [message],
    );
  }

  /// `Invited people`
  String get InvitedPeople {
    return Intl.message(
      'Invited people',
      name: 'InvitedPeople',
      desc: '',
      args: [],
    );
  }

  /// `Plz respect your choice and others' feelings`
  String get AlreadyInvited {
    return Intl.message(
      'Plz respect your choice and others\' feelings',
      name: 'AlreadyInvited',
      desc: '',
      args: [],
    );
  }

  /// `Spend`
  String get Spend {
    return Intl.message('Spend', name: 'Spend', desc: '', args: []);
  }

  /// `Challenge Feelings`
  String get ChallengeFeelings {
    return Intl.message(
      'Challenge Feelings',
      name: 'ChallengeFeelings',
      desc: '',
      args: [],
    );
  }

  /// `{count} {count, plural, =0{Feedback} =1{Feedback} =2{Feedbacks} few{Feedbacks} many{Feedbacks} other{Feedbacks}}`
  String Feedbacks(num count) {
    return Intl.message(
      '$count ${Intl.plural(count, zero: 'Feedback', one: 'Feedback', two: 'Feedbacks', few: 'Feedbacks', many: 'Feedbacks', other: 'Feedbacks')}',
      name: 'Feedbacks',
      desc: '',
      args: [count],
    );
  }

  /// `{count} {count, plural, =0{card} =1{card} =2{cards} few{cards} many{cards} other{cards}} {count, plural, =0{shares} =1{share} =2{shares} few{shares} many{shares} other{shares}}`
  String ShareCard(num count) {
    return Intl.message(
      '$count ${Intl.plural(count, zero: 'card', one: 'card', two: 'cards', few: 'cards', many: 'cards', other: 'cards')} ${Intl.plural(count, zero: 'shares', one: 'share', two: 'shares', few: 'shares', many: 'shares', other: 'shares')}',
      name: 'ShareCard',
      desc: '',
      args: [count],
    );
  }

  /// `Login in {count} {count, plural, =0{days} =1{day} =2{days} few{days} many{days} other{days}} in a row`
  String LoginInAppDaysInARow(num count) {
    return Intl.message(
      'Login in $count ${Intl.plural(count, zero: 'days', one: 'day', two: 'days', few: 'days', many: 'days', other: 'days')} in a row',
      name: 'LoginInAppDaysInARow',
      desc: '',
      args: [count],
    );
  }

  /// `Spend {count} {count, plural, =0{hours} =1{hour} =2{hours} few{hours} many{hours} other{hours}} per week`
  String SpendHoursPerWeek(num count) {
    return Intl.message(
      'Spend $count ${Intl.plural(count, zero: 'hours', one: 'hour', two: 'hours', few: 'hours', many: 'hours', other: 'hours')} per week',
      name: 'SpendHoursPerWeek',
      desc: '',
      args: [count],
    );
  }

  /// `{count} {count, plural, =0{connects} =1{connect} =2{connect} few{connect} many{connect} other{connect}}`
  String Connects(num count) {
    return Intl.message(
      '$count ${Intl.plural(count, zero: 'connects', one: 'connect', two: 'connect', few: 'connect', many: 'connect', other: 'connect')}',
      name: 'Connects',
      desc: '',
      args: [count],
    );
  }

  /// `{count} {count, plural, =0{cards} =1{card} =2{cards} few{cards} many{cards} other{cards}} {count, plural, =0{openings} =1{opening} =2{openings} few{openings} many{openings} other{openings}}`
  String CardOpening(num count) {
    return Intl.message(
      '$count ${Intl.plural(count, zero: 'cards', one: 'card', two: 'cards', few: 'cards', many: 'cards', other: 'cards')} ${Intl.plural(count, zero: 'openings', one: 'opening', two: 'openings', few: 'openings', many: 'openings', other: 'openings')}',
      name: 'CardOpening',
      desc: '',
      args: [count],
    );
  }

  /// `Offer content`
  String get OfferContent {
    return Intl.message(
      'Offer content',
      name: 'OfferContent',
      desc: '',
      args: [],
    );
  }

  /// `{count} {count, plural, =0{bookings} =1{booking} =2{bookings} few{bookings} many{bookings} other{bookings}}`
  String Bookigns(num count) {
    return Intl.message(
      '$count ${Intl.plural(count, zero: 'bookings', one: 'booking', two: 'bookings', few: 'bookings', many: 'bookings', other: 'bookings')}',
      name: 'Bookigns',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =0{points} =1{point} =2{points} few{points} many{points} other{points}}`
  String PointsCount(num count) {
    return Intl.plural(
      count,
      zero: 'points',
      one: 'point',
      two: 'points',
      few: 'points',
      many: 'points',
      other: 'points',
      name: 'PointsCount',
      desc: '',
      args: [count],
    );
  }

  /// `{count} {count, plural, =0{Reviews} =1{Review} =2{Reviews} few{Reviews} many{Reviews} other{Reviews}}`
  String ReviewsCount(num count) {
    return Intl.message(
      '$count ${Intl.plural(count, zero: 'Reviews', one: 'Review', two: 'Reviews', few: 'Reviews', many: 'Reviews', other: 'Reviews')}',
      name: 'ReviewsCount',
      desc: '',
      args: [count],
    );
  }

  /// `Shraziid goblet`
  String get ShraziidGoblet {
    return Intl.message(
      'Shraziid goblet',
      name: 'ShraziidGoblet',
      desc: '',
      args: [],
    );
  }

  /// `An ancient goblet found in the desert sands. They say that Shraziid himself, the ruler of the great Sand Kingdom, drank from it.`
  String get ShraziidGobletDescription {
    return Intl.message(
      'An ancient goblet found in the desert sands. They say that Shraziid himself, the ruler of the great Sand Kingdom, drank from it.',
      name: 'ShraziidGobletDescription',
      desc: '',
      args: [],
    );
  }

  /// `Lucky Coin`
  String get LuckyCoin {
    return Intl.message('Lucky Coin', name: 'LuckyCoin', desc: '', args: []);
  }

  /// `As long as you have it in your inventory, good luck is with you. Twist it, turn it, touch it to be filled with the energy of good luck.`
  String get LuckyCoinDescription {
    return Intl.message(
      'As long as you have it in your inventory, good luck is with you. Twist it, turn it, touch it to be filled with the energy of good luck.',
      name: 'LuckyCoinDescription',
      desc: '',
      args: [],
    );
  }

  /// `Focus of Light`
  String get FocusOfLight {
    return Intl.message(
      'Focus of Light',
      name: 'FocusOfLight',
      desc: '',
      args: [],
    );
  }

  /// `The Light of the universe is contained here. If it gets darker in your soul, the light is with you. Look and be filled with peace.`
  String get FocusOfLightDescription {
    return Intl.message(
      'The Light of the universe is contained here. If it gets darker in your soul, the light is with you. Look and be filled with peace.',
      name: 'FocusOfLightDescription',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Ring`
  String get UnknownRing {
    return Intl.message(
      'Unknown Ring',
      name: 'UnknownRing',
      desc: '',
      args: [],
    );
  }

  /// `Strange ring. We don't know why it is here...`
  String get UnknownRingDescription {
    return Intl.message(
      'Strange ring. We don\'t know why it is here...',
      name: 'UnknownRingDescription',
      desc: '',
      args: [],
    );
  }

  /// `{count} {count, plural, =0{invites} =1{invite} =2{invites} few{invites} many{invites} other{invites}}`
  String InvitesCount(num count) {
    return Intl.message(
      '$count ${Intl.plural(count, zero: 'invites', one: 'invite', two: 'invites', few: 'invites', many: 'invites', other: 'invites')}',
      name: 'InvitesCount',
      desc: '',
      args: [count],
    );
  }

  /// `Invites`
  String get InvitesVerb {
    return Intl.message('Invites', name: 'InvitesVerb', desc: '', args: []);
  }

  /// `To`
  String get InvitesTo {
    return Intl.message('To', name: 'InvitesTo', desc: '', args: []);
  }

  /// `Sure you want to exit?`
  String get SureYouWantToExit {
    return Intl.message(
      'Sure you want to exit?',
      name: 'SureYouWantToExit',
      desc: '',
      args: [],
    );
  }

  /// `You can no longer send messages to {name}`
  String YouWillNoLongerSendMessagesTo(Object name) {
    return Intl.message(
      'You can no longer send messages to $name',
      name: 'YouWillNoLongerSendMessagesTo',
      desc: '',
      args: [name],
    );
  }

  /// `Sure you want to delete {name}?`
  String YouSureToDeleteX(Object name) {
    return Intl.message(
      'Sure you want to delete $name?',
      name: 'YouSureToDeleteX',
      desc: '',
      args: [name],
    );
  }

  /// `Message not found`
  String get MessageNotFound {
    return Intl.message(
      'Message not found',
      name: 'MessageNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Connected`
  String get Connected {
    return Intl.message('Connected', name: 'Connected', desc: '', args: []);
  }

  /// `You`
  String get You {
    return Intl.message('You', name: 'You', desc: '', args: []);
  }

  /// `{x} invites {y}`
  String XInvitesY(Object x, Object y) {
    return Intl.message(
      '$x invites $y',
      name: 'XInvitesY',
      desc: '',
      args: [x, y],
    );
  }

  /// `Invites {invitedPeopleCount, plural, =0{{invitedPeopleCount} people} =1{{invitedPeopleCount} person} =2{{invitedPeopleCount} people} few{{invitedPeopleCount} people} many{{invitedPeopleCount} people} other{{invitedPeopleCount} people}}`
  String InvitesNPeopleInfo(num invitedPeopleCount) {
    return Intl.message(
      'Invites ${Intl.plural(invitedPeopleCount, zero: '$invitedPeopleCount people', one: '$invitedPeopleCount person', two: '$invitedPeopleCount people', few: '$invitedPeopleCount people', many: '$invitedPeopleCount people', other: '$invitedPeopleCount people')}',
      name: 'InvitesNPeopleInfo',
      desc: '',
      args: [invitedPeopleCount],
    );
  }

  /// `{count} {count, plural, =0{feelings} =1{feeling} =2{feelings} few{feelings} many{feelings} other{feelings}} guesses`
  String FeelingsGuesses(num count) {
    return Intl.message(
      '$count ${Intl.plural(count, zero: 'feelings', one: 'feeling', two: 'feelings', few: 'feelings', many: 'feelings', other: 'feelings')} guesses',
      name: 'FeelingsGuesses',
      desc: '',
      args: [count],
    );
  }

  /// `{count} content {count, plural, =0{offers} =1{offer} =2{offers} few{offers} many{offers} other{offers}}`
  String ContentOffers(num count) {
    return Intl.message(
      '$count content ${Intl.plural(count, zero: 'offers', one: 'offer', two: 'offers', few: 'offers', many: 'offers', other: 'offers')}',
      name: 'ContentOffers',
      desc: '',
      args: [count],
    );
  }

  /// `{count} {count, plural, =0{reactions} =1{reaction} =2{reactions} few{reactions} many{reactions} other{reactions}}`
  String Reactions(num count) {
    return Intl.message(
      '$count ${Intl.plural(count, zero: 'reactions', one: 'reaction', two: 'reactions', few: 'reactions', many: 'reactions', other: 'reactions')}',
      name: 'Reactions',
      desc: '',
      args: [count],
    );
  }

  /// `{count} {count, plural, =0{stacks} =1{stack} =2{stacks} few{stacks} many{stacks} other{stacks}} {count, plural, =0{shares} =1{share} =2{shares} few{shares} many{shares} other{shares}}`
  String StacksShares(num count) {
    return Intl.message(
      '$count ${Intl.plural(count, zero: 'stacks', one: 'stack', two: 'stacks', few: 'stacks', many: 'stacks', other: 'stacks')} ${Intl.plural(count, zero: 'shares', one: 'share', two: 'shares', few: 'shares', many: 'shares', other: 'shares')}',
      name: 'StacksShares',
      desc: '',
      args: [count],
    );
  }

  /// `Wiseacre of sands`
  String get WiseacreOfSands {
    return Intl.message(
      'Wiseacre of sands',
      name: 'WiseacreOfSands',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't find invite`
  String get CouldntFindInvite {
    return Intl.message(
      'Couldn\'t find invite',
      name: 'CouldntFindInvite',
      desc: '',
      args: [],
    );
  }

  /// `Wiseacre lady of sands`
  String get WiseacreLadyOfSands {
    return Intl.message(
      'Wiseacre lady of sands',
      name: 'WiseacreLadyOfSands',
      desc: '',
      args: [],
    );
  }

  /// `Moderated`
  String get Moderated {
    return Intl.message('Moderated', name: 'Moderated', desc: '', args: []);
  }

  /// `To plan`
  String get ToPlan {
    return Intl.message('To plan', name: 'ToPlan', desc: '', args: []);
  }

  /// `Share`
  String get Share {
    return Intl.message('Share', name: 'Share', desc: '', args: []);
  }

  /// `Rename`
  String get Rename {
    return Intl.message('Rename', name: 'Rename', desc: '', args: []);
  }

  /// `Delete`
  String get Delete {
    return Intl.message('Delete', name: 'Delete', desc: '', args: []);
  }

  /// `Sure you want to delete stack?`
  String get DeleteFolderAlert {
    return Intl.message(
      'Sure you want to delete stack?',
      name: 'DeleteFolderAlert',
      desc: '',
      args: [],
    );
  }

  /// `Seeking wanderer`
  String get SeekingWandererMen {
    return Intl.message(
      'Seeking wanderer',
      name: 'SeekingWandererMen',
      desc: '',
      args: [],
    );
  }

  /// `Seeking wanderer`
  String get SeekingWandererWom {
    return Intl.message(
      'Seeking wanderer',
      name: 'SeekingWandererWom',
      desc: '',
      args: [],
    );
  }

  /// `Traveler`
  String get TravelerMen {
    return Intl.message('Traveler', name: 'TravelerMen', desc: '', args: []);
  }

  /// `Global`
  String get Global {
    return Intl.message('Global', name: 'Global', desc: '', args: []);
  }

  /// `Only published can be made global`
  String get GlobalAlertText {
    return Intl.message(
      'Only published can be made global',
      name: 'GlobalAlertText',
      desc: '',
      args: [],
    );
  }

  /// `Traveler`
  String get TravelerWom {
    return Intl.message('Traveler', name: 'TravelerWom', desc: '', args: []);
  }

  /// `View sources`
  String get ViewSources {
    return Intl.message(
      'View sources',
      name: 'ViewSources',
      desc: '',
      args: [],
    );
  }

  /// `Upsales available`
  String get UpsalesAvailable {
    return Intl.message(
      'Upsales available',
      name: 'UpsalesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `t-shirt, hat,yoga mat, mug`
  String get UpsalesAvailableHint {
    return Intl.message(
      't-shirt, hat,yoga mat, mug',
      name: 'UpsalesAvailableHint',
      desc: '',
      args: [],
    );
  }

  /// `Upsales`
  String get Upsales {
    return Intl.message('Upsales', name: 'Upsales', desc: '', args: []);
  }

  /// `{years} {years, plural, =0{y.o.} =1{y.o.} =2{y.o.} few{y.o.} many{y.o.} other{y.o.}}`
  String YearsOld(num years) {
    return Intl.message(
      '$years ${Intl.plural(years, zero: 'y.o.', one: 'y.o.', two: 'y.o.', few: 'y.o.', many: 'y.o.', other: 'y.o.')}',
      name: 'YearsOld',
      desc: '',
      args: [years],
    );
  }

  /// `{from} - {to} {from, plural, =0{y.o.} =1{y.o.} =2{y.o.} few{y.o.} many{y.o.} other{y.o.}}`
  String FromToYearsOld(num from, Object to) {
    return Intl.message(
      '$from - $to ${Intl.plural(from, zero: 'y.o.', one: 'y.o.', two: 'y.o.', few: 'y.o.', many: 'y.o.', other: 'y.o.')}',
      name: 'FromToYearsOld',
      desc: '',
      args: [from, to],
    );
  }

  /// `{years}+ {years, plural, =0{y.o.} =1{y.o.} =2{y.o.} few{y.o.} many{y.o.} other{y.o.}}`
  String XYearsPlus(num years) {
    return Intl.message(
      '$years+ ${Intl.plural(years, zero: 'y.o.', one: 'y.o.', two: 'y.o.', few: 'y.o.', many: 'y.o.', other: 'y.o.')}',
      name: 'XYearsPlus',
      desc: '',
      args: [years],
    );
  }

  /// `Age`
  String get Age {
    return Intl.message('Age', name: 'Age', desc: '', args: []);
  }

  /// `Interests`
  String get Interests {
    return Intl.message('Interests', name: 'Interests', desc: '', args: []);
  }

  /// `Unique statistics`
  String get UniqueStatistics {
    return Intl.message(
      'Unique statistics',
      name: 'UniqueStatistics',
      desc: '',
      args: [],
    );
  }

  /// `Portrait of the most active segment`
  String get MostActiveAgeSegment {
    return Intl.message(
      'Portrait of the most active segment',
      name: 'MostActiveAgeSegment',
      desc: '',
      args: [],
    );
  }

  /// `Top events for {date}`
  String TopEventsFor(Object date) {
    return Intl.message(
      'Top events for $date',
      name: 'TopEventsFor',
      desc: '',
      args: [date],
    );
  }

  /// `Statistics`
  String get Statistics {
    return Intl.message('Statistics', name: 'Statistics', desc: '', args: []);
  }

  /// `Select your booking`
  String get SelectYourBooking {
    return Intl.message(
      'Select your booking',
      name: 'SelectYourBooking',
      desc: '',
      args: [],
    );
  }

  /// `Enter external link`
  String get EnterExternalLink {
    return Intl.message(
      'Enter external link',
      name: 'EnterExternalLink',
      desc: '',
      args: [],
    );
  }

  /// `Start booking creation`
  String get StartBookingCreation {
    return Intl.message(
      'Start booking creation',
      name: 'StartBookingCreation',
      desc: '',
      args: [],
    );
  }

  /// `Add link`
  String get AddLink {
    return Intl.message('Add link', name: 'AddLink', desc: '', args: []);
  }

  /// `Create booking`
  String get CreateBooking {
    return Intl.message(
      'Create booking',
      name: 'CreateBooking',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get GeneralMas {
    return Intl.message('General', name: 'GeneralMas', desc: '', args: []);
  }

  /// `General`
  String get GeneraFem {
    return Intl.message('General', name: 'GeneraFem', desc: '', args: []);
  }

  /// `Organic`
  String get OrganicStatistics {
    return Intl.message(
      'Organic',
      name: 'OrganicStatistics',
      desc: '',
      args: [],
    );
  }

  /// `Promo`
  String get Promotion {
    return Intl.message('Promo', name: 'Promotion', desc: '', args: []);
  }

  /// `User`
  String get UserHasNoPublicProfileStart {
    return Intl.message(
      'User',
      name: 'UserHasNoPublicProfileStart',
      desc: '',
      args: [],
    );
  }

  /// `doesn't have public profile`
  String get UserHasNoPublicProfileEnd {
    return Intl.message(
      'doesn\'t have public profile',
      name: 'UserHasNoPublicProfileEnd',
      desc: '',
      args: [],
    );
  }

  /// `Download PDF`
  String get DownloadPdf {
    return Intl.message(
      'Download PDF',
      name: 'DownloadPdf',
      desc: '',
      args: [],
    );
  }

  /// `Create free reminder for your clients`
  String get CreateReminderDescription {
    return Intl.message(
      'Create free reminder for your clients',
      name: 'CreateReminderDescription',
      desc: '',
      args: [],
    );
  }

  /// `Reminder`
  String get Reminder {
    return Intl.message('Reminder', name: 'Reminder', desc: '', args: []);
  }

  /// `You have already created one reminder. To create a new one, pause or remove the previous one.`
  String get AlreadyHaveActiveReminder {
    return Intl.message(
      'You have already created one reminder. To create a new one, pause or remove the previous one.',
      name: 'AlreadyHaveActiveReminder',
      desc: '',
      args: [],
    );
  }

  /// `Limit`
  String get Limit {
    return Intl.message('Limit', name: 'Limit', desc: '', args: []);
  }

  /// `Booking`
  String get Booking {
    return Intl.message('Booking', name: 'Booking', desc: '', args: []);
  }

  /// `Booking Limit`
  String get BookingLimit {
    return Intl.message(
      'Booking Limit',
      name: 'BookingLimit',
      desc: '',
      args: [],
    );
  }

  /// `Booking Limit per one`
  String get BookingLimitPerOne {
    return Intl.message(
      'Booking Limit per one',
      name: 'BookingLimitPerOne',
      desc: '',
      args: [],
    );
  }

  /// `Create subs`
  String get CreateSubs {
    return Intl.message('Create subs', name: 'CreateSubs', desc: '', args: []);
  }

  /// `Create upsales`
  String get CreateUpsales {
    return Intl.message(
      'Create upsales',
      name: 'CreateUpsales',
      desc: '',
      args: [],
    );
  }

  /// `Subs`
  String get Subs {
    return Intl.message('Subs', name: 'Subs', desc: '', args: []);
  }

  /// `Please enter a valid title`
  String get PleaseEnterValidTitle {
    return Intl.message(
      'Please enter a valid title',
      name: 'PleaseEnterValidTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please add photo`
  String get PleaseAddPhoto {
    return Intl.message(
      'Please add photo',
      name: 'PleaseAddPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Latest`
  String get Latest {
    return Intl.message('Latest', name: 'Latest', desc: '', args: []);
  }

  /// `Unread`
  String get Unread {
    return Intl.message('Unread', name: 'Unread', desc: '', args: []);
  }

  /// `{count, plural, =0{+{count} video-reactions} =1{+{count} video-reaction} =2{+{count} video-reactions} few{+{count} video-reactions} many{+{count} video-reactions} other{+{count} video-reactions}}`
  String PlusXNewVideoReactions(num count) {
    return Intl.plural(
      count,
      zero: '+$count video-reactions',
      one: '+$count video-reaction',
      two: '+$count video-reactions',
      few: '+$count video-reactions',
      many: '+$count video-reactions',
      other: '+$count video-reactions',
      name: 'PlusXNewVideoReactions',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =0{+{count} New reviews} =1{+{count} New review} =2{+{count} New reviews} few{+{count} New reviews} many{+{count} New reviews} other{+{count} New reviews}}`
  String PlusXNewReviews(num count) {
    return Intl.plural(
      count,
      zero: '+$count New reviews',
      one: '+$count New review',
      two: '+$count New reviews',
      few: '+$count New reviews',
      many: '+$count New reviews',
      other: '+$count New reviews',
      name: 'PlusXNewReviews',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =0{+{count} New voices} =1{+{count} New voice} =2{+{count} New voices} few{+{count} New voices} many{+{count} New voices} other{+{count} New voices}}`
  String PlusXNewVoices(num count) {
    return Intl.plural(
      count,
      zero: '+$count New voices',
      one: '+$count New voice',
      two: '+$count New voices',
      few: '+$count New voices',
      many: '+$count New voices',
      other: '+$count New voices',
      name: 'PlusXNewVoices',
      desc: '',
      args: [count],
    );
  }

  /// `+ New video`
  String get PlusXNewVideos {
    return Intl.message(
      '+ New video',
      name: 'PlusXNewVideos',
      desc: '',
      args: [],
    );
  }

  /// `+ New route`
  String get PlusXNewRoutes {
    return Intl.message(
      '+ New route',
      name: 'PlusXNewRoutes',
      desc: '',
      args: [],
    );
  }

  /// `+ New interview`
  String get PlusXNewInterviews {
    return Intl.message(
      '+ New interview',
      name: 'PlusXNewInterviews',
      desc: '',
      args: [],
    );
  }

  /// `+ New assignment`
  String get PlusXNewContests {
    return Intl.message(
      '+ New assignment',
      name: 'PlusXNewContests',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =0{+{count} comments} =1{+{count} comment} =2{+{count} comments} few{+{count} comments} many{+{count} comments} other{+{count} comments}}`
  String PlusXNewChatComments(num count) {
    return Intl.plural(
      count,
      zero: '+$count comments',
      one: '+$count comment',
      two: '+$count comments',
      few: '+$count comments',
      many: '+$count comments',
      other: '+$count comments',
      name: 'PlusXNewChatComments',
      desc: '',
      args: [count],
    );
  }

  /// `{count, plural, =0{+{count} Photos} =1{+{count} Photo} =2{+{count} Photos} few{+{count} Photos} many{+{count} Photos} other{+{count} Photos}}`
  String PlusXPhotos(num count) {
    return Intl.plural(
      count,
      zero: '+$count Photos',
      one: '+$count Photo',
      two: '+$count Photos',
      few: '+$count Photos',
      many: '+$count Photos',
      other: '+$count Photos',
      name: 'PlusXPhotos',
      desc: '',
      args: [count],
    );
  }

  /// `Don't live alone, subscribe to people you like`
  String get DontLiveAlone {
    return Intl.message(
      'Don\'t live alone, subscribe to people you like',
      name: 'DontLiveAlone',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a description`
  String get PleaseEnterValidDescription {
    return Intl.message(
      'Please enter a description',
      name: 'PleaseEnterValidDescription',
      desc: '',
      args: [],
    );
  }

  /// `Booking list`
  String get BookingList {
    return Intl.message(
      'Booking list',
      name: 'BookingList',
      desc: '',
      args: [],
    );
  }

  /// `{count} {count, plural, =0{tickets} =1{ticket} =2{tickets} few{tickets} many{tickets} other{tickets}}`
  String Tickets(num count) {
    return Intl.message(
      '$count ${Intl.plural(count, zero: 'tickets', one: 'ticket', two: 'tickets', few: 'tickets', many: 'tickets', other: 'tickets')}',
      name: 'Tickets',
      desc: '',
      args: [count],
    );
  }

  /// `{count} {count, plural, =0{product} =1{products} =2{products} few{products} many{products} other{products}}`
  String Products(num count) {
    return Intl.message(
      '$count ${Intl.plural(count, zero: 'product', one: 'products', two: 'products', few: 'products', many: 'products', other: 'products')}',
      name: 'Products',
      desc: '',
      args: [count],
    );
  }

  /// `Full refund`
  String get FullRefund {
    return Intl.message('Full refund', name: 'FullRefund', desc: '', args: []);
  }

  /// `Partial refund`
  String get PartialRefund {
    return Intl.message(
      'Partial refund',
      name: 'PartialRefund',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get Contact {
    return Intl.message('Contact', name: 'Contact', desc: '', args: []);
  }

  /// `Contact`
  String get ContactWith {
    return Intl.message('Contact', name: 'ContactWith', desc: '', args: []);
  }

  /// `by message`
  String get ByMessage {
    return Intl.message('by message', name: 'ByMessage', desc: '', args: []);
  }

  /// `by e-mail`
  String get ByEmail {
    return Intl.message('by e-mail', name: 'ByEmail', desc: '', args: []);
  }

  /// `Refund everyone`
  String get RefundEveryone {
    return Intl.message(
      'Refund everyone',
      name: 'RefundEveryone',
      desc: '',
      args: [],
    );
  }

  /// `requests`
  String get Requests {
    return Intl.message('requests', name: 'Requests', desc: '', args: []);
  }

  /// `full`
  String get Full {
    return Intl.message('full', name: 'Full', desc: '', args: []);
  }

  /// `partial`
  String get Partial {
    return Intl.message('partial', name: 'Partial', desc: '', args: []);
  }

  /// `refund`
  String get Refund {
    return Intl.message('refund', name: 'Refund', desc: '', args: []);
  }

  /// `{count} {count, plural, =0{tickets} =1{ticket} =2{tickets} few{tickets} many{tickets} other{tickets}} form`
  String TicketFrom(num count) {
    return Intl.message(
      '$count ${Intl.plural(count, zero: 'tickets', one: 'ticket', two: 'tickets', few: 'tickets', many: 'tickets', other: 'tickets')} form',
      name: 'TicketFrom',
      desc: '',
      args: [count],
    );
  }

  /// `{count} upsales {count, plural, =0{product} =1{products} =2{products} few{products} many{products} other{products}} from`
  String UpsalesProductsFrom(num count) {
    return Intl.message(
      '$count upsales ${Intl.plural(count, zero: 'product', one: 'products', two: 'products', few: 'products', many: 'products', other: 'products')} from',
      name: 'UpsalesProductsFrom',
      desc: '',
      args: [count],
    );
  }

  /// `Go ahead`
  String get GoAhead {
    return Intl.message('Go ahead', name: 'GoAhead', desc: '', args: []);
  }

  /// `Please enter limit`
  String get PleaseEnterLimit {
    return Intl.message(
      'Please enter limit',
      name: 'PleaseEnterLimit',
      desc: '',
      args: [],
    );
  }

  /// `Please enter current limit`
  String get PleaseEnterCurrentLimit {
    return Intl.message(
      'Please enter current limit',
      name: 'PleaseEnterCurrentLimit',
      desc: '',
      args: [],
    );
  }

  /// `Limit for one must be less than total limit`
  String get LimitLessTotalLimit {
    return Intl.message(
      'Limit for one must be less than total limit',
      name: 'LimitLessTotalLimit',
      desc: '',
      args: [],
    );
  }

  /// `Limit less than sum of limits for subs`
  String get LimitLessSumLimitsSubs {
    return Intl.message(
      'Limit less than sum of limits for subs',
      name: 'LimitLessSumLimitsSubs',
      desc: '',
      args: [],
    );
  }

  /// `My booking`
  String get MyBooking {
    return Intl.message('My booking', name: 'MyBooking', desc: '', args: []);
  }

  /// `Upcoming`
  String get Upcoming {
    return Intl.message('Upcoming', name: 'Upcoming', desc: '', args: []);
  }

  /// `Past`
  String get Past {
    return Intl.message('Past', name: 'Past', desc: '', args: []);
  }

  /// `Ticket`
  String get Ticket {
    return Intl.message('Ticket', name: 'Ticket', desc: '', args: []);
  }

  /// `Product`
  String get Product {
    return Intl.message('Product', name: 'Product', desc: '', args: []);
  }

  /// `Total`
  String get Total {
    return Intl.message('Total', name: 'Total', desc: '', args: []);
  }

  /// `You can still request a refund on your complaint`
  String get YouCanStillRequestRefundYourComplaint {
    return Intl.message(
      'You can still request a refund on your complaint',
      name: 'YouCanStillRequestRefundYourComplaint',
      desc: '',
      args: [],
    );
  }

  /// `Leave feedback`
  String get LeaveFeedback {
    return Intl.message(
      'Leave feedback',
      name: 'LeaveFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Points are...`
  String get PointsAre {
    return Intl.message('Points are...', name: 'PointsAre', desc: '', args: []);
  }

  /// `{item, plural, =0{reputation and currency} =1{increase rating or spend} =2{perform actions} few{earn points} other{earn points}}`
  String PointsHiwItems(num item) {
    return Intl.plural(
      item,
      zero: 'reputation and currency',
      one: 'increase rating or spend',
      two: 'perform actions',
      few: 'earn points',
      other: 'earn points',
      name: 'PointsHiwItems',
      desc: '',
      args: [item],
    );
  }

  /// `...Shuffle exchange system`
  String get ShuffleExchangeSystem {
    return Intl.message(
      '...Shuffle exchange system',
      name: 'ShuffleExchangeSystem',
      desc: '',
      args: [],
    );
  }

  /// `No bookings yet`
  String get NoBookingsYet {
    return Intl.message(
      'No bookings yet',
      name: 'NoBookingsYet',
      desc: '',
      args: [],
    );
  }

  /// `Login with email`
  String get LogInWithEmail {
    return Intl.message(
      'Login with email',
      name: 'LogInWithEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter {title}`
  String EnterX(Object title) {
    return Intl.message(
      'Enter $title',
      name: 'EnterX',
      desc: '',
      args: [title],
    );
  }

  /// `Show in content card`
  String get ShowInContentCard {
    return Intl.message(
      'Show in content card',
      name: 'ShowInContentCard',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =0{+{count} respects} =1{+{count} respect} =2{+{count} respects} few{+{count} respects} many{+{count} respects} other{+{count} respects}}`
  String PlusXNewRespects(num count) {
    return Intl.plural(
      count,
      zero: '+$count respects',
      one: '+$count respect',
      two: '+$count respects',
      few: '+$count respects',
      many: '+$count respects',
      other: '+$count respects',
      name: 'PlusXNewRespects',
      desc: '',
      args: [count],
    );
  }

  /// `Supported formats: JPEG/JPG/PNG.\nMax size - 10 MB.\nMax resolution - 3840 x 2200 px`
  String get SupportedFormatsBooking {
    return Intl.message(
      'Supported formats: JPEG/JPG/PNG.\nMax size - 10 MB.\nMax resolution - 3840 x 2200 px',
      name: 'SupportedFormatsBooking',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get LogIn {
    return Intl.message('Log in', name: 'LogIn', desc: '', args: []);
  }

  /// `Locked`
  String get Locked {
    return Intl.message('Locked', name: 'Locked', desc: '', args: []);
  }

  /// `Log in`
  String get LogInTo {
    return Intl.message('Log in', name: 'LogInTo', desc: '', args: []);
  }

  /// `To unlock`
  String get ToUnlock {
    return Intl.message('To unlock', name: 'ToUnlock', desc: '', args: []);
  }

  /// `To open`
  String get ToOpen {
    return Intl.message('To open', name: 'ToOpen', desc: '', args: []);
  }

  /// `{count, plural, =0{leasure & business events & places} =1{locked sections & functions} =2{points, rewards & money} few{invites, chats, hang outs} other{Premium, PRO & organisation, Influencer accounts (use & create content)}}`
  String LoginBenefits(num count) {
    return Intl.plural(
      count,
      zero: 'leasure & business events & places',
      one: 'locked sections & functions',
      two: 'points, rewards & money',
      few: 'invites, chats, hang outs',
      other:
          'Premium, PRO & organisation, Influencer accounts (use & create content)',
      name: 'LoginBenefits',
      desc: '',
      args: [count],
    );
  }

  /// `If your subscription is terminated, your content will be removed from rotation until your subscription is renewed`
  String get PlaceCompanyInfo {
    return Intl.message(
      'If your subscription is terminated, your content will be removed from rotation until your subscription is renewed',
      name: 'PlaceCompanyInfo',
      desc: '',
      args: [],
    );
  }

  /// `Select subs`
  String get SelectSubs {
    return Intl.message('Select subs', name: 'SelectSubs', desc: '', args: []);
  }

  /// `Ticket price`
  String get TicketPrice {
    return Intl.message(
      'Ticket price',
      name: 'TicketPrice',
      desc: '',
      args: [],
    );
  }

  /// `Select your favorite product`
  String get SelectYourFavoriteProduct {
    return Intl.message(
      'Select your favorite product',
      name: 'SelectYourFavoriteProduct',
      desc: '',
      args: [],
    );
  }

  /// `Go to payment`
  String get GoToPayment {
    return Intl.message(
      'Go to payment',
      name: 'GoToPayment',
      desc: '',
      args: [],
    );
  }

  /// `Select date and time`
  String get SelectDateTime {
    return Intl.message(
      'Select date and time',
      name: 'SelectDateTime',
      desc: '',
      args: [],
    );
  }

  /// `Schedule`
  String get Schedule {
    return Intl.message('Schedule', name: 'Schedule', desc: '', args: []);
  }

  /// `Sure you want to delete chat?`
  String get SureYouWantToDeleteChat {
    return Intl.message(
      'Sure you want to delete chat?',
      name: 'SureYouWantToDeleteChat',
      desc: '',
      args: [],
    );
  }

  /// `You can no longer send messages to chat`
  String get YouWillNoLongerSendMessagesToChat {
    return Intl.message(
      'You can no longer send messages to chat',
      name: 'YouWillNoLongerSendMessagesToChat',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get Offers {
    return Intl.message('Offers', name: 'Offers', desc: '', args: []);
  }

  /// `Create a new {x} for your {y} and increase attendance`
  String CreateNewXForYourY(Object x, Object y) {
    return Intl.message(
      'Create a new $x for your $y and increase attendance',
      name: 'CreateNewXForYourY',
      desc: '',
      args: [x, y],
    );
  }

  /// `Personalize your offer`
  String get PersonalizeYourOffer {
    return Intl.message(
      'Personalize your offer',
      name: 'PersonalizeYourOffer',
      desc: '',
      args: [],
    );
  }

  /// `By default, your offer will display an image from the uploaded photos`
  String get ByDefaultYourOfferWillDisplay {
    return Intl.message(
      'By default, your offer will display an image from the uploaded photos',
      name: 'ByDefaultYourOfferWillDisplay',
      desc: '',
      args: [],
    );
  }

  /// `Notify the audience`
  String get NotifyTheAudience {
    return Intl.message(
      'Notify the audience',
      name: 'NotifyTheAudience',
      desc: '',
      args: [],
    );
  }

  /// `The offer will be added to the personal profile of users who view your content or make a booking`
  String get TheOfferWillBeAddedToPersonal {
    return Intl.message(
      'The offer will be added to the personal profile of users who view your content or make a booking',
      name: 'TheOfferWillBeAddedToPersonal',
      desc: '',
      args: [],
    );
  }

  /// `Your offer will be shown 1 time and included in the list of offers of your audience. It will disappear after the end of the event.`
  String get YourOfferWillShown1Time {
    return Intl.message(
      'Your offer will be shown 1 time and included in the list of offers of your audience. It will disappear after the end of the event.',
      name: 'YourOfferWillShown1Time',
      desc: '',
      args: [],
    );
  }

  /// `Offer price {count}$`
  String OfferPrice(Object count) {
    return Intl.message(
      'Offer price $count\$',
      name: 'OfferPrice',
      desc: '',
      args: [count],
    );
  }

  /// `Save and pay`
  String get SaveAndPay {
    return Intl.message('Save and pay', name: 'SaveAndPay', desc: '', args: []);
  }

  /// `Pay for the bonus offer`
  String get PayForTheBonusOffer {
    return Intl.message(
      'Pay for the bonus offer',
      name: 'PayForTheBonusOffer',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get Pay {
    return Intl.message('Pay', name: 'Pay', desc: '', args: []);
  }

  /// `{x} successfully created`
  String XSuccessfullyCreated(Object x) {
    return Intl.message(
      '$x successfully created',
      name: 'XSuccessfullyCreated',
      desc: '',
      args: [x],
    );
  }

  /// `You can see your {x} in the promotion menu`
  String YouCanSeeYourXPromotionMenu(Object x) {
    return Intl.message(
      'You can see your $x in the promotion menu',
      name: 'YouCanSeeYourXPromotionMenu',
      desc: '',
      args: [x],
    );
  }

  /// `Offer`
  String get Offer {
    return Intl.message('Offer', name: 'Offer', desc: '', args: []);
  }

  /// `Select period of valid`
  String get SelectPeriodOfValid {
    return Intl.message(
      'Select period of valid',
      name: 'SelectPeriodOfValid',
      desc: '',
      args: [],
    );
  }

  /// `Please add a date period`
  String get PleaseAddDatePeriod {
    return Intl.message(
      'Please add a date period',
      name: 'PleaseAddDatePeriod',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get Remove {
    return Intl.message('Remove', name: 'Remove', desc: '', args: []);
  }

  /// `Launched`
  String get Launched {
    return Intl.message('Launched', name: 'Launched', desc: '', args: []);
  }

  /// `Expired`
  String get Expired {
    return Intl.message('Expired', name: 'Expired', desc: '', args: []);
  }

  /// `{count, plural, =0{Points} =1{Point} =2{Points} few{Points} many{Points} other{Points}} `
  String PointsInOffer(num count) {
    return Intl.message(
      '${Intl.plural(count, zero: 'Points', one: 'Point', two: 'Points', few: 'Points', many: 'Points', other: 'Points')} ',
      name: 'PointsInOffer',
      desc: '',
      args: [count],
    );
  }

  /// `Offer has already been published to your audience, by changing or deleting it, you are responsible for the potential negative reaction.`
  String get YourOfferHasAlreadyBeenPublishedToYourAudience {
    return Intl.message(
      'Offer has already been published to your audience, by changing or deleting it, you are responsible for the potential negative reaction.',
      name: 'YourOfferHasAlreadyBeenPublishedToYourAudience',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get Notification {
    return Intl.message(
      'Notification',
      name: 'Notification',
      desc: '',
      args: [],
    );
  }

  /// `Your notification will be shown 3 times a week during the specified period of valid, no more than 1 show per person.`
  String get YourNotificationWillBeShown {
    return Intl.message(
      'Your notification will be shown 3 times a week during the specified period of valid, no more than 1 show per person.',
      name: 'YourNotificationWillBeShown',
      desc: '',
      args: [],
    );
  }

  /// `Notification text`
  String get NotificationText {
    return Intl.message(
      'Notification text',
      name: 'NotificationText',
      desc: '',
      args: [],
    );
  }

  /// `Pay for the notification`
  String get PayForTheNotification {
    return Intl.message(
      'Pay for the notification',
      name: 'PayForTheNotification',
      desc: '',
      args: [],
    );
  }

  /// `To favorites`
  String get ToFavorites {
    return Intl.message(
      'To favorites',
      name: 'ToFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Open place`
  String get OpenPlace {
    return Intl.message('Open place', name: 'OpenPlace', desc: '', args: []);
  }

  /// `Skip it`
  String get SkipIt {
    return Intl.message('Skip it', name: 'SkipIt', desc: '', args: []);
  }

  /// `Paused`
  String get Paused {
    return Intl.message('Paused', name: 'Paused', desc: '', args: []);
  }

  /// `Reminders`
  String get Reminders {
    return Intl.message('Reminders', name: 'Reminders', desc: '', args: []);
  }

  /// `Your event`
  String get YourEvent {
    return Intl.message('Your event', name: 'YourEvent', desc: '', args: []);
  }

  /// `Personalize your reminder`
  String get PersonalizeYourReminder {
    return Intl.message(
      'Personalize your reminder',
      name: 'PersonalizeYourReminder',
      desc: '',
      args: [],
    );
  }

  /// `By default, your reminder will display an image from the uploaded photos`
  String get ByDefaultYourReminderWillDisplay {
    return Intl.message(
      'By default, your reminder will display an image from the uploaded photos',
      name: 'ByDefaultYourReminderWillDisplay',
      desc: '',
      args: [],
    );
  }

  /// `Your reminder is shown 1 time on the specified date.`
  String get YourReminderShown1TimeOnTheSpecifiedDate {
    return Intl.message(
      'Your reminder is shown 1 time on the specified date.',
      name: 'YourReminderShown1TimeOnTheSpecifiedDate',
      desc: '',
      args: [],
    );
  }

  /// `Oh yeah, sure!`
  String get OhYeahSure {
    return Intl.message(
      'Oh yeah, sure!',
      name: 'OhYeahSure',
      desc: '',
      args: [],
    );
  }

  /// `Your reminder is shown 1 time on the specified date. Maximum – 3 attempts.`
  String get YourReminderIsShown1TimeMax3 {
    return Intl.message(
      'Your reminder is shown 1 time on the specified date. Maximum – 3 attempts.',
      name: 'YourReminderIsShown1TimeMax3',
      desc: '',
      args: [],
    );
  }

  /// `Bookings and Favorites`
  String get BookingsAndFavorites {
    return Intl.message(
      'Bookings and Favorites',
      name: 'BookingsAndFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Invitations`
  String get Invitations {
    return Intl.message('Invitations', name: 'Invitations', desc: '', args: []);
  }

  /// `Your reminder is shown 1 time on the specified date.`
  String get YourReminderIsShown1Time {
    return Intl.message(
      'Your reminder is shown 1 time on the specified date.',
      name: 'YourReminderIsShown1Time',
      desc: '',
      args: [],
    );
  }

  /// `To extend your use, select payment`
  String get ToExtendYourUseSelectPayment {
    return Intl.message(
      'To extend your use, select payment',
      name: 'ToExtendYourUseSelectPayment',
      desc: '',
      args: [],
    );
  }

  /// `upgrade for free`
  String get UpgradeForFree {
    return Intl.message(
      'upgrade for free',
      name: 'UpgradeForFree',
      desc: '',
      args: [],
    );
  }

  /// `Feedbacks`
  String get FeedbackPluralNoNumber {
    return Intl.message(
      'Feedbacks',
      name: 'FeedbackPluralNoNumber',
      desc: '',
      args: [],
    );
  }

  /// `Create a USP for ${count}`
  String CreateAUSP(Object count) {
    return Intl.message(
      'Create a USP for \$$count',
      name: 'CreateAUSP',
      desc: '',
      args: [count],
    );
  }

  /// `Remains to create`
  String get RemainsToCreate {
    return Intl.message(
      'Remains to create',
      name: 'RemainsToCreate',
      desc: '',
      args: [],
    );
  }

  /// `Save template`
  String get SaveTemplate {
    return Intl.message(
      'Save template',
      name: 'SaveTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Template name`
  String get TemplateName {
    return Intl.message(
      'Template name',
      name: 'TemplateName',
      desc: '',
      args: [],
    );
  }

  /// `End time could not be before start time`
  String get TimeRangeError {
    return Intl.message(
      'End time could not be before start time',
      name: 'TimeRangeError',
      desc: '',
      args: [],
    );
  }

  /// `Select a starting time`
  String get SelectStartTime {
    return Intl.message(
      'Select a starting time',
      name: 'SelectStartTime',
      desc: '',
      args: [],
    );
  }

  /// `Select an ending time`
  String get SelectEndTime {
    return Intl.message(
      'Select an ending time',
      name: 'SelectEndTime',
      desc: '',
      args: [],
    );
  }

  /// `No end time`
  String get NoEndTime {
    return Intl.message('No end time', name: 'NoEndTime', desc: '', args: []);
  }

  /// `Coverage`
  String get Coverage {
    return Intl.message('Coverage', name: 'Coverage', desc: '', args: []);
  }

  /// `Audience`
  String get Audience {
    return Intl.message('Audience', name: 'Audience', desc: '', args: []);
  }

  /// `Views`
  String get Views {
    return Intl.message('Views', name: 'Views', desc: '', args: []);
  }

  /// `Visitors`
  String get Visitors {
    return Intl.message('Visitors', name: 'Visitors', desc: '', args: []);
  }

  /// `Budget {sum}{currency}`
  String Budget(Object sum, Object currency) {
    return Intl.message(
      'Budget $sum$currency',
      name: 'Budget',
      desc: '',
      args: [sum, currency],
    );
  }

  /// `Organic`
  String get Organic {
    return Intl.message('Organic', name: 'Organic', desc: '', args: []);
  }

  /// `Add Image`
  String get AddImage {
    return Intl.message('Add Image', name: 'AddImage', desc: '', args: []);
  }

  /// `Cover`
  String get Cover {
    return Intl.message('Cover', name: 'Cover', desc: '', args: []);
  }

  /// `Horizontal format`
  String get HorizontalFormat {
    return Intl.message(
      'Horizontal format',
      name: 'HorizontalFormat',
      desc: '',
      args: [],
    );
  }

  /// `Vertical format`
  String get VerticalFormat {
    return Intl.message(
      'Vertical format',
      name: 'VerticalFormat',
      desc: '',
      args: [],
    );
  }

  /// `Add photo`
  String get AddPhotoHere {
    return Intl.message('Add photo', name: 'AddPhotoHere', desc: '', args: []);
  }

  /// `From gallery`
  String get FromGallery {
    return Intl.message(
      'From gallery',
      name: 'FromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Select a photo to set preview`
  String get SelectToSetPreview {
    return Intl.message(
      'Select a photo to set preview',
      name: 'SelectToSetPreview',
      desc: '',
      args: [],
    );
  }

  /// `Crop to vertical`
  String get CropVertical {
    return Intl.message(
      'Crop to vertical',
      name: 'CropVertical',
      desc: '',
      args: [],
    );
  }

  /// `Crop to horizontal`
  String get CropHorizontal {
    return Intl.message(
      'Crop to horizontal',
      name: 'CropHorizontal',
      desc: '',
      args: [],
    );
  }

  /// `There are no places yet`
  String get ThereNoPlacesYet {
    return Intl.message(
      'There are no places yet',
      name: 'ThereNoPlacesYet',
      desc: '',
      args: [],
    );
  }

  /// `There are no events yet`
  String get ThereNoEventsYet {
    return Intl.message(
      'There are no events yet',
      name: 'ThereNoEventsYet',
      desc: '',
      args: [],
    );
  }

  /// `Select the time corresponding to the content card`
  String get SelectTimeCorrespondingToContentCard {
    return Intl.message(
      'Select the time corresponding to the content card',
      name: 'SelectTimeCorrespondingToContentCard',
      desc: '',
      args: [],
    );
  }

  /// `Bookings`
  String get BookingPlural {
    return Intl.message('Bookings', name: 'BookingPlural', desc: '', args: []);
  }

  /// `Average card visit time`
  String get AverageContentViewTime {
    return Intl.message(
      'Average card visit time',
      name: 'AverageContentViewTime',
      desc: '',
      args: [],
    );
  }

  /// `Routes`
  String get Routes {
    return Intl.message('Routes', name: 'Routes', desc: '', args: []);
  }

  /// `min`
  String get MinutesShort {
    return Intl.message('min', name: 'MinutesShort', desc: '', args: []);
  }

  /// `Place rating (by feedback)`
  String get PlaceRatingByFeedback {
    return Intl.message(
      'Place rating (by feedback)',
      name: 'PlaceRatingByFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Event rating (by feedback)`
  String get EventRatingByFeedback {
    return Intl.message(
      'Event rating (by feedback)',
      name: 'EventRatingByFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Overall rating of interest`
  String get OverallRatingOfInterest {
    return Intl.message(
      'Overall rating of interest',
      name: 'OverallRatingOfInterest',
      desc: '',
      args: [],
    );
  }

  /// `Monday`
  String get Monday {
    return Intl.message('Monday', name: 'Monday', desc: '', args: []);
  }

  /// `Tuesday`
  String get Tuesday {
    return Intl.message('Tuesday', name: 'Tuesday', desc: '', args: []);
  }

  /// `Wednesday`
  String get Wednesday {
    return Intl.message('Wednesday', name: 'Wednesday', desc: '', args: []);
  }

  /// `Thursday`
  String get Thursday {
    return Intl.message('Thursday', name: 'Thursday', desc: '', args: []);
  }

  /// `Friday`
  String get Friday {
    return Intl.message('Friday', name: 'Friday', desc: '', args: []);
  }

  /// `Saturday`
  String get Saturday {
    return Intl.message('Saturday', name: 'Saturday', desc: '', args: []);
  }

  /// `Sunday`
  String get Sunday {
    return Intl.message('Sunday', name: 'Sunday', desc: '', args: []);
  }

  /// `y.o`
  String get YearsOldShort {
    return Intl.message('y.o', name: 'YearsOldShort', desc: '', args: []);
  }

  /// `Gender and Age`
  String get GenderAndAge {
    return Intl.message(
      'Gender and Age',
      name: 'GenderAndAge',
      desc: '',
      args: [],
    );
  }

  /// `Tell us about`
  String get TellUsAbout {
    return Intl.message(
      'Tell us about',
      name: 'TellUsAbout',
      desc: '',
      args: [],
    );
  }

  /// `Yourself`
  String get Yourself {
    return Intl.message('Yourself', name: 'Yourself', desc: '', args: []);
  }

  /// `And get`
  String get AndGet {
    return Intl.message('And get', name: 'AndGet', desc: '', args: []);
  }

  /// `{count, plural, =0{Content recommendation system especially for you} =1{Meeting like-minded people using the user matching system} =2{Every time new places and events that suit you} other{It's easier to find the right people, and for them to find you}}`
  String SelectMindsetInvitation(num count) {
    return Intl.plural(
      count,
      zero: 'Content recommendation system especially for you',
      one: 'Meeting like-minded people using the user matching system',
      two: 'Every time new places and events that suit you',
      other: 'It\'s easier to find the right people, and for them to find you',
      name: 'SelectMindsetInvitation',
      desc: '',
      args: [count],
    );
  }

  /// `Plz, enter your name & nickname`
  String get PlzEnterName {
    return Intl.message(
      'Plz, enter your name & nickname',
      name: 'PlzEnterName',
      desc: '',
      args: [],
    );
  }

  /// `Opened "Upcoming events" block`
  String get OpenedUpcomingEvents {
    return Intl.message(
      'Opened "Upcoming events" block',
      name: 'OpenedUpcomingEvents',
      desc: '',
      args: [],
    );
  }

  /// `You progressed!`
  String get YouProgressed {
    return Intl.message(
      'You progressed!',
      name: 'YouProgressed',
      desc: '',
      args: [],
    );
  }

  /// `Available soon`
  String get AvailableSoon {
    return Intl.message(
      'Available soon',
      name: 'AvailableSoon',
      desc: '',
      args: [],
    );
  }

  /// `Plan it`
  String get AddToScheduler {
    return Intl.message('Plan it', name: 'AddToScheduler', desc: '', args: []);
  }

  /// `Soon`
  String get Soon {
    return Intl.message('Soon', name: 'Soon', desc: '', args: []);
  }

  /// `Free now, {count}$ later`
  String FreeNowXLater(Object count) {
    return Intl.message(
      'Free now, $count\$ later',
      name: 'FreeNowXLater',
      desc: '',
      args: [count],
    );
  }

  /// `Code scanner`
  String get CodeScanner {
    return Intl.message(
      'Code scanner',
      name: 'CodeScanner',
      desc: '',
      args: [],
    );
  }

  /// `Offer info`
  String get OfferInfo {
    return Intl.message('Offer info', name: 'OfferInfo', desc: '', args: []);
  }

  /// `Confirmed`
  String get Confirmed {
    return Intl.message('Confirmed', name: 'Confirmed', desc: '', args: []);
  }

  /// `There are no users who have bought the offer yet`
  String get ThereNoUsersWhoHaveBoughtOfferYet {
    return Intl.message(
      'There are no users who have bought the offer yet',
      name: 'ThereNoUsersWhoHaveBoughtOfferYet',
      desc: '',
      args: [],
    );
  }

  /// `The booking limit for one person has been reached`
  String get BookingLimitError {
    return Intl.message(
      'The booking limit for one person has been reached',
      name: 'BookingLimitError',
      desc: '',
      args: [],
    );
  }

  /// `This is empty now, book your visit and it will appear here`
  String get ThisIsEmptyNowBook {
    return Intl.message(
      'This is empty now, book your visit and it will appear here',
      name: 'ThisIsEmptyNowBook',
      desc: '',
      args: [],
    );
  }

  /// `No past bookings`
  String get NoPastBookings {
    return Intl.message(
      'No past bookings',
      name: 'NoPastBookings',
      desc: '',
      args: [],
    );
  }

  /// `in {x} days`
  String inXDays(Object x) {
    return Intl.message('in $x days', name: 'inXDays', desc: '', args: [x]);
  }

  /// `Scanner`
  String get Scanner {
    return Intl.message('Scanner', name: 'Scanner', desc: '', args: []);
  }

  /// `Controller not ready`
  String get ScanControllerNotReady {
    return Intl.message(
      'Controller not ready',
      name: 'ScanControllerNotReady',
      desc: '',
      args: [],
    );
  }

  /// `Permission denied`
  String get ScanPermissionDenied {
    return Intl.message(
      'Permission denied',
      name: 'ScanPermissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `Scanning is unsupported on this device`
  String get ScanningIsUnsupported {
    return Intl.message(
      'Scanning is unsupported on this device',
      name: 'ScanningIsUnsupported',
      desc: '',
      args: [],
    );
  }

  /// `Generic Error`
  String get ScanGenericError {
    return Intl.message(
      'Generic Error',
      name: 'ScanGenericError',
      desc: '',
      args: [],
    );
  }

  /// `You shared a ticket`
  String get YouSharedTicket {
    return Intl.message(
      'You shared a ticket',
      name: 'YouSharedTicket',
      desc: '',
      args: [],
    );
  }

  /// `Show the barcode at the checkout`
  String get ShowTheBarcodeCheckout {
    return Intl.message(
      'Show the barcode at the checkout',
      name: 'ShowTheBarcodeCheckout',
      desc: '',
      args: [],
    );
  }

  /// `Long tap card to edit`
  String get LongTapCardEdit {
    return Intl.message(
      'Long tap card to edit',
      name: 'LongTapCardEdit',
      desc: '',
      args: [],
    );
  }

  /// `You cannot create an offer because the event has already been completed`
  String get YouCannotCreateOfferDate {
    return Intl.message(
      'You cannot create an offer because the event has already been completed',
      name: 'YouCannotCreateOfferDate',
      desc: '',
      args: [],
    );
  }

  /// `Hi, here's a ticket`
  String get HiHereTicket {
    return Intl.message(
      'Hi, here\'s a ticket',
      name: 'HiHereTicket',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get Add {
    return Intl.message('Add', name: 'Add', desc: '', args: []);
  }

  /// `If a place already exists in`
  String get IfPlaceAlreadyExistsIn {
    return Intl.message(
      'If a place already exists in',
      name: 'IfPlaceAlreadyExistsIn',
      desc: '',
      args: [],
    );
  }

  /// `just confirm it`
  String get JustConfirmIt {
    return Intl.message(
      'just confirm it',
      name: 'JustConfirmIt',
      desc: '',
      args: [],
    );
  }

  /// `The limit must be greater than zero`
  String get LimitMustBeGreaterThanZero {
    return Intl.message(
      'The limit must be greater than zero',
      name: 'LimitMustBeGreaterThanZero',
      desc: '',
      args: [],
    );
  }

  /// `The start time should be earlier than the end time`
  String get StartTimeShouldBeEarlierThanEndTime {
    return Intl.message(
      'The start time should be earlier than the end time',
      name: 'StartTimeShouldBeEarlierThanEndTime',
      desc: '',
      args: [],
    );
  }

  /// `The selected time cannot be elapsed`
  String get TheSelectedTimeCannotBeElapsed {
    return Intl.message(
      'The selected time cannot be elapsed',
      name: 'TheSelectedTimeCannotBeElapsed',
      desc: '',
      args: [],
    );
  }

  /// `It is necessary to choose a day`
  String get ItNecessaryToChooseADay {
    return Intl.message(
      'It is necessary to choose a day',
      name: 'ItNecessaryToChooseADay',
      desc: '',
      args: [],
    );
  }

  /// `A period or part of a period of time cannot be in the past`
  String get APeriodOrPartOfPeriodOfTimeCannotBeInPast {
    return Intl.message(
      'A period or part of a period of time cannot be in the past',
      name: 'APeriodOrPartOfPeriodOfTimeCannotBeInPast',
      desc: '',
      args: [],
    );
  }

  /// `Status: {x} - Available`
  String StatusXAvailable(Object x) {
    return Intl.message(
      'Status: $x - Available',
      name: 'StatusXAvailable',
      desc: '',
      args: [x],
    );
  }

  /// `Status {x} - Access is restricted or the page is not found`
  String StatusXIsNotAvailable(Object x) {
    return Intl.message(
      'Status $x - Access is restricted or the page is not found',
      name: 'StatusXIsNotAvailable',
      desc: '',
      args: [x],
    );
  }

  /// `Failed to connect to {x}`
  String ErrorFailedConnectToX(Object x) {
    return Intl.message(
      'Failed to connect to $x',
      name: 'ErrorFailedConnectToX',
      desc: '',
      args: [x],
    );
  }

  /// `The ticket has been successfully activated`
  String get TicketSuccessfullyActivated {
    return Intl.message(
      'The ticket has been successfully activated',
      name: 'TicketSuccessfullyActivated',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't find this ticket`
  String get CouldNotFindThisTicket {
    return Intl.message(
      'Couldn\'t find this ticket',
      name: 'CouldNotFindThisTicket',
      desc: '',
      args: [],
    );
  }

  /// `Select template`
  String get SelectTemplate {
    return Intl.message(
      'Select template',
      name: 'SelectTemplate',
      desc: '',
      args: [],
    );
  }

  /// `Select location`
  String get SelectLocation {
    return Intl.message(
      'Select location',
      name: 'SelectLocation',
      desc: '',
      args: [],
    );
  }

  /// `Current location: `
  String get CurrentLocation {
    return Intl.message(
      'Current location: ',
      name: 'CurrentLocation',
      desc: '',
      args: [],
    );
  }

  /// `Select option`
  String get SelectOptionSchedule {
    return Intl.message(
      'Select option',
      name: 'SelectOptionSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure want to delete {x} forever?`
  String DeleteXAlert(Object x) {
    return Intl.message(
      'Are you sure want to delete $x forever?',
      name: 'DeleteXAlert',
      desc: '',
      args: [x],
    );
  }

  /// `Are you sure want to archive {x}?`
  String ArchiveXAlert(Object x) {
    return Intl.message(
      'Are you sure want to archive $x?',
      name: 'ArchiveXAlert',
      desc: '',
      args: [x],
    );
  }

  /// `You will send {x} to moderation`
  String UnArchiveXAlert(Object x) {
    return Intl.message(
      'You will send $x to moderation',
      name: 'UnArchiveXAlert',
      desc: '',
      args: [x],
    );
  }

  /// `Unarchive`
  String get UnArchive {
    return Intl.message('Unarchive', name: 'UnArchive', desc: '', args: []);
  }

  /// `Changing schedule type will wipe all data in this form!`
  String get ChangingScheduleTypeAlert {
    return Intl.message(
      'Changing schedule type will wipe all data in this form!',
      name: 'ChangingScheduleTypeAlert',
      desc: '',
      args: [],
    );
  }

  /// `Time Range`
  String get TimeRange {
    return Intl.message('Time Range', name: 'TimeRange', desc: '', args: []);
  }

  /// `Topographing the location`
  String get TopographingLocation {
    return Intl.message(
      'Topographing the location',
      name: 'TopographingLocation',
      desc: '',
      args: [],
    );
  }

  /// `We are sending a geologist to the point`
  String get SendingGeologistToPoint {
    return Intl.message(
      'We are sending a geologist to the point',
      name: 'SendingGeologistToPoint',
      desc: '',
      args: [],
    );
  }

  /// `We are sending a Google car for verification`
  String get SendingGoogleCarForVerification {
    return Intl.message(
      'We are sending a Google car for verification',
      name: 'SendingGoogleCarForVerification',
      desc: '',
      args: [],
    );
  }

  /// `We distribute information`
  String get DistributeInformation {
    return Intl.message(
      'We distribute information',
      name: 'DistributeInformation',
      desc: '',
      args: [],
    );
  }

  /// `We put it in rotation`
  String get PutItInRotation {
    return Intl.message(
      'We put it in rotation',
      name: 'PutItInRotation',
      desc: '',
      args: [],
    );
  }

  /// `People are starting to talk about you`
  String get PeopleStartingToTalkAboutYou {
    return Intl.message(
      'People are starting to talk about you',
      name: 'PeopleStartingToTalkAboutYou',
      desc: '',
      args: [],
    );
  }

  /// `Lighting up the time tableau`
  String get LightingUpTimeTableau {
    return Intl.message(
      'Lighting up the time tableau',
      name: 'LightingUpTimeTableau',
      desc: '',
      args: [],
    );
  }

  /// `Printing a calendar`
  String get PrintingCalendar {
    return Intl.message(
      'Printing a calendar',
      name: 'PrintingCalendar',
      desc: '',
      args: [],
    );
  }

  /// `Setting up alarm clocks`
  String get SettingUpAlarmClocks {
    return Intl.message(
      'Setting up alarm clocks',
      name: 'SettingUpAlarmClocks',
      desc: '',
      args: [],
    );
  }

  /// `We bring still lifes`
  String get WeBringStillLifes {
    return Intl.message(
      'We bring still lifes',
      name: 'WeBringStillLifes',
      desc: '',
      args: [],
    );
  }

  /// `Fill the air with fresh paint`
  String get FillTheAirWithFreshPaint {
    return Intl.message(
      'Fill the air with fresh paint',
      name: 'FillTheAirWithFreshPaint',
      desc: '',
      args: [],
    );
  }

  /// `Unloading the canvases`
  String get UnloadingTheCanvases {
    return Intl.message(
      'Unloading the canvases',
      name: 'UnloadingTheCanvases',
      desc: '',
      args: [],
    );
  }

  /// `Installing curtains`
  String get InstallingCurtains {
    return Intl.message(
      'Installing curtains',
      name: 'InstallingCurtains',
      desc: '',
      args: [],
    );
  }

  /// `We are putting up a poster`
  String get PuttingUpPoster {
    return Intl.message(
      'We are putting up a poster',
      name: 'PuttingUpPoster',
      desc: '',
      args: [],
    );
  }

  /// `We install and wash the showcase`
  String get WeInstallAndWashShowcase {
    return Intl.message(
      'We install and wash the showcase',
      name: 'WeInstallAndWashShowcase',
      desc: '',
      args: [],
    );
  }

  /// `Show {x} in profile`
  String ShowXInProfile(Object x) {
    return Intl.message(
      'Show $x in profile',
      name: 'ShowXInProfile',
      desc: '',
      args: [x],
    );
  }

  /// `Please enter a link`
  String get PleaseEnterLink {
    return Intl.message(
      'Please enter a link',
      name: 'PleaseEnterLink',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid {x} link`
  String PleaseEnterValidXLink(Object x) {
    return Intl.message(
      'Please enter a valid $x link',
      name: 'PleaseEnterValidXLink',
      desc: '',
      args: [x],
    );
  }

  /// `Links`
  String get Links {
    return Intl.message('Links', name: 'Links', desc: '', args: []);
  }

  /// `Shocking content`
  String get ShockingContent {
    return Intl.message(
      'Shocking content',
      name: 'ShockingContent',
      desc: '',
      args: [],
    );
  }

  /// `Sexual content`
  String get SexualContent {
    return Intl.message(
      'Sexual content',
      name: 'SexualContent',
      desc: '',
      args: [],
    );
  }

  /// `Copyright infringement`
  String get CopyrightInfringement {
    return Intl.message(
      'Copyright infringement',
      name: 'CopyrightInfringement',
      desc: '',
      args: [],
    );
  }

  /// `Misleading`
  String get Misleading {
    return Intl.message('Misleading', name: 'Misleading', desc: '', args: []);
  }

  /// `Your claim`
  String get YourClaim {
    return Intl.message('Your claim', name: 'YourClaim', desc: '', args: []);
  }

  /// `Another reason`
  String get AnotherReason {
    return Intl.message(
      'Another reason',
      name: 'AnotherReason',
      desc: '',
      args: [],
    );
  }

  /// `Translate`
  String get Translate {
    return Intl.message('Translate', name: 'Translate', desc: '', args: []);
  }

  /// `Original`
  String get Original {
    return Intl.message('Original', name: 'Original', desc: '', args: []);
  }

  /// `Please validate {x} details before sending it to moderation`
  String PleaseValidateXDetailsBeforeModeration(Object x) {
    return Intl.message(
      'Please validate $x details before sending it to moderation',
      name: 'PleaseValidateXDetailsBeforeModeration',
      desc: '',
      args: [x],
    );
  }

  /// `You've reached the maximum number of created events`
  String get MaxNumberOfEvents {
    return Intl.message(
      'You\'ve reached the maximum number of created events',
      name: 'MaxNumberOfEvents',
      desc: '',
      args: [],
    );
  }

  /// `Open event`
  String get OpenEvent {
    return Intl.message('Open event', name: 'OpenEvent', desc: '', args: []);
  }

  /// `See list`
  String get SeeList {
    return Intl.message('See list', name: 'SeeList', desc: '', args: []);
  }

  /// `Become Pro`
  String get BecomePro {
    return Intl.message('Become Pro', name: 'BecomePro', desc: '', args: []);
  }

  /// `Book it (+{x})`
  String BookItX(Object x) {
    return Intl.message('Book it (+$x)', name: 'BookItX', desc: '', args: [x]);
  }

  /// `I changed my mind`
  String get IChangedMyMind {
    return Intl.message(
      'I changed my mind',
      name: 'IChangedMyMind',
      desc: '',
      args: [],
    );
  }

  /// `Shuffle digest`
  String get ShuffleDigest {
    return Intl.message(
      'Shuffle digest',
      name: 'ShuffleDigest',
      desc: '',
      args: [],
    );
  }

  /// `Cannot find this place or event`
  String get CannotFindThisPlaceOrEvent {
    return Intl.message(
      'Cannot find this place or event',
      name: 'CannotFindThisPlaceOrEvent',
      desc: '',
      args: [],
    );
  }

  /// `This barcode has already been activated`
  String get BarcodeAlreadyBeenActivated {
    return Intl.message(
      'This barcode has already been activated',
      name: 'BarcodeAlreadyBeenActivated',
      desc: '',
      args: [],
    );
  }

  /// `The city is automatically detected as {x}.`
  String CityXWasDetected(Object x) {
    return Intl.message(
      'The city is automatically detected as $x.',
      name: 'CityXWasDetected',
      desc: '',
      args: [x],
    );
  }

  /// `You can change it in the settings.`
  String get ChangeInSettings {
    return Intl.message(
      'You can change it in the settings.',
      name: 'ChangeInSettings',
      desc: '',
      args: [],
    );
  }

  /// `Want to change?`
  String get WantToChange {
    return Intl.message(
      'Want to change?',
      name: 'WantToChange',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't find this review`
  String get CouldNotFindThisReview {
    return Intl.message(
      'Couldn\'t find this review',
      name: 'CouldNotFindThisReview',
      desc: '',
      args: [],
    );
  }

  /// `Review was successfully edited`
  String get ReviewWasSuccessfullyEdited {
    return Intl.message(
      'Review was successfully edited',
      name: 'ReviewWasSuccessfullyEdited',
      desc: '',
      args: [],
    );
  }

  /// `My`
  String get My {
    return Intl.message('My', name: 'My', desc: '', args: []);
  }

  /// `Common`
  String get Common {
    return Intl.message('Common', name: 'Common', desc: '', args: []);
  }

  /// `Where's the activity?`
  String get WheresTheActivity {
    return Intl.message(
      'Where\'s the activity?',
      name: 'WheresTheActivity',
      desc: '',
      args: [],
    );
  }

  /// `Chat name`
  String get ChatName {
    return Intl.message('Chat name', name: 'ChatName', desc: '', args: []);
  }

  /// `Admin`
  String get Admin {
    return Intl.message('Admin', name: 'Admin', desc: '', args: []);
  }

  /// `You asked to be added to the chat`
  String get YouAskedToBeAddedToTheChat {
    return Intl.message(
      'You asked to be added to the chat',
      name: 'YouAskedToBeAddedToTheChat',
      desc: '',
      args: [],
    );
  }

  /// `Wait for the admin's response`
  String get WaitAdminResponse {
    return Intl.message(
      'Wait for the admin\'s response',
      name: 'WaitAdminResponse',
      desc: '',
      args: [],
    );
  }

  /// `Private chat. Please apply by pressing`
  String get PrivateChatApply {
    return Intl.message(
      'Private chat. Please apply by pressing',
      name: 'PrivateChatApply',
      desc: '',
      args: [],
    );
  }

  /// `Select city`
  String get SelectCity {
    return Intl.message('Select city', name: 'SelectCity', desc: '', args: []);
  }

  /// `City`
  String get City {
    return Intl.message('City', name: 'City', desc: '', args: []);
  }

  /// `Scheduler`
  String get Scheduler {
    return Intl.message('Scheduler', name: 'Scheduler', desc: '', args: []);
  }

  /// `wants to join`
  String get WantToJoin {
    return Intl.message(
      'wants to join',
      name: 'WantToJoin',
      desc: '',
      args: [],
    );
  }

  /// `Places visited`
  String get PlacesVisitedInf {
    return Intl.message(
      'Places visited',
      name: 'PlacesVisitedInf',
      desc: '',
      args: [],
    );
  }

  /// `Reviews posted`
  String get ReviewsPostedInf {
    return Intl.message(
      'Reviews posted',
      name: 'ReviewsPostedInf',
      desc: '',
      args: [],
    );
  }

  /// `Points earned`
  String get PointsEarnedInf {
    return Intl.message(
      'Points earned',
      name: 'PointsEarnedInf',
      desc: '',
      args: [],
    );
  }

  /// `Show up ratio`
  String get ShowUpRatio {
    return Intl.message(
      'Show up ratio',
      name: 'ShowUpRatio',
      desc: '',
      args: [],
    );
  }

  /// `Show up ratio takes into account how long ago the user was online, whether he has notifications enabled, and his no-show ratio`
  String get BookingPopUpText {
    return Intl.message(
      'Show up ratio takes into account how long ago the user was online, whether he has notifications enabled, and his no-show ratio',
      name: 'BookingPopUpText',
      desc: '',
      args: [],
    );
  }

  /// `No shows`
  String get NoShows {
    return Intl.message('No shows', name: 'NoShows', desc: '', args: []);
  }

  /// `No shows ratio takes into account all users no shows`
  String get NoShowsRatioTakesIntoAccount {
    return Intl.message(
      'No shows ratio takes into account all users no shows',
      name: 'NoShowsRatioTakesIntoAccount',
      desc: '',
      args: [],
    );
  }

  /// `Show up`
  String get ShowUp {
    return Intl.message('Show up', name: 'ShowUp', desc: '', args: []);
  }

  /// `Your Show up ratio`
  String get YourShowUpRatio {
    return Intl.message(
      'Your Show up ratio',
      name: 'YourShowUpRatio',
      desc: '',
      args: [],
    );
  }

  /// `is over {x}%`
  String IsOverX(Object x) {
    return Intl.message('is over $x%', name: 'IsOverX', desc: '', args: [x]);
  }

  /// `Keep it up! Use our tools to improve it even more`
  String get KeepItUp {
    return Intl.message(
      'Keep it up! Use our tools to improve it even more',
      name: 'KeepItUp',
      desc: '',
      args: [],
    );
  }

  /// `Your turnout rate`
  String get YourTurnoutRate {
    return Intl.message(
      'Your turnout rate',
      name: 'YourTurnoutRate',
      desc: '',
      args: [],
    );
  }

  /// `Is less than {x}%`
  String IsLessThanX(Object x) {
    return Intl.message(
      'Is less than $x%',
      name: 'IsLessThanX',
      desc: '',
      args: [x],
    );
  }

  /// `Use our tools to improve it`
  String get UseOurToolsToImproveIt {
    return Intl.message(
      'Use our tools to improve it',
      name: 'UseOurToolsToImproveIt',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter a branch title`
  String get PleaseEnterABranchTitle {
    return Intl.message(
      'Please, enter a branch title',
      name: 'PleaseEnterABranchTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create link with`
  String get CreateLinkWith {
    return Intl.message(
      'Create link with',
      name: 'CreateLinkWith',
      desc: '',
      args: [],
    );
  }

  /// `Title your TOP`
  String get TitleYourTOP {
    return Intl.message(
      'Title your TOP',
      name: 'TitleYourTOP',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get Wallet {
    return Intl.message('Wallet', name: 'Wallet', desc: '', args: []);
  }

  /// `Available balance`
  String get AvailableBalance {
    return Intl.message(
      'Available balance',
      name: 'AvailableBalance',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get EmptyChallengeNo {
    return Intl.message('No', name: 'EmptyChallengeNo', desc: '', args: []);
  }

  /// `Easy`
  String get EmptyChallengeEasy {
    return Intl.message('Easy', name: 'EmptyChallengeEasy', desc: '', args: []);
  }

  /// `Fair`
  String get EmptyChallengeFair {
    return Intl.message('Fair', name: 'EmptyChallengeFair', desc: '', args: []);
  }

  /// `Hardcore`
  String get EmptyChallengeHardcode {
    return Intl.message(
      'Hardcore',
      name: 'EmptyChallengeHardcode',
      desc: '',
      args: [],
    );
  }

  /// `Challenge right now,\ncheck out another one`
  String get EmptyChallengeMessage {
    return Intl.message(
      'Challenge right now,\ncheck out another one',
      name: 'EmptyChallengeMessage',
      desc: '',
      args: [],
    );
  }

  /// `We are preparing challenges for tomorrow, come later`
  String get WeArePreparingChallengesForTomorrow {
    return Intl.message(
      'We are preparing challenges for tomorrow, come later',
      name: 'WeArePreparingChallengesForTomorrow',
      desc: '',
      args: [],
    );
  }

  /// `Cannot find this author`
  String get CannotFindThisAuthor {
    return Intl.message(
      'Cannot find this author',
      name: 'CannotFindThisAuthor',
      desc: '',
      args: [],
    );
  }

  /// `This author does not have a suitable account`
  String get ThisAuthorDoesNotHaveSuitableAccount {
    return Intl.message(
      'This author does not have a suitable account',
      name: 'ThisAuthorDoesNotHaveSuitableAccount',
      desc: '',
      args: [],
    );
  }

  /// `Use your opportunities`
  String get UseYourOpportunities {
    return Intl.message(
      'Use your opportunities',
      name: 'UseYourOpportunities',
      desc: '',
      args: [],
    );
  }

  /// `Refresher`
  String get Refresher {
    return Intl.message('Refresher', name: 'Refresher', desc: '', args: []);
  }

  /// `Survey for no shows users`
  String get SurveyForNoShowsUsers {
    return Intl.message(
      'Survey for no shows users',
      name: 'SurveyForNoShowsUsers',
      desc: '',
      args: [],
    );
  }

  /// `Agenda`
  String get Agenda {
    return Intl.message('Agenda', name: 'Agenda', desc: '', args: []);
  }

  /// `Remind those who interacted with your content to show up`
  String get RemindThoseWhoInteractedWithYourContent {
    return Intl.message(
      'Remind those who interacted with your content to show up',
      name: 'RemindThoseWhoInteractedWithYourContent',
      desc: '',
      args: [],
    );
  }

  /// `Notify potentially interested audiences`
  String get NotifyPotentiallyInterestedAudiences {
    return Intl.message(
      'Notify potentially interested audiences',
      name: 'NotifyPotentiallyInterestedAudiences',
      desc: '',
      args: [],
    );
  }

  /// `Offer bonus to your guests through Shuffle activity`
  String get OfferBonusToYourGuestsThroughShuffleActivity {
    return Intl.message(
      'Offer bonus to your guests through Shuffle activity',
      name: 'OfferBonusToYourGuestsThroughShuffleActivity',
      desc: '',
      args: [],
    );
  }

  /// `Remind your bookings one week, one day and one hour before the start`
  String get RemindYourBookingsOneWeekOneDay {
    return Intl.message(
      'Remind your bookings one week, one day and one hour before the start',
      name: 'RemindYourBookingsOneWeekOneDay',
      desc: '',
      args: [],
    );
  }

  /// `Include a survey for no-shows to work with the cause`
  String get IncludeASurveyForNoShows {
    return Intl.message(
      'Include a survey for no-shows to work with the cause',
      name: 'IncludeASurveyForNoShows',
      desc: '',
      args: [],
    );
  }

  /// `Add an agenda and highlight the speakers`
  String get AddAnAgendaAndHighlightTheSpeakers {
    return Intl.message(
      'Add an agenda and highlight the speakers',
      name: 'AddAnAgendaAndHighlightTheSpeakers',
      desc: '',
      args: [],
    );
  }

  /// `Name of Branch can not be empty`
  String get NameOfBranchCanNotBeEmpty {
    return Intl.message(
      'Name of Branch can not be empty',
      name: 'NameOfBranchCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Error: name has already been registered`
  String get ErrorThisNameHasAlreadyBeenRegistered {
    return Intl.message(
      'Error: name has already been registered',
      name: 'ErrorThisNameHasAlreadyBeenRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Please select place or branch`
  String get PleaseSelectPlace {
    return Intl.message(
      'Please select place or branch',
      name: 'PleaseSelectPlace',
      desc: '',
      args: [],
    );
  }

  /// `Set up Refresher for ${x}`
  String SetUpARefresherForX(Object x) {
    return Intl.message(
      'Set up Refresher for \$$x',
      name: 'SetUpARefresherForX',
      desc: '',
      args: [x],
    );
  }

  /// `Set up new Refresher`
  String get SetUpNewRefresher {
    return Intl.message(
      'Set up new Refresher',
      name: 'SetUpNewRefresher',
      desc: '',
      args: [],
    );
  }

  /// `Text`
  String get Text {
    return Intl.message('Text', name: 'Text', desc: '', args: []);
  }

  /// `Please enter valid text`
  String get PleaseEnterValidText {
    return Intl.message(
      'Please enter valid text',
      name: 'PleaseEnterValidText',
      desc: '',
      args: [],
    );
  }

  /// `Your start notification will be shown {x} times: a week, a day and an hour before the event start`
  String YourStartNotificationWillBeShownXTimes(Object x) {
    return Intl.message(
      'Your start notification will be shown $x times: a week, a day and an hour before the event start',
      name: 'YourStartNotificationWillBeShownXTimes',
      desc: '',
      args: [x],
    );
  }

  /// `{x} Week`
  String XWeek(Object x) {
    return Intl.message('$x Week', name: 'XWeek', desc: '', args: [x]);
  }

  /// `{x} Day`
  String XDay(Object x) {
    return Intl.message('$x Day', name: 'XDay', desc: '', args: [x]);
  }

  /// `{x} Hour`
  String XHour(Object x) {
    return Intl.message('$x Hour', name: 'XHour', desc: '', args: [x]);
  }

  /// `Text for the week`
  String get TextForTheWeek {
    return Intl.message(
      'Text for the week',
      name: 'TextForTheWeek',
      desc: '',
      args: [],
    );
  }

  /// `text for the day`
  String get TextForTheDay {
    return Intl.message(
      'text for the day',
      name: 'TextForTheDay',
      desc: '',
      args: [],
    );
  }

  /// `text in an hour`
  String get TextInAnHour {
    return Intl.message(
      'text in an hour',
      name: 'TextInAnHour',
      desc: '',
      args: [],
    );
  }

  /// `Refresher cannot be empty`
  String get RefresherCannotBeEmpty {
    return Intl.message(
      'Refresher cannot be empty',
      name: 'RefresherCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Cannot find this refresher`
  String get CannotFindThisRefresher {
    return Intl.message(
      'Cannot find this refresher',
      name: 'CannotFindThisRefresher',
      desc: '',
      args: [],
    );
  }

  /// `Pay for the start notification`
  String get PayForTheStartNotification {
    return Intl.message(
      'Pay for the start notification',
      name: 'PayForTheStartNotification',
      desc: '',
      args: [],
    );
  }

  /// `Remainder`
  String get Remainder {
    return Intl.message('Remainder', name: 'Remainder', desc: '', args: []);
  }

  /// `Remind before`
  String get RemindBefore {
    return Intl.message(
      'Remind before',
      name: 'RemindBefore',
      desc: '',
      args: [],
    );
  }

  /// `You have existing items`
  String get YouHaveExistingItems {
    return Intl.message(
      'You have existing items',
      name: 'YouHaveExistingItems',
      desc: '',
      args: [],
    );
  }

  /// `Select item to edit`
  String get SelectItemToEdit {
    return Intl.message(
      'Select item to edit',
      name: 'SelectItemToEdit',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get Completed {
    return Intl.message('Completed', name: 'Completed', desc: '', args: []);
  }

  /// `In progress`
  String get InProgress {
    return Intl.message('In progress', name: 'InProgress', desc: '', args: []);
  }

  /// `Not started`
  String get NotStarted {
    return Intl.message('Not started', name: 'NotStarted', desc: '', args: []);
  }

  /// `Need action`
  String get NeedAction {
    return Intl.message('Need action', name: 'NeedAction', desc: '', args: []);
  }

  /// `Confirm or edit {x}`
  String ConfirmOrEditX(Object x) {
    return Intl.message(
      'Confirm or edit $x',
      name: 'ConfirmOrEditX',
      desc: '',
      args: [x],
    );
  }

  /// `You can use paid features and accept payments after registering with Stripe`
  String get RegistrationStripeExplanation {
    return Intl.message(
      'You can use paid features and accept payments after registering with Stripe',
      name: 'RegistrationStripeExplanation',
      desc: '',
      args: [],
    );
  }

  /// `Awaiting payment`
  String get AwaitingPayment {
    return Intl.message(
      'Awaiting payment',
      name: 'AwaitingPayment',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get Pending {
    return Intl.message('Pending', name: 'Pending', desc: '', args: []);
  }

  /// `All voices`
  String get AllVoices {
    return Intl.message('All voices', name: 'AllVoices', desc: '', args: []);
  }

  /// `Add voice`
  String get AddVoice {
    return Intl.message('Add voice', name: 'AddVoice', desc: '', args: []);
  }

  /// `interview`
  String get interview {
    return Intl.message('interview', name: 'interview', desc: '', args: []);
  }

  /// `Couldn't find voice messages`
  String get CouldntFindVoiceMessages {
    return Intl.message(
      'Couldn\'t find voice messages',
      name: 'CouldntFindVoiceMessages',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't send voice messages`
  String get CouldntSendVoiceMessages {
    return Intl.message(
      'Couldn\'t send voice messages',
      name: 'CouldntSendVoiceMessages',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred when downloading audio from the device`
  String get AnErrorOccurredWhenDownloadingAudioFromDevice {
    return Intl.message(
      'An error occurred when downloading audio from the device',
      name: 'AnErrorOccurredWhenDownloadingAudioFromDevice',
      desc: '',
      args: [],
    );
  }

  /// `Photo title`
  String get PhotoTitle {
    return Intl.message('Photo title', name: 'PhotoTitle', desc: '', args: []);
  }

  /// `Delete these photos?`
  String get DeleteThesePhotos {
    return Intl.message(
      'Delete these photos?',
      name: 'DeleteThesePhotos',
      desc: '',
      args: [],
    );
  }

  /// `Delete these photo?`
  String get DeleteThisPhoto {
    return Intl.message(
      'Delete these photo?',
      name: 'DeleteThisPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Add title`
  String get AddTitle {
    return Intl.message('Add title', name: 'AddTitle', desc: '', args: []);
  }

  /// `Error when upload image`
  String get ErrorWhenUploadImage {
    return Intl.message(
      'Error when upload image',
      name: 'ErrorWhenUploadImage',
      desc: '',
      args: [],
    );
  }

  /// `Error when create image`
  String get ErrorWhenCreateImage {
    return Intl.message(
      'Error when create image',
      name: 'ErrorWhenCreateImage',
      desc: '',
      args: [],
    );
  }

  /// `Your TOP`
  String get YourTop {
    return Intl.message('Your TOP', name: 'YourTop', desc: '', args: []);
  }

  /// `Select title`
  String get SelectTitle {
    return Intl.message(
      'Select title',
      name: 'SelectTitle',
      desc: '',
      args: [],
    );
  }

  /// `Drafts`
  String get Drafts {
    return Intl.message('Drafts', name: 'Drafts', desc: '', args: []);
  }

  /// `Voices is empty`
  String get VoicesIsEmpty {
    return Intl.message(
      'Voices is empty',
      name: 'VoicesIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Supported video MP4, up to 80MB`
  String get SupportedFormatsVideo {
    return Intl.message(
      'Supported video MP4, up to 80MB',
      name: 'SupportedFormatsVideo',
      desc: '',
      args: [],
    );
  }

  /// `Cannot find this voice`
  String get CannotFindThisVoice {
    return Intl.message(
      'Cannot find this voice',
      name: 'CannotFindThisVoice',
      desc: '',
      args: [],
    );
  }

  /// `Continue with draft`
  String get ContinueWithDraft {
    return Intl.message(
      'Continue with draft',
      name: 'ContinueWithDraft',
      desc: '',
      args: [],
    );
  }

  /// `Use draft`
  String get UseDraft {
    return Intl.message('Use draft', name: 'UseDraft', desc: '', args: []);
  }

  /// `Your TOPs`
  String get YourTOPs {
    return Intl.message('Your TOPs', name: 'YourTOPs', desc: '', args: []);
  }

  /// `Add new`
  String get AddNew {
    return Intl.message('Add new', name: 'AddNew', desc: '', args: []);
  }

  /// `New TOP`
  String get NewTOP {
    return Intl.message('New TOP', name: 'NewTOP', desc: '', args: []);
  }

  /// `Create news`
  String get CreateNews {
    return Intl.message('Create news', name: 'CreateNews', desc: '', args: []);
  }

  /// `What's new?`
  String get WhatsNew {
    return Intl.message('What\'s new?', name: 'WhatsNew', desc: '', args: []);
  }

  /// `There is nothing yet! Create your first news`
  String get ThereIsNothingYetCreateYourFirstNews {
    return Intl.message(
      'There is nothing yet! Create your first news',
      name: 'ThereIsNothingYetCreateYourFirstNews',
      desc: '',
      args: [],
    );
  }

  /// `Error when creating a tweet`
  String get ErrorWhenCreatingATweet {
    return Intl.message(
      'Error when creating a tweet',
      name: 'ErrorWhenCreatingATweet',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a message for the news`
  String get PleaseEnterAMessageForTheNews {
    return Intl.message(
      'Please enter a message for the news',
      name: 'PleaseEnterAMessageForTheNews',
      desc: '',
      args: [],
    );
  }

  /// `Cannot find this news`
  String get CannotFindThisNews {
    return Intl.message(
      'Cannot find this news',
      name: 'CannotFindThisNews',
      desc: '',
      args: [],
    );
  }

  /// `{count} {count, plural, =0{years} =1{year} =2{years} few{years} many{years} other{years}} ago`
  String YearsAgoX(num count) {
    return Intl.message(
      '$count ${Intl.plural(count, zero: 'years', one: 'year', two: 'years', few: 'years', many: 'years', other: 'years')} ago',
      name: 'YearsAgoX',
      desc: '',
      args: [count],
    );
  }

  /// `{count} {count, plural, =0{mouths} =1{mouth} =2{mouths} few{mouths} many{mouths} other{mouths}} ago`
  String MouthsAgoX(num count) {
    return Intl.message(
      '$count ${Intl.plural(count, zero: 'mouths', one: 'mouth', two: 'mouths', few: 'mouths', many: 'mouths', other: 'mouths')} ago',
      name: 'MouthsAgoX',
      desc: '',
      args: [count],
    );
  }

  /// `{count} {count, plural, =0{weeks} =1{week} =2{weeks} few{weeks} many{weeks} other{weeks}} ago`
  String WeeksAgoX(num count) {
    return Intl.message(
      '$count ${Intl.plural(count, zero: 'weeks', one: 'week', two: 'weeks', few: 'weeks', many: 'weeks', other: 'weeks')} ago',
      name: 'WeeksAgoX',
      desc: '',
      args: [count],
    );
  }

  /// `{count} {count, plural, =0{days} =1{day} =2{days} few{days} many{days} other{days}} ago`
  String DaysAgoX(num count) {
    return Intl.message(
      '$count ${Intl.plural(count, zero: 'days', one: 'day', two: 'days', few: 'days', many: 'days', other: 'days')} ago',
      name: 'DaysAgoX',
      desc: '',
      args: [count],
    );
  }

  /// `{count} {count, plural, =0{hours} =1{hour} =2{hours} few{hours} many{hours} other{hours}} ago`
  String HoursAgoX(num count) {
    return Intl.message(
      '$count ${Intl.plural(count, zero: 'hours', one: 'hour', two: 'hours', few: 'hours', many: 'hours', other: 'hours')} ago',
      name: 'HoursAgoX',
      desc: '',
      args: [count],
    );
  }

  /// `min ago`
  String get MinAgoX {
    return Intl.message('min ago', name: 'MinAgoX', desc: '', args: []);
  }

  /// `sec ago`
  String get SecAgoX {
    return Intl.message('sec ago', name: 'SecAgoX', desc: '', args: []);
  }

  /// `Just now`
  String get JustNow {
    return Intl.message('Just now', name: 'JustNow', desc: '', args: []);
  }

  /// `You have unpaid tickets, want to review them in My booking page?`
  String get YouHaveUnpaidTickets {
    return Intl.message(
      'You have unpaid tickets, want to review them in My booking page?',
      name: 'YouHaveUnpaidTickets',
      desc: '',
      args: [],
    );
  }

  /// `Promotions`
  String get Promotions {
    return Intl.message('Promotions', name: 'Promotions', desc: '', args: []);
  }

  /// `Create a promotion for your {x} and increase attendance`
  String CreateAPromotionForYourXAndIncreaseAttendance(Object x) {
    return Intl.message(
      'Create a promotion for your $x and increase attendance',
      name: 'CreateAPromotionForYourXAndIncreaseAttendance',
      desc: '',
      args: [x],
    );
  }

  /// `Place`
  String get PlacePromo {
    return Intl.message('Place', name: 'PlacePromo', desc: '', args: []);
  }

  /// `Event`
  String get EventPromo {
    return Intl.message('Event', name: 'EventPromo', desc: '', args: []);
  }

  /// `Please select image`
  String get PleaseSelectImage {
    return Intl.message(
      'Please select image',
      name: 'PleaseSelectImage',
      desc: '',
      args: [],
    );
  }

  /// `Add at least one {x} to promote it`
  String AddAtLeastOneXToPromoteIt(Object x) {
    return Intl.message(
      'Add at least one $x to promote it',
      name: 'AddAtLeastOneXToPromoteIt',
      desc: '',
      args: [x],
    );
  }

  /// `You have 15 minutes to pay, otherwise the ticket will be cancelled`
  String get YouHaveTimeToPayTicket {
    return Intl.message(
      'You have 15 minutes to pay, otherwise the ticket will be cancelled',
      name: 'YouHaveTimeToPayTicket',
      desc: '',
      args: [],
    );
  }

  /// `Show the barcode at the entrance`
  String get ShowBarcode {
    return Intl.message(
      'Show the barcode at the entrance',
      name: 'ShowBarcode',
      desc: '',
      args: [],
    );
  }

  /// `Stripe\nregistration`
  String get StripeRegistration {
    return Intl.message(
      'Stripe\nregistration',
      name: 'StripeRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Accept payments`
  String get AcceptPayments {
    return Intl.message(
      'Accept payments',
      name: 'AcceptPayments',
      desc: '',
      args: [],
    );
  }

  /// `Online`
  String get Online {
    return Intl.message('Online', name: 'Online', desc: '', args: []);
  }

  /// `Want to`
  String get WantTo {
    return Intl.message('Want to', name: 'WantTo', desc: '', args: []);
  }

  /// `For your booking`
  String get ForYourBooking {
    return Intl.message(
      'For your booking',
      name: 'ForYourBooking',
      desc: '',
      args: [],
    );
  }

  /// `You need to select one or more methods`
  String get YouNeedSelectMethods {
    return Intl.message(
      'You need to select one or more methods',
      name: 'YouNeedSelectMethods',
      desc: '',
      args: [],
    );
  }

  /// `Not`
  String get Not {
    return Intl.message('Not', name: 'Not', desc: '', args: []);
  }

  /// `Close`
  String get Close {
    return Intl.message('Close', name: 'Close', desc: '', args: []);
  }

  /// `This bottom sheet`
  String get ThisBottom {
    return Intl.message(
      'This bottom sheet',
      name: 'ThisBottom',
      desc: '',
      args: [],
    );
  }

  /// `If`
  String get If {
    return Intl.message('If', name: 'If', desc: '', args: []);
  }

  /// `Just`
  String get Just {
    return Intl.message('Just', name: 'Just', desc: '', args: []);
  }

  /// `Money`
  String get ForMoney {
    return Intl.message('Money', name: 'ForMoney', desc: '', args: []);
  }

  /// `Crypto`
  String get ForCrypto {
    return Intl.message('Crypto', name: 'ForCrypto', desc: '', args: []);
  }

  /// `Select booking type`
  String get SelectBookingType {
    return Intl.message(
      'Select booking type',
      name: 'SelectBookingType',
      desc: '',
      args: [],
    );
  }

  /// `At entrance`
  String get AtEntrance {
    return Intl.message('At entrance', name: 'AtEntrance', desc: '', args: []);
  }

  /// `To make it available, create a Stripe account in Settings "Wallet"`
  String get HintStripe {
    return Intl.message(
      'To make it available, create a Stripe account in Settings "Wallet"',
      name: 'HintStripe',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get Cash {
    return Intl.message('Cash', name: 'Cash', desc: '', args: []);
  }

  /// `Payment method`
  String get PaymentMethod {
    return Intl.message(
      'Payment method',
      name: 'PaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Clicks`
  String get Clicks {
    return Intl.message('Clicks', name: 'Clicks', desc: '', args: []);
  }

  /// `Bookings`
  String get BookingsPromo {
    return Intl.message('Bookings', name: 'BookingsPromo', desc: '', args: []);
  }

  /// `Budget`
  String get BudgetPromo {
    return Intl.message('Budget', name: 'BudgetPromo', desc: '', args: []);
  }

  /// `Card views within a promotion`
  String get CardViewsWithinAPromotion {
    return Intl.message(
      'Card views within a promotion',
      name: 'CardViewsWithinAPromotion',
      desc: '',
      args: [],
    );
  }

  /// `Clicks on the card within a promotion`
  String get ClicksOnTheCardWithinAPromotion {
    return Intl.message(
      'Clicks on the card within a promotion',
      name: 'ClicksOnTheCardWithinAPromotion',
      desc: '',
      args: [],
    );
  }

  /// `Number of unique views`
  String get NumberOfUniqueViews {
    return Intl.message(
      'Number of unique views',
      name: 'NumberOfUniqueViews',
      desc: '',
      args: [],
    );
  }

  /// `Bookings for your event`
  String get BookingsForYourEvent {
    return Intl.message(
      'Bookings for your event',
      name: 'BookingsForYourEvent',
      desc: '',
      args: [],
    );
  }

  /// `Add to Favorites`
  String get AddToFavorites {
    return Intl.message(
      'Add to Favorites',
      name: 'AddToFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Number of participants in the invitation list`
  String get NumberOfParticipantsInTheInvitationList {
    return Intl.message(
      'Number of participants in the invitation list',
      name: 'NumberOfParticipantsInTheInvitationList',
      desc: '',
      args: [],
    );
  }

  /// `Spent on promotion today`
  String get SpentOnPromotionToday {
    return Intl.message(
      'Spent on promotion today',
      name: 'SpentOnPromotionToday',
      desc: '',
      args: [],
    );
  }

  /// `Audience Definition`
  String get AudienceDefinition {
    return Intl.message(
      'Audience Definition',
      name: 'AudienceDefinition',
      desc: '',
      args: [],
    );
  }

  /// `Edit promotion`
  String get EditPromotion {
    return Intl.message(
      'Edit promotion',
      name: 'EditPromotion',
      desc: '',
      args: [],
    );
  }

  /// `Pause promotion`
  String get PausePromotion {
    return Intl.message(
      'Pause promotion',
      name: 'PausePromotion',
      desc: '',
      args: [],
    );
  }

  /// `Delete promotion`
  String get DeletePromotion {
    return Intl.message(
      'Delete promotion',
      name: 'DeletePromotion',
      desc: '',
      args: [],
    );
  }

  /// `Today's summary: {x}`
  String TodaysSummaryX(Object x) {
    return Intl.message(
      'Today\'s summary: $x',
      name: 'TodaysSummaryX',
      desc: '',
      args: [x],
    );
  }

  /// `Potential coverage of {x} people`
  String PotentialCoverageOfXPeople(Object x) {
    return Intl.message(
      'Potential coverage of $x people',
      name: 'PotentialCoverageOfXPeople',
      desc: '',
      args: [x],
    );
  }

  /// `Promotion launch results`
  String get PromotionLaunchResults {
    return Intl.message(
      'Promotion launch results',
      name: 'PromotionLaunchResults',
      desc: '',
      args: [],
    );
  }

  /// `January`
  String get January {
    return Intl.message('January', name: 'January', desc: '', args: []);
  }

  /// `February`
  String get February {
    return Intl.message('February', name: 'February', desc: '', args: []);
  }

  /// `March`
  String get March {
    return Intl.message('March', name: 'March', desc: '', args: []);
  }

  /// `April`
  String get April {
    return Intl.message('April', name: 'April', desc: '', args: []);
  }

  /// `May`
  String get May {
    return Intl.message('May', name: 'May', desc: '', args: []);
  }

  /// `June`
  String get June {
    return Intl.message('June', name: 'June', desc: '', args: []);
  }

  /// `July`
  String get July {
    return Intl.message('July', name: 'July', desc: '', args: []);
  }

  /// `August`
  String get August {
    return Intl.message('August', name: 'August', desc: '', args: []);
  }

  /// `September`
  String get September {
    return Intl.message('September', name: 'September', desc: '', args: []);
  }

  /// `October`
  String get October {
    return Intl.message('October', name: 'October', desc: '', args: []);
  }

  /// `November`
  String get November {
    return Intl.message('November', name: 'November', desc: '', args: []);
  }

  /// `December`
  String get December {
    return Intl.message('December', name: 'December', desc: '', args: []);
  }

  /// `Promotion evaluation`
  String get PromotionEvaluation {
    return Intl.message(
      'Promotion evaluation',
      name: 'PromotionEvaluation',
      desc: '',
      args: [],
    );
  }

  /// `Your indicators has set the bar high! It can be`
  String get YourIndicatorsHasSetTheBarHighItCanBe {
    return Intl.message(
      'Your indicators has set the bar high! It can be',
      name: 'YourIndicatorsHasSetTheBarHighItCanBe',
      desc: '',
      args: [],
    );
  }

  /// `even higher`
  String get EvenHigher {
    return Intl.message('even higher', name: 'EvenHigher', desc: '', args: []);
  }

  /// `if you apply the promotion`
  String get IfYouApplyThePromotion {
    return Intl.message(
      'if you apply the promotion',
      name: 'IfYouApplyThePromotion',
      desc: '',
      args: [],
    );
  }

  /// `How many people registered in the app will potentially see the post`
  String get HowManyPeopleRegisteredInTheAppWillPotentiallySeeThePost {
    return Intl.message(
      'How many people registered in the app will potentially see the post',
      name: 'HowManyPeopleRegisteredInTheAppWillPotentiallySeeThePost',
      desc: '',
      args: [],
    );
  }

  /// `Wait...`
  String get Wait {
    return Intl.message('Wait...', name: 'Wait', desc: '', args: []);
  }

  /// `Cannot find this promotion`
  String get CannotFindThisPromotion {
    return Intl.message(
      'Cannot find this promotion',
      name: 'CannotFindThisPromotion',
      desc: '',
      args: [],
    );
  }

  /// `Create a new audience or use a saved one`
  String get CreateAudienceOrSelectOne {
    return Intl.message(
      'Create a new audience or use a saved one',
      name: 'CreateAudienceOrSelectOne',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get From {
    return Intl.message('From', name: 'From', desc: '', args: []);
  }

  /// `To`
  String get To {
    return Intl.message('To', name: 'To', desc: '', args: []);
  }

  /// `Birthday`
  String get Birthday {
    return Intl.message('Birthday', name: 'Birthday', desc: '', args: []);
  }

  /// `Device`
  String get Device {
    return Intl.message('Device', name: 'Device', desc: '', args: []);
  }

  /// `Information`
  String get Information {
    return Intl.message('Information', name: 'Information', desc: '', args: []);
  }

  /// `Mon`
  String get Mon {
    return Intl.message('Mon', name: 'Mon', desc: '', args: []);
  }

  /// `Tue`
  String get Tue {
    return Intl.message('Tue', name: 'Tue', desc: '', args: []);
  }

  /// `Wed`
  String get Wed {
    return Intl.message('Wed', name: 'Wed', desc: '', args: []);
  }

  /// `Thu`
  String get Thu {
    return Intl.message('Thu', name: 'Thu', desc: '', args: []);
  }

  /// `Fri`
  String get Fri {
    return Intl.message('Fri', name: 'Fri', desc: '', args: []);
  }

  /// `Sat`
  String get Sat {
    return Intl.message('Sat', name: 'Sat', desc: '', args: []);
  }

  /// `Sun`
  String get Sun {
    return Intl.message('Sun', name: 'Sun', desc: '', args: []);
  }

  /// `Are you sure you want to delete this voice?`
  String get AreYouSureYouWantToDeleteThisVoice {
    return Intl.message(
      'Are you sure you want to delete this voice?',
      name: 'AreYouSureYouWantToDeleteThisVoice',
      desc: '',
      args: [],
    );
  }

  /// `Date – Time`
  String get DateTime {
    return Intl.message('Date – Time', name: 'DateTime', desc: '', args: []);
  }

  /// `Date Range – Time`
  String get DateRangeTime {
    return Intl.message(
      'Date Range – Time',
      name: 'DateRangeTime',
      desc: '',
      args: [],
    );
  }

  /// `Everyday, around the clock`
  String get EverydayPromoSchedule {
    return Intl.message(
      'Everyday, around the clock',
      name: 'EverydayPromoSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Hourly setting`
  String get HourlyPromoSchedule {
    return Intl.message(
      'Hourly setting',
      name: 'HourlyPromoSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Continuously`
  String get ContinuouslyPromoSchedule {
    return Intl.message(
      'Continuously',
      name: 'ContinuouslyPromoSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Set start and end dates`
  String get SetStartEndDatesPromoSchedule {
    return Intl.message(
      'Set start and end dates',
      name: 'SetStartEndDatesPromoSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get Start {
    return Intl.message('Start', name: 'Start', desc: '', args: []);
  }

  /// `Ending`
  String get Ending {
    return Intl.message('Ending', name: 'Ending', desc: '', args: []);
  }

  /// `Timing`
  String get Timing {
    return Intl.message('Timing', name: 'Timing', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'hi'),
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
