import 'package:flutter/cupertino.dart';
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

    double topPadding = data.topPadding ??
        (MediaQuery.viewPaddingOf(context).top == 0 ? 45.h : MediaQuery.viewPaddingOf(context).top + 30.h);

    ///проверяем не открыта ли клавиатура, вычитаем ее размер из верхнего отступа
    if (MediaQuery.viewInsetsOf(context).bottom != 0 && data.resizeToAvoidBottomInset) {
      topPadding -= MediaQuery.viewInsetsOf(context).bottom;
      topPadding = topPadding < 0 ? MediaQuery.viewPaddingOf(context).top + 30.h : topPadding;
    }

    return RepaintBoundary(
      child: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(onTap: Navigator.of(context).pop),
          SizedBox(
              height: 1.sh - (data.topPadding ?? 0) - MediaQuery.viewPaddingOf(context).top,
              child: ClipRRect(
                  borderRadius: BorderRadiusFoundation.onlyTop24,
                  child: ColoredBox(
                    color: Colors.black,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                                  child: data.bottomBar!,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))).paddingOnly(top: topPadding),
        ],
      ),
    );
  }
}
