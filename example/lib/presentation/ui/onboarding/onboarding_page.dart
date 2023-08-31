import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OnBoardingPage extends StatefulWidget {
  final Duration transitionDuration;
  final VoidCallback? onFinished;
  final List<OnBoardingPageItem> items;
  final String logoLink;

  const OnBoardingPage({
    super.key,
    this.transitionDuration = const Duration(milliseconds: 500),
    this.onFinished,
    required this.logoLink,
    required this.items,
  });

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> with SingleTickerProviderStateMixin {
  late final AnimationController _progressAnimationController = AnimationController(
    vsync: this,
    duration: overallDuration,
    value: 0,
  )..addListener(_animationListener);

  final _firstItemFadeInDuration = const Duration(milliseconds: 500);

  double _textOpacity = 0;
  double _logoOpacity = 0;
  double _imageOpacity = 0;

  int currentIndex = 0;

  double get currentItemProgressPortion =>
      ((widget.items.elementAt(currentIndex).autoSwitchDuration.inMilliseconds + (widget.transitionDuration * 3).inMilliseconds) /
          overallDuration.inMilliseconds) *
      (currentIndex + 1);

  double get divisionWidth => 1 / widget.items.length;

  Duration get overallDuration {
    Duration duration = Duration.zero;
    for (final item in widget.items) {
      /// add total duration for the item with fade in and fade out durations
      duration += item.autoSwitchDuration + (widget.transitionDuration * 3);
    }
    return duration;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _progressAnimationController.forward(from: 0);
      await Future.delayed(_firstItemFadeInDuration);
      setState(() {
        _textOpacity = 1;
        _logoOpacity = 1;
      });
      Future.delayed(_firstItemFadeInDuration * 2, () => setState(() => _imageOpacity = 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 0,
            child: AnimatedOpacity(
              duration: widget.transitionDuration,
              opacity: _imageOpacity,
              child: AnimatedSwitcher(
                duration: widget.transitionDuration,
                child: ImageWidget(
                  key: UniqueKey(),
                  link: widget.items.elementAt(currentIndex).imageLink,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).viewPadding.top,
              ),
              SpacingFoundation.verticalSpace24,
              AnimatedOpacity(
                duration: widget.transitionDuration,
                opacity: _logoOpacity,
                child: ImageWidget(
                  link: widget.logoLink,
                  fit: BoxFit.fitWidth,
                ).paddingSymmetric(horizontal: MediaQuery.of(context).size.width * 0.215625),
              ),
              SpacingFoundation.verticalSpace24,
              AnimatedOpacity(
                duration: widget.transitionDuration,
                opacity: _textOpacity,
                child: Text(
                  key: UniqueKey(),
                  widget.items.elementAt(currentIndex).title,
                  style: context.uiKitTheme?.boldTextTheme.titleLarge,
                  textAlign: TextAlign.center,
                ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal32),
              ),
              const Spacer(),
              AnimatedBuilder(
                animation: _progressAnimationController,
                builder: (context, value) {
                  return context
                      .buttonWithProgress(
                        data: BaseUiKitButtonData(
                          text: 'NEXT >>>',
                          onPressed: () {
                            if (currentIndex != widget.items.length) {
                              _switchToNextPage();
                            } else {
                              widget.onFinished?.call();
                            }
                            // _progressAnimationController.forward(from: 0);
                            // setState(() {
                            //   currentIndex = 0;
                            // });
                          },
                        ),
                        progress: _progressAnimationController.value,
                        blurred: true,
                      )
                      .paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16);
                },
              ),
              SpacingFoundation.verticalSpace24,
            ],
          ),
        ],
      ),
    );
  }

  void _animationListener() async {
    final value = _progressAnimationController.value;

    if (value >= currentItemProgressPortion) {
      if (currentIndex != widget.items.length - 1 && _textOpacity != 0) {
        _switchToNextPage();
      }
    }
    if (value == 1.0) widget.onFinished?.call();
  }

  Future<void> _switchToNextPage() async {
    setState(() {
      _textOpacity = 0;
      _imageOpacity = 0;
    });

    await Future.delayed(widget.transitionDuration);

    setState(() {
      _textOpacity = 1;
      currentIndex++;
    });
    await Future.delayed(widget.transitionDuration * 2);
    setState(() => _imageOpacity = 1);
  }
}

class OnBoardingPageItem {
  /// the image link can be a network image or an asset image
  final String imageLink;

  /// the title of the page
  final String title;

  /// if you need an item to stay longer than the default duration
  /// you can pass a custom duration
  final Duration autoSwitchDuration;

  const OnBoardingPageItem({
    required this.imageLink,
    required this.title,
    this.autoSwitchDuration = const Duration(milliseconds: 1500),
  });
}
