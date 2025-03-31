import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class ProfileStats {
  const ProfileStats();

  String getStringValue(int value) {
    if (value >= 100000) {
      return '99k+';
    }
    return '${value > 1000 ? '${value ~/ 1000}k+' : value}';
  }

  Gradient? getGradient(int value) {
    if (value < 500) return null;
    if (value < 1000) return GradientFoundation.bronzeGradient;
    if (value < 2000) return GradientFoundation.silverGradient;
    return GradientFoundation.goldGradient;
  }

  List<ProfileHighlightCard> get profileHighlightCards;

  List<UiKitCardWrapper> getUiKitCards(BuildContext context);
}

class InfluencerStats extends ProfileStats {
  final int placesVisited;
  final int reviewsPosted;
  final int points;

  const InfluencerStats({required this.placesVisited, required this.reviewsPosted, required this.points});

  @override
  List<ProfileHighlightCard> get profileHighlightCards => [
        ProfileHighlightCard(
          title: S.current.PlacesVisitedInf,
          value: getStringValue(placesVisited),
          valueGradient: getGradient(placesVisited),
        ),
        ProfileHighlightCard(
          title: S.current.ReviewsPostedInf,
          value: getStringValue(reviewsPosted),
          valueGradient: getGradient(reviewsPosted),
        ),
        ProfileHighlightCard(
          title: S.current.PointsEarnedInf,
          value: getStringValue(points),
          valueGradient: getGradient(points),
        ),
      ];

  @override
  List<UiKitCardWrapper> getUiKitCards(context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;
    final TextStyle? valueStyle = theme?.boldTextTheme.caption2Bold;
    final TextStyle? titleStyle = theme?.regularTextTheme.caption2.copyWith(color: colorScheme?.grayForegroundColor);
    return [
      UiKitCardWrapper(
          borderRadius: BorderRadiusFoundation.all8,
          color: colorScheme?.surface2,
          padding: EdgeInsets.all(EdgeInsetsFoundation.all4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GradientableWidget(
                  gradient: getGradient(placesVisited),
                  child: Text(
                    getStringValue(placesVisited),
                    style: valueStyle,
                    textAlign: TextAlign.center,
                  )),
              SpacingFoundation.horizontalSpace8,
              Text(
                S.current.PlacesVisitedInf,
                style: titleStyle,
              )
            ],
          )),
      UiKitCardWrapper(
          borderRadius: BorderRadiusFoundation.all8,
          color: colorScheme?.surface2,
          padding: EdgeInsets.all(EdgeInsetsFoundation.all4),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            GradientableWidget(
                gradient: getGradient(reviewsPosted),
                child: Text(
                  getStringValue(reviewsPosted),
                  style: valueStyle,
                  textAlign: TextAlign.center,
                )),
            SpacingFoundation.horizontalSpace8,
            Text(
              S.current.ReviewsPostedInf,
              style: titleStyle,
            )
          ])),
      UiKitCardWrapper(
          borderRadius: BorderRadiusFoundation.all8,
          color: colorScheme?.surface2,
          padding: EdgeInsets.all(EdgeInsetsFoundation.all4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GradientableWidget(
                  gradient: getGradient(points),
                  child: Text(
                    getStringValue(points),
                    style: valueStyle,
                    textAlign: TextAlign.center,
                  )),
              SpacingFoundation.horizontalSpace8,
              Text(
                S.current.Points,
                style: titleStyle,
              )
            ],
          )),
    ];
  }
}

class ProProfileStats extends ProfileStats {
  final int eventsCreated;
  final int reviewsReceived;
  final int bookingsReceived;

  const ProProfileStats({required this.eventsCreated, required this.reviewsReceived, required this.bookingsReceived});

  @override
  List<ProfileHighlightCard> get profileHighlightCards => [
        ProfileHighlightCard(
          title: S.current.Events,
          value: getStringValue(eventsCreated),
          valueGradient: getGradient(eventsCreated),
        ),
        ProfileHighlightCard(
          title: '${S.current.ReviewsReceived(4).capitalize()} ${S.current.Received.toLowerCase()}',
          value: getStringValue(reviewsReceived),
          valueGradient: getGradient(reviewsReceived),
        ),
        ProfileHighlightCard(
          title: S.current.BookingsHeading,
          value: getStringValue(bookingsReceived),
          valueGradient: getGradient(bookingsReceived),
        ),
      ];

  @override
  List<UiKitCardWrapper> getUiKitCards(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;
    final TextStyle? valueStyle = theme?.boldTextTheme.caption2Bold;
    final TextStyle? titleStyle = theme?.regularTextTheme.caption2.copyWith(color: colorScheme?.grayForegroundColor);
    return [
      UiKitCardWrapper(
          borderRadius: BorderRadiusFoundation.all8,
          color: colorScheme?.surface2,
          padding: EdgeInsets.all(EdgeInsetsFoundation.all4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GradientableWidget(
                  gradient: getGradient(eventsCreated),
                  child: Text(
                    getStringValue(eventsCreated),
                    style: valueStyle,
                    textAlign: TextAlign.center,
                  )),
              SpacingFoundation.horizontalSpace8,
              Text(
                S.current.Events,
                style: titleStyle,
              )
            ],
          )),
      UiKitCardWrapper(
          borderRadius: BorderRadiusFoundation.all8,
          color: colorScheme?.surface2,
          padding: EdgeInsets.all(EdgeInsetsFoundation.all4),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            GradientableWidget(
                gradient: getGradient(reviewsReceived),
                child: Text(
                  getStringValue(reviewsReceived),
                  style: valueStyle,
                  textAlign: TextAlign.center,
                )),
            SpacingFoundation.horizontalSpace8,
            Text(
              '${S.current.ReviewsReceived(4).capitalize()} ${S.current.Received.toLowerCase()}',
              style: titleStyle,
            )
          ])),
      UiKitCardWrapper(
          borderRadius: BorderRadiusFoundation.all8,
          color: colorScheme?.surface2,
          padding: EdgeInsets.all(EdgeInsetsFoundation.all4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GradientableWidget(
                  gradient: getGradient(bookingsReceived),
                  child: Text(
                    getStringValue(bookingsReceived),
                    style: valueStyle,
                    textAlign: TextAlign.center,
                  )),
              SpacingFoundation.horizontalSpace8,
              Text(
                S.current.BookingsHeading,
                style: titleStyle,
              )
            ],
          )),
    ];
  }
}
