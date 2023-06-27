import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final _animDuration = const Duration(milliseconds: 250);
  late double _progress = 1 / _items.length;
  double _textOpacity = 0;
  double _logoOpacity = 0;
  double _imageOpacity = 0;

  int get currentIndex {
    if (_progress == 0) return 0;
    final index = _progress ~/ (1 / _items.length);
    return index - 1;
  }

  final List<OnBoardingPageItem> _items = [
    OnBoardingPageItem(
      imageLink: GraphicsFoundation.instance.png.onboardingMock1.path,
      title: 'to have some fun',
    ),
    OnBoardingPageItem(
      imageLink: GraphicsFoundation.instance.png.onboardingMock2.path,
      title: 'to explore leisure and business',
    ),
    OnBoardingPageItem(
      imageLink: GraphicsFoundation.instance.png.onboardingMock3.path,
      title: 'to just chill out',
    ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _textOpacity = 1;
        _logoOpacity = 1;
      });
      Future.delayed(_animDuration * 2, () => setState(() => _imageOpacity = 1));
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
              duration: _animDuration,
              opacity: _imageOpacity,
              child: AnimatedSwitcher(
                duration: _animDuration,
                child: ImageWidget(
                  key: UniqueKey(),
                  link: _items.elementAt(currentIndex).imageLink,
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
                duration: _animDuration,
                opacity: _logoOpacity,
                child: ImageWidget(
                  svgAsset: GraphicsFoundation.instance.svg.shuffleWhite,
                  fit: BoxFit.fitWidth,
                ).paddingSymmetric(horizontal: MediaQuery.of(context).size.width * 0.215625),
              ),
              SpacingFoundation.verticalSpace24,
              AnimatedOpacity(
                duration: _animDuration,
                opacity: _textOpacity,
                child: Text(
                  key: UniqueKey(),
                  _items.elementAt(currentIndex).title,
                  style: context.uiKitTheme?.boldTextTheme.titleLarge,
                  textAlign: TextAlign.center,
                ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal32),
              ),
              const Spacer(),
              context
                  .buttonWithProgress(
                    data: BaseUiKitButtonData(
                      text: 'NEXT >>>',
                      onPressed: () {
                        setState(() {
                          _textOpacity = 0;
                          _imageOpacity = 0;
                        });
                        Future.delayed(
                          _animDuration,
                          () => setState(() {
                            _progress += 1 / _items.length;
                            if (_progress > 1) _progress = 1 / _items.length;
                          }),
                        );
                        Future.delayed(_animDuration, () => setState(() => _textOpacity = 1));
                        Future.delayed(_animDuration * 3, () => setState(() => _imageOpacity = 1));
                      },
                    ),
                    progress: _progress,
                    blurred: true,
                  )
                  .paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
              SpacingFoundation.verticalSpace24,
            ],
          ),
        ],
      ),
    );
  }
}

class OnBoardingPageItem {
  final String imageLink;
  final String title;

  const OnBoardingPageItem({
    required this.imageLink,
    required this.title,
  });
}
