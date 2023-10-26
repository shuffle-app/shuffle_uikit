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
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
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
