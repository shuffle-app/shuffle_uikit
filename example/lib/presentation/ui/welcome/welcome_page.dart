import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class WelcomePage extends StatefulWidget {
  final VoidCallback? onFinished;

  const WelcomePage({
    Key? key,
    this.onFinished,
  }) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {
  late final animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 10000),
  );
  CrossFadeState crossFadeState = CrossFadeState.showFirst;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      animationController.forward(from: 0);
      animationController.addListener(() {
        if (animationController.isCompleted) setState(() => crossFadeState = CrossFadeState.showSecond);
      });
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bigHeight = 1.sh > 568;

    return Scaffold(
      body: AnimatedCrossFade(
        duration: const Duration(milliseconds: 500),
        crossFadeState: crossFadeState,
        firstChild: _FirstBody(
          bigScreen: bigHeight,
          animationController: animationController,
          onFinished: () => setState(() => crossFadeState = CrossFadeState.showSecond),
        ),
        secondChild: _LastBody(
          bigScreen: bigHeight,
          onFinished: widget.onFinished,
        ),
      ),
    );
  }
}

class _FirstBody extends StatelessWidget {
  final bool bigScreen;
  final VoidCallback? onFinished;
  final AnimationController animationController;

  const _FirstBody({
    Key? key,
    required this.bigScreen,
    required this.animationController,
    this.onFinished,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    Widget spacing = SpacingFoundation.verticalSpace16;
    if (bigScreen) spacing = SpacingFoundation.verticalSpace24;

    return Stack(
      fit: StackFit.expand,
      children: [
        ImageWidget(
          rasterAsset: GraphicsFoundation.instance.png.welcomeSlide1,
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top + SpacingFoundation.verticalSpacing24,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: UiKitIconedBlurMessageCard(
                borderRadius: BorderRadiusFoundation.all24,
                orientation: Axis.vertical,
                message: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'What is \n',
                        style: textTheme?.caption1Medium,
                      ),
                      TextSpan(
                        text: 'shuffle ',
                        style: textTheme?.caption1Bold,
                      ),
                      TextSpan(
                        text: 'for',
                        style: textTheme?.caption1Medium,
                      ),
                    ],
                  ),
                ),
                iconLink: GraphicsFoundation.instance.svg.whiteStarTransparentCenter.path,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: UiKitIconedBlurMessageCard(
                message: Text(
                  'Through a non-\naggregator system \nespecially for you',
                  style: textTheme?.caption1Bold,
                ),
                iconLink: GraphicsFoundation.instance.svg.whiteStarTransparentCenter.path,
              ),
            ),
            spacing,
            Align(
              alignment: Alignment.centerRight,
              child: UiKitIconedBlurMessageCard(
                message: Text(
                  'With your\npreferences',
                  style: textTheme?.caption1Bold,
                ),
                iconLink: GraphicsFoundation.instance.svg.whiteStarTransparentCenter.path,
              ),
            ),
            spacing,
            Align(
              alignment: Alignment.centerLeft,
              child: UiKitIconedBlurMessageCard(
                crossAxisAlignment: CrossAxisAlignment.center,
                message: Text(
                  'Don\'t be alone',
                  style: textTheme?.caption1Bold,
                ),
                iconLink: GraphicsFoundation.instance.svg.whiteStarTransparentCenter.path,
              ),
            ),
            spacing,
            Align(
              alignment: Alignment.centerRight,
              child: UiKitIconedBlurMessageCard(
                message: Text(
                  'Lovely-touch amazing\ninteraction',
                  style: textTheme?.caption1Bold,
                ),
                iconLink: GraphicsFoundation.instance.svg.whiteStarTransparentCenter.path,
              ),
            ),
            if (!bigScreen) SpacingFoundation.verticalSpace24,
            if (bigScreen) const Spacer(),
            AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return context.buttonWithProgress(
                  data: BaseUiKitButtonData(
                    text: 'NEXT >>>',
                    onPressed: () {
                      animationController.forward(from: 0);
                      onFinished?.call();
                    },
                  ),
                  blurred: false,
                  progress: animationController.value,
                );
              },
            ),
            SpacingFoundation.verticalSpace24,
          ],
        ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16)
      ],
    );
  }
}

class _LastBody extends StatelessWidget {
  final bool bigScreen;
  final VoidCallback? onFinished;

  const _LastBody({
    Key? key,
    required this.bigScreen,
    this.onFinished,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return Stack(
      fit: StackFit.expand,
      children: [
        ImageWidget(
          rasterAsset: GraphicsFoundation.instance.png.welcomeSlide2,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0.3.sh,
          child: ImageWidget(
            svgAsset: GraphicsFoundation.instance.svg.bigCuttedLogo,
            width: 1.sw,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          width: 1.sw,
          bottom: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SpacingFoundation.verticalSpace24,
              Text(
                'This is shuffle',
                style: textTheme?.title1,
                textAlign: TextAlign.center,
              ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal32 * 2),
              SpacingFoundation.verticalSpace16,
              Text(
                'Smart leisure selection for everyone, everywhere.',
                style: textTheme?.subHeadline,
                textAlign: TextAlign.center,
              ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal32),
              if (bigScreen) ...[
                SpacingFoundation.verticalSpace24,
                SpacingFoundation.verticalSpace24,
                SpacingFoundation.verticalSpace12,
              ],
              if (!bigScreen) SpacingFoundation.verticalSpace16,
              context
                  .button(
                    data: BaseUiKitButtonData(
                      text: 'Get started',
                      onPressed: onFinished,
                    ),
                  )
                  .paddingSymmetric(
                    horizontal: EdgeInsetsFoundation.horizontal16,
                  ),
              SpacingFoundation.verticalSpace24,
            ],
          ),
        ),
      ],
    );
  }
}
