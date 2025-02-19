import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

noShowsBottomSheet(BuildContext context) {
  final bool isBigScreen = 1.sw > 380;
  final theme = context.uiKitTheme;
  final boldTextTheme = theme?.boldTextTheme;
  final List<OpportunitiesUiModel> opportunitiesList = [
    OpportunitiesUiModel(
      title: S.current.Reminder,
      description: S.current.RemindThoseWhoInteractedWithYourContent,
      iconPath: GraphicsFoundation.instance.png.noShows.remind,
    ),
    OpportunitiesUiModel(
      title: S.current.Notification,
      description: S.current.NotifyPotentiallyInterestedAudiences,
      iconPath: GraphicsFoundation.instance.png.notif,
    ),
    OpportunitiesUiModel(
      title: S.current.Offer,
      description: S.current.OfferBonusToYourGuestsThroughShuffleActivity,
      iconPath: GraphicsFoundation.instance.png.noShows.offer,
    ),
    OpportunitiesUiModel(
      title: S.current.Refresher,
      description: S.current.RemindYourBookingsOneWeekOneDay,
      iconPath: GraphicsFoundation.instance.png.noShows.startNotif,
    ),
    OpportunitiesUiModel(
      title: S.current.SurveyForNoShowsUsers,
      description: S.current.IncludeASurveyForNoShows,
      iconPath: GraphicsFoundation.instance.png.noShows.survey,
    ),
    OpportunitiesUiModel(
      title: S.current.Agenda,
      description: S.current.AddAnAgendaAndHighlightTheSpeakers,
      iconPath: GraphicsFoundation.instance.png.noShows.agenda,
    ),
  ];

  return showUiKitGeneralFullScreenDialog(
    context,
    GeneralDialogData(
      isWidgetScrollable: true,
      topPadding: isBigScreen ? 0.4.sw : null,
      child: Column(
        children: [
          SpacingFoundation.verticalSpace16,
          Text(
            S.of(context).UseYourOpportunities,
            style: boldTextTheme?.title2,
            textAlign: TextAlign.center,
          ),
          SpacingFoundation.verticalSpace24,
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: opportunitiesList.length,
              separatorBuilder: (context, index) => SpacingFoundation.verticalSpace4,
              itemBuilder: (context, index) {
                final opportunity = opportunitiesList[index];

                return UiKitCardWrapper(
                  color: theme?.colorScheme.surface1,
                  borderRadius: BorderRadiusFoundation.all12,
                  child: Row(
                    children: [
                      ImageWidget(
                        width: 32.w,
                        height: 32.w,
                        rasterAsset: opportunity.iconPath,
                      ),
                      SpacingFoundation.horizontalSpace8,
                      SizedBox(
                        width: 0.7.sw,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              opportunity.title,
                              style: boldTextTheme?.caption1Bold,
                            ),
                            SpacingFoundation.verticalSpace2,
                            Text(
                              opportunity.description,
                              style: theme?.regularTextTheme.caption4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ).paddingAll(EdgeInsetsFoundation.all8),
                );
              },
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing16),
    ),
  );
}

class OpportunitiesUiModel {
  final String title;
  final AssetGenImage iconPath;
  final String description;

  OpportunitiesUiModel({
    required this.title,
    required this.iconPath,
    required this.description,
  });
}
