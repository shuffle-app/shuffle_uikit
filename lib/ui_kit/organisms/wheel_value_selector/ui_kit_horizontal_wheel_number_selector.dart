import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitHorizontalWheelNumberSelector extends StatefulWidget {
  final List<int> values;
  final String title;
  final ValueChanged<int>? onValueChanged;
  final int initialValue;

  const UiKitHorizontalWheelNumberSelector({
    Key? key,
    required this.values,
    required this.title,
    this.onValueChanged,
    this.initialValue = 8,
  }) : super(key: key);

  @override
  State<UiKitHorizontalWheelNumberSelector> createState() =>
      _UiKitHorizontalWheelNumberSelectorState();
}

class _UiKitHorizontalWheelNumberSelectorState
    extends State<UiKitHorizontalWheelNumberSelector> {
  late final ValueNotifier<int> _currentValueNotifier;

  final _animDuration = const Duration(milliseconds: 250);
  late final FixedExtentScrollController _scrollController;

  @override
  void initState() {
    _scrollController =
        FixedExtentScrollController(initialItem: widget.initialValue);
    _currentValueNotifier =
        ValueNotifier<int>(widget.values[widget.initialValue]);
    super.initState();
  }

  @override
  void dispose() {
    _currentValueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final itemHeight = 36.h;

    return LayoutBuilder(
      builder: (context, size) {

        return UiKitCardWrapper(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.title,
                style: boldTextTheme?.labelLarge,
              ).paddingOnly(
                top: EdgeInsetsFoundation.vertical16,
                left: EdgeInsetsFoundation.horizontal16,
                right: EdgeInsetsFoundation.horizontal16,
              ),
              SizedBox(
                width: 1.sw,
                height: itemHeight,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    RotatedBox(
                        quarterTurns: 3,
                        child: NotificationListener<ScrollNotification>(
                          onNotification: (scrollNotification) {
                            if (scrollNotification is ScrollEndNotification) {
                              log('scrollNotification got on _currentValueNotifier.value ${_currentValueNotifier.value}');
                              log('_scrollController got on _scrollController.selectedItem ${_scrollController.selectedItem}');
                              // log('_scrollController got on _scrollController.position ${_scrollController.position}');
                              // log('_scrollController got on _scrollController.positions ${_scrollController.positions}');
                              WidgetsBinding.instance.addPostFrameCallback(
                                  (timeStamp) => _scrollController.animateTo(
                                      widget.values.indexOf(
                                              _currentValueNotifier.value) *
                                          itemHeight,
                                      duration:
                                          const Duration(milliseconds: 100),
                                      curve: Curves.easeIn));
                            }

                            return true;
                          },
                          child: ListWheelScrollView(
                            controller: _scrollController,
                            // physics: const PageScrollPhysics(),
                            onSelectedItemChanged: (index) {
                              widget.onValueChanged?.call(widget.values[index]);
                              _currentValueNotifier.value =
                                  widget.values[index];
                            },
                            renderChildrenOutsideViewport: true,
                            clipBehavior: Clip.none,
                            perspective: 0.003,
                            // physics: const BouncingScrollPhysics(),
                            // overAndUnderCenterOpacity: 0.99,
                            itemExtent: itemHeight,
                            useMagnifier: false,
                            diameterRatio: 100000,
                            children: widget.values.map(
                              (e) {
                                return RepaintBoundary(
                                  child: AnimatedBuilder(
                                    animation: _currentValueNotifier,
                                    builder: (context, child) {
                                      final index = widget.values.indexOf(e);
                                      final currentValueIndex = widget.values
                                          .indexOf(_currentValueNotifier.value);
                                      final deltaIndex =
                                          (index - currentValueIndex).abs();
                                      double opacity = 1;
                                      if (deltaIndex > 2) opacity = 0.05;
                                      if (deltaIndex == 2) opacity = 0.5;
                                      if (deltaIndex == 1) opacity = 1;

                                      return RotatedBox(
                                        quarterTurns: 1,
                                        child: AnimatedOpacity(
                                          duration: _animDuration,
                                          opacity: opacity,
                                          child: Text(
                                            e.toString(),
                                            style: boldTextTheme?.title1,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ).paddingSymmetric(
                                          horizontal: SpacingFoundation
                                              .horizontalSpacing4);
                                    },
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        )),
                    Positioned(
                      bottom: itemHeight / 16,
                      left: 0,
                      right: 0,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AnimatedBuilder(
                              animation: _currentValueNotifier,
                              builder: (context, child) {
                                return Container(
                                  width: itemHeight,
                                  height: itemHeight * 0.9,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    //context.uiKitTheme?.cardColor,
                                    borderRadius: BorderRadiusFoundation.all10,
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                  ),
                                  // child:

                                  // Center(
                                  //   child: Text(
                                  //     _currentValueNotifier.value.toString(),
                                  //     style: boldTextTheme?.title1,
                                  //   ).paddingAll(EdgeInsetsFoundation.all4),
                                  // ),
                                );
                              },
                            )
                          ]),
                    ),
                  ],
                ),
              ),
              SpacingFoundation.verticalSpace4,
            ],
          ),
        );
      },
    );
  }

  bool _isValueInTheCenter(int valueIndex, int listLength) {
    int range = (listLength / 7).floor();
    if (valueIndex + range >= listLength) {
      return false;
    } else if (valueIndex - range <= 0) {
      return false;
    }
    return true;
  }
}
