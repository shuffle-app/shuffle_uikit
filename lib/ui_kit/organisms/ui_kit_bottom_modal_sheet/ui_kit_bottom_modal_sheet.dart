import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBottomModalSheet extends StatelessWidget {
  final GeneralDialogData data;

  const UiKitBottomModalSheet({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final bottomSheetTheme = context.uiKitTheme?.bottomSheetTheme;
    final shape = bottomSheetTheme?.shape;

    return RepaintBoundary(
      child: Dialog(
        clipBehavior: Clip.hardEdge,
        insetPadding: EdgeInsets.zero,
        backgroundColor: bottomSheetTheme?.backgroundColor,
        shape: shape,
        child: Column(
          children: [
            const SlidingChip().paddingOnly(
              top: SpacingFoundation.verticalSpacing12,
              bottom: SpacingFoundation.verticalSpacing4,
            ),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: ShapeDecoration(
                      shape: shape ?? const RoundedRectangleBorder(),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: SingleChildScrollView(
                      primary: true,
                      physics: const ClampingScrollPhysics(),
                      child: data.child.paddingOnly(
                        bottom: data.bottomBar != null ? kBottomNavigationBarHeight * 1.5 : 0.0,
                      ),
                    ),
                  ),
                  if (data.bottomBar != null)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        decoration: const BoxDecoration(gradient: GradientFoundation.solidSurfaceLinearGradient),
                        child: data.bottomBar,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ).paddingOnly(
        top:
            data.topPadding ?? (MediaQuery.viewPaddingOf(context).top == 0 ? 45.h : MediaQuery.viewPaddingOf(context).top + 30.h),
      ),
    );
  }
}
