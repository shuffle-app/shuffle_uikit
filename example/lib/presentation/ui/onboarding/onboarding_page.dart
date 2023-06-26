import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  double _progress = 0;
  String _imageLink = GraphicsFoundation.instance.png.onboardingMock1.path;
  final List<String> _images = [
    GraphicsFoundation.instance.png.onboardingMock1.path,
    GraphicsFoundation.instance.png.onboardingMock2.path,
    GraphicsFoundation.instance.png.onboardingMock3.path,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 0,
            child: ImageWidget(
              link: _imageLink,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
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
              ImageWidget(
                svgAsset: GraphicsFoundation.instance.svg.shuffleWhite,
                fit: BoxFit.fitWidth,
              ).paddingSymmetric(horizontal: MediaQuery.of(context).size.width * 0.215625),
              SpacingFoundation.verticalSpace24,
              Text(
                'to explore leisure and business',
                style: context.uiKitTheme?.boldTextTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              context
                  .buttonWithProgress(
                    data: BaseUiKitButtonData(
                      text: 'NEXT >>>',
                      onPressed: () => setState(() {
                        _progress += 0.1;
                        if (_progress > 1) _progress = 0;
                        final index = _images.indexOf(_imageLink);
                        if (index == _images.length - 1) {
                          _imageLink = _images[0];
                        } else if (index < _images.length - 1) {
                          _imageLink = _images[index + 1];
                        }
                      }),
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
