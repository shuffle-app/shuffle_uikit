import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitFameItem extends StatefulWidget {
  final UiKitAchievementsModel? uiModel;
  final bool isAvailableForPreview;

  const UiKitFameItem({super.key, this.uiModel, this.isAvailableForPreview = true});

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
    final backgroundColor = theme?.colorScheme.grayForegroundColor.withOpacity(0.16);

    return GestureDetector(
        onTap: widget.isAvailableForPreview
            ? () {
                if (modelFile != null) {
                  _showModelViewerDialog(
                      context,
                      modelFile!.file.path,
                      uiModel?.asset ??
                          'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/3dmodels/posters/cup_poster.webp');
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
              angle: 45 * pi / 180,
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
        child: SizedBox(
            height: 0.4.sh,
            child: UiKitBase3DViewer(
              localPath: filePath,
              poster: filePoster,
              autoRotate: true,
              // environmentImage: 'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/3dmodels/environments/environment1.jpeg',
            )),
      );
    });
