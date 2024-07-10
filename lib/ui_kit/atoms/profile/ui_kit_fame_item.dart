import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitFameItem extends StatefulWidget {
  final UiKitAchievementsModel? uiModel;
  final bool isAvailableForPreview;
  final bool preserveDarkTheme;

  const UiKitFameItem({super.key, this.uiModel, this.isAvailableForPreview = true, this.preserveDarkTheme = false});

  @override
  State<UiKitFameItem> createState() => _UiKitFameItemState();
}

class _UiKitFameItemState extends State<UiKitFameItem> with RouteAware {
  UiKitAchievementsModel? uiModel;
  FileInfo? modelFile;
  double? downloadProgress = 0;
  bool isLoading = false;

  Key? viewerKey = UniqueKey();

  var listOfStars = {
    7: const Offset(20, 15),
    6: const Offset(25, -25),
    8: const Offset(-30, 15),
    5: const Offset(-10, 30),
    10: const Offset(-20, -25),
  };

  @override
  void didPush() {
    if (mounted) {
      setState(() {
        listOfStars = {};
      });
    }
    super.didPush();
  }

  @override
  void didPop() {
    if (mounted) {
      setState(() {
        listOfStars = {
          7: const Offset(20, 15),
          6: const Offset(25, -25),
          8: const Offset(-30, 15),
          5: const Offset(-10, 30),
          10: const Offset(-20, -25),
        };
      });
    }
    super.didPop();
  }

  @override
  void initState() {
    uiModel = widget.uiModel;
    if (uiModel?.objectUrl != null) {
      CustomCacheManager.personsInstance.getFileStream(uiModel!.objectUrl!).listen((value) {
        if (value.runtimeType == DownloadProgress) {
          setState(() {
            downloadProgress = (value as DownloadProgress).progress;
          });
        } else if (value.runtimeType == FileInfo) {
          setState(() {
            modelFile = value as FileInfo;
            isLoading = false;
          });
        }
      });
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant UiKitFameItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.uiModel != widget.uiModel) {
      setState(() {
        uiModel = widget.uiModel;
      });
      CustomCacheManager.personsInstance.getFileStream(uiModel!.objectUrl!).listen((value) {
        if (value.runtimeType == DownloadProgress) {
          setState(() {
            downloadProgress = (value as DownloadProgress).progress;
          });
        } else if (value.runtimeType == FileInfo) {
          setState(() {
            modelFile = value as FileInfo;
            isLoading = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final backgroundColor =
        (widget.preserveDarkTheme ? ColorsFoundation.darkNeutral100 : theme?.colorScheme.grayForegroundColor)
            ?.withOpacity(0.16);

    return GestureDetector(
        onTap: widget.isAvailableForPreview
            ? () {
                if (modelFile != null) {
                  _showModelViewerDialog(context, modelFile!.file.path, uiModel?.asset ?? '');
                } else {
                  SnackBarUtils.show(message: 'Waiting for model to download', context: context);
                }
              }
            : null,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              // quarterTurns: 2,
              angle: 45 * math.pi / 180,
              child: SizedBox(
                  height: 50,
                  width: 50,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusFoundation.all8,
                        color: backgroundColor,
                        backgroundBlendMode: uiModel != null ? BlendMode.plus : null,
                        gradient: uiModel != null ? GradientFoundation.fameLinearGradient : null),
                  )),
            ),
            if (uiModel?.asset != null)
              ImageWidget(
                link: uiModel!.asset,
                height: 45,
                width: 45,
                fit: BoxFit.contain,
              ),
            ...listOfStars.entries.map((e) => Transform.translate(
                offset: e.value,
                child: uiModel != null
                    ? UiKitFloatingAnimation(
                        child: GradientableWidget(
                            active: uiModel != null,
                            gradient: GradientFoundation.defaultRadialGradient,
                            child: ImageWidget(
                              height: e.key.sp,
                              width: e.key.sp,
                              fit: BoxFit.contain,
                              svgAsset: GraphicsFoundation.instance.svg.star2,
                              color: uiModel != null ? Colors.white : backgroundColor,
                            )))
                    : GradientableWidget(
                        active: uiModel != null,
                        gradient: GradientFoundation.defaultRadialGradient,
                        child: ImageWidget(
                          height: e.key.sp,
                          width: e.key.sp,
                          fit: BoxFit.contain,
                          svgAsset: GraphicsFoundation.instance.svg.star2,
                          color: uiModel != null ? Colors.white : backgroundColor,
                        ))))
          ],
        ));
  }
}

_showModelViewerDialog(BuildContext context, String filePath, String filePoster) => showGeneralDialog(
    barrierColor: Colors.black.withOpacity(0.5),
    transitionBuilder: (context, a1, a2, widget) {
      return Transform.scale(
        scale: a1.value,
        child: Opacity(
          opacity: a1.value,
          child: widget,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 200),
    barrierDismissible: true,
    barrierLabel: '',
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return Dialog(
        backgroundColor: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusFoundation.all24,
        ),
        // child: SizedBox(
        //     height: 0.4.sh,
        //     child: UiKitBase3DViewer(
        //       localPath: filePath,
        //       poster: filePoster,
        //       autoRotate: true,
        //       // environmentImage: 'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/3dmodels/environments/environment1.jpeg',
        //     )),
        child: PrizeDialog(
          filePath: filePath,
          filePoster: filePoster,
          uiRewardProgressModel: UiRewardProgressModel(
            current: 50,
            total: 100,
            title: 'Test',
          ),
        ),
      );
    });

class PrizeDialog extends StatelessWidget {
  final UiRewardProgressModel? uiRewardProgressModel;
  final String filePath;
  final String filePoster;
  const PrizeDialog({
    super.key,
    this.uiRewardProgressModel,
    required this.filePath,
    required this.filePoster,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: ImageWidget(
            iconData: ShuffleUiKitIcons.cross,
            color: theme?.colorScheme.darkNeutral900,
            height: 19.h,
            fit: BoxFit.fitHeight,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        UiKitCardWrapper(
          color: theme?.colorScheme.surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                uiRewardProgressModel?.title ?? S.of(context).NothingFound,
                style: theme?.boldTextTheme.title2,
              ),
              SizedBox(height: 35.h),
              Center(
                child: Stack(children: [
                  Transform.rotate(
                    angle: 45 * math.pi / 180,
                    child: SizedBox(
                      height: 130.h,
                      width: 190.w,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusFoundation.all24r,
                          color: ColorsFoundation.darkNeutral100.withOpacity(0.16),
                          backgroundBlendMode: BlendMode.plus,
                          gradient: GradientFoundation.fameLinearGradient,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 130.h,
                    width: 190.w,
                    child: UiKitBase3DViewer(
                      localPath: filePath,
                      poster: filePoster,
                      autoRotate: true,
                      // environmentImage:
                      //     'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/3dmodels/environments/environment1.jpeg',
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 50.h),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Points and Levels: ',
                      style: theme?.boldTextTheme.caption2Bold,
                    ),
                    TextSpan(
                      text: 'Users can earn points or level up based on their achievements.\n',
                      style: theme?.regularTextTheme.caption2,
                    ),
                    TextSpan(
                      text: 'Unlockable Rewards: ',
                      style: theme?.boldTextTheme.caption2Bold,
                    ),
                    TextSpan(
                      text: 'Special features, charms, or badges.',
                      style: theme?.regularTextTheme.caption2,
                    ),
                  ],
                ),
              ),
              SpacingFoundation.verticalSpace16,
              Text(
                '100 Reviews',
                style: theme?.boldTextTheme.body,
              ),
              SpacingFoundation.verticalSpace4,
              Row(
                children: [
                  Text(
                    S.of(context).YourProgress,
                    style: theme?.regularTextTheme.caption1,
                  ),
                  const Spacer(),
                  Text(
                    '${uiRewardProgressModel?.current.toInt() ?? 0}/${uiRewardProgressModel?.total.toInt() ?? 1}',
                    style: theme?.regularTextTheme.caption1,
                  ),
                ],
              ),
              SpacingFoundation.verticalSpace2,
              LinearInfluencerIndicatorTest(
                width: 0.81.sw,
                actualSum: uiRewardProgressModel?.current ?? 0.0,
                sum: uiRewardProgressModel?.total ?? 1.0,
              )
            ],
          ).paddingAll(EdgeInsetsFoundation.all24),
        )
      ],
    ).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing16);
  }
}

class UiRewardProgressModel {
  final String? title;
  final double current;
  final double total;

  UiRewardProgressModel({
    this.title,
    this.current = 1,
    this.total = 1,
  });
}

class LinearInfluencerIndicatorTest extends StatelessWidget {
  final double actualSum;
  final double sum;
  final double? width;

  LinearInfluencerIndicatorTest({
    super.key,
    required this.actualSum,
    required this.sum,
    this.width,
  });

  late final double _indicatorWidth = width ?? 256.w;

  double get _progressPosition => _indicatorWidth * (_progressValue / 120);
  double get _progressValue => ((actualSum / sum) * 120);

  double _getCurrentPosition(double currentPosition) {
    if (currentPosition > _indicatorWidth) {
      return _indicatorWidth;
    }

    return currentPosition;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.uiKitTheme?.colorScheme;

    return ClipRRect(
      borderRadius: BorderRadiusFoundation.all40,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          ColoredBox(
            color: colorScheme?.surface3 ?? Colors.white,
            child: SizedBox(
              height: 6.h,
              width: _indicatorWidth,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: AnimatedContainer(
                  width: _getCurrentPosition(_progressPosition),
                  curve: Curves.ease,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusFoundation.all40,
                    gradient: GradientFoundation.touchIdLinearGradient,
                    color: Colors.white,
                  ),
                  duration: const Duration(milliseconds: 300),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
