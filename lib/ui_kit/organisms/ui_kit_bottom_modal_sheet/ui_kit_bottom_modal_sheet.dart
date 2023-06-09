import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBottomModalSheet extends StatefulWidget {
  final Animation<double> startAnimation;
  final GeneralDialogData data;

  const UiKitBottomModalSheet(
      {super.key, required this.startAnimation, required this.data});

  @override
  State<UiKitBottomModalSheet> createState() => _UiKitBottomModalSheetState();
}

class _UiKitBottomModalSheetState extends State<UiKitBottomModalSheet>
    with TickerProviderStateMixin {
  late final AnimationController controller;

   double opacity=0;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    // controller.addListener(() { setState(() {
    //   opacity=controller.value;
    // });});
    // controller.animateTo(1);
    controller.forward();
    super.initState();
  }

  _onUpdate(DismissUpdateDetails details) {
    print('_onUpdate here');
    if(details.reached) {
      // setState(() {
      // if(controller.value>details.progress) {
      //   controller.animateBack(details.progress);
      // } else {
      //   controller.animateTo(details.progress);
      // }
      controller.reverse();
      // opacity = ((details.progress/0.4)-1).abs();
    // });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomSheetTheme = context.uiKitTheme?.bottomSheetTheme;
    final shape = bottomSheetTheme?.shape;

    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) {
        return  BackdropFilter(
            filter: ImageFilter.blur(
              // sigmaX: opacity * 50,
              sigmaX: controller.value * 50,
              // sigmaX: animation1.value * 50,
              sigmaY: controller.value * 50,
              // tileMode: TileMode.decal
            ),
            child: child);
      },
      child: SlideTransition(
          position: Tween<Offset>(
            end: Offset.zero,
            begin: const Offset(0.0, 1.0),
          ).animate(widget.startAnimation),
          child: Dismissible(
            onUpdate: _onUpdate,
              // dismissThresholds:{DismissDirection.down:0.5},
            key: Key(DateTime.now().toString()),
            direction: DismissDirection.down,
            onDismissed: (DismissDirection direction) {
              // Чтобы закрыть сам диалог (убрать серый фон)

              if (widget.data.onDismissed != _empty) {
                Future.delayed(
                  const Duration(milliseconds: 200),
                  () => widget.data.onDismissed(),
                );
              }

              Navigator.of(
                context,
              ).pop();
              // Navigator.of(context, rootNavigator: widget.data.useRootNavigator).pop();
            },
            // Отступ, чтобы не залезал на статусбар
            child: Dialog(
              clipBehavior: Clip.hardEdge,
              insetPadding: EdgeInsets.zero,
              backgroundColor: bottomSheetTheme?.backgroundColor,
              shape: shape,
              child: Column(
                children: [
                  const SlidingChip().paddingOnly(
                      top: SpacingFoundation.verticalSpacing12,
                      bottom: SpacingFoundation.verticalSpacing4),
                  Expanded(
                      child: Stack(fit: StackFit.expand, children: [
                    Container(
                        decoration: ShapeDecoration(
                          shape: shape ?? const RoundedRectangleBorder(),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: SingleChildScrollView(
                          primary: true,
                          physics: const ClampingScrollPhysics(),
                          child: Column(children: [
                            widget.data.child,
                            if (widget.data.bottomBar != null)
                              Opacity(opacity: 0, child: widget.data.bottomBar)
                          ]),
                        )),
                    if (widget.data.bottomBar != null)
                      Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                              decoration: const BoxDecoration(
                                  gradient: GradientFoundation
                                      .solidSurfaceLinearGradient),
                              child: widget.data.bottomBar))
                  ])),
                ],
              ),
            ).paddingOnly(
                top: widget.data.topPadding ??
                    (MediaQuery.of(context).viewPadding.top)),
          )),
    );
  }
}

//ignore: no-empty-block
void _empty() {}
