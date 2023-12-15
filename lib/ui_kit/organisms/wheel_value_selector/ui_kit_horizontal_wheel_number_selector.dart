import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitHorizontalWheelNumberSelector extends StatefulWidget {
  final List<int> values;
  final String title;
  final ValueChanged<int>? onValueChanged;
  final int initialValue;
  final Color? backgroundColor;
  final Color? numbersColor;
  final bool hideTitle;

  const UiKitHorizontalWheelNumberSelector({
    Key? key,
    required this.values,
    this.title = '',
    this.onValueChanged,
    this.backgroundColor,
    this.numbersColor,
    int? initialValue,
    this.hideTitle = false,
  })  : initialValue = initialValue ?? 8,
        super(key: key);

  @override
  State<UiKitHorizontalWheelNumberSelector> createState() => _UiKitHorizontalWheelNumberSelectorState();
}

class _UiKitHorizontalWheelNumberSelectorState extends State<UiKitHorizontalWheelNumberSelector> {
  late final ValueNotifier<int> _currentValueNotifier;
  final AutoSizeGroup autoSizeGroup = AutoSizeGroup();
  final _animDuration = const Duration(milliseconds: 250);
  late final FixedExtentScrollController _scrollController;

  @override
  void initState() {
    _scrollController = FixedExtentScrollController(initialItem: widget.initialValue);
    _currentValueNotifier = ValueNotifier<int>(widget.values[widget.initialValue]);

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _currentValueNotifier.addListener(() {
        FeedbackIsolate.instance.addEvent(FeedbackIsolateRachetClickAndHaptics());
      });
    });
  }

  @override
  void dispose() {
    _currentValueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final itemWidth = 49.w;
    final itemHeight = itemWidth * 0.82;

    return UiKitCardWrapper(
      color: widget.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!widget.hideTitle)
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
                          WidgetsBinding.instance.addPostFrameCallback((timeStamp) => _scrollController.animateTo(
                              widget.values.indexOf(_currentValueNotifier.value) * itemWidth,
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.easeIn));
                          widget.onValueChanged?.call(widget.values[widget.values.indexOf(_currentValueNotifier.value)]);
                        }

                        return true;
                      },
                      child: ListWheelScrollView(
                        controller: _scrollController,
                        onSelectedItemChanged: (index) {
                          _currentValueNotifier.value = widget.values[index];
                        },
                        renderChildrenOutsideViewport: false,
                        clipBehavior: Clip.none,
                        perspective: 0.003,
                        itemExtent: itemWidth,
                        useMagnifier: false,
                        diameterRatio: 100000,
                        children: widget.values.map(
                          (e) {
                            return AnimatedBuilder(
                              animation: _currentValueNotifier,
                              builder: (context, child) {
                                final index = widget.values.indexOf(e);
                                final currentValueIndex = widget.values.indexOf(_currentValueNotifier.value);
                                final deltaIndex = (index - currentValueIndex).abs();
                                double opacity = 1;
                                if (deltaIndex > 2) opacity = 0.05;
                                if (deltaIndex == 2) opacity = 0.2;
                                if (deltaIndex == 1) opacity = 0.5;

                                return Center(
                                    child: RotatedBox(
                                        quarterTurns: 1,
                                        child: AnimatedOpacity(
                                          duration: _animDuration,
                                          opacity: opacity,
                                          child: AutoSizeText(
                                            e.toString(),
                                            group: autoSizeGroup,
                                            maxLines: 1,
                                            style: boldTextTheme?.title1.copyWith(color: widget.numbersColor),
                                            textAlign: TextAlign.center,
                                          ),
                                          // ),
                                        )).paddingSymmetric(horizontal: SpacingFoundation.horizontalSpacing4));
                              },
                              // ),
                            );
                          },
                        ).toList(),
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IgnorePointer(
                      child: SizedBox(
                        width: itemWidth,
                        height: itemHeight,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadiusFoundation.all10,
                            border: Border.all(
                              color: widget.numbersColor ?? context.uiKitTheme?.colorScheme.inverseSurface ?? Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SpacingFoundation.verticalSpace4,
        ],
      ),
    );
  }
}
