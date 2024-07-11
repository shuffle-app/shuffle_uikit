import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitFameItem extends StatefulWidget {
  final UiKitAchievementsModel? uiModel;
  final bool isAvailableForPreview;
  final bool preserveDarkTheme;
  final VoidCallback? onTap;

  const UiKitFameItem({
    super.key,
    this.uiModel,
    this.onTap,
    this.isAvailableForPreview = true,
    this.preserveDarkTheme = false,
  });

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
                if (modelFile != null && widget.onTap != null) {
                  widget.onTap!.call();
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
            if (uiModel?.posterUrl != null)
              ImageWidget(
                link: uiModel!.posterUrl,
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
