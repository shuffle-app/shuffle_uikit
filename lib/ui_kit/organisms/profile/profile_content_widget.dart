import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ProfileContentWidget extends StatelessWidget {
  final VoidCallback? onCalendarTap;
  final String? title;
  final AutoSizeGroup? group;
  final bool showCalendar;
  final bool showHallOfFrame;
  final List<UiKitAchievementsModel> achievements;
  final VoidCallback? onViewAllAchievements;

  ProfileContentWidget({
    super.key,
    this.onCalendarTap,
    this.onViewAllAchievements,
    this.title,
    this.group,
    this.showCalendar = false,
    this.showHallOfFrame = false,
    this.achievements = const [],
  });

  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return GestureDetector(
        onTap: onCalendarTap ?? onViewAllAchievements,
        child: UiKitCardWrapper(
          color: theme?.colorScheme.surface2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SpacingFoundation.verticalSpace12,
              AutoSizeText(
                title ?? S.of(context).NothingFound,
                maxLines: 1,
                group: group,
                minFontSize: 10,
                textAlign: TextAlign.center,
                style: theme?.boldTextTheme.caption1Bold,
              ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing12),
              if (showCalendar) ...[
                SpacingFoundation.verticalSpace12,
                ImageWidget(
                  width: 80.w,
                  height: 1.sw <= 380 ? 72.h : 58.5.h,
                  link: GraphicsFoundation.instance.png.calendarWatch.path,
                ).paddingSymmetric(
                  horizontal: SpacingFoundation.horizontalSpacing12,
                ),
                SpacingFoundation.verticalSpace12,
              ],
              if (showHallOfFrame) ...[
                SpacingFoundation.verticalSpace12,
                SizedBox(
                  height: 1.sw <= 380 ? 72.h : 58.5.h,
                  child: ListenableBuilder(
                    listenable: _currentIndex,
                    builder: (context, child) => AchievementsCarouselSlider(
                      isCenterWidget: (value) {
                        _currentIndex.value = value ?? 0;
                      },
                      listOfItems: List.generate(
                        achievements.length,
                        (index) => UiKitFameItem(
                          showStar: _currentIndex.value == index,
                          isAvailableForPreview: false,
                          uiModel: achievements[index],
                        ),
                      ),
                    ),
                  ),
                ),
                SpacingFoundation.verticalSpace12,
              ],
            ],
          ),
        ));
  }
}
