import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ExamplesPage extends StatefulWidget {
  const ExamplesPage({Key? key}) : super(key: key);

  @override
  State<ExamplesPage> createState() => _ExamplesPageState();
}

class _ExamplesPageState extends State<ExamplesPage> with SingleTickerProviderStateMixin {
  late final animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..forward(from: 0);

  String text = 'Explore business with';
  final leisure = 'Have fun with ';
  final business = 'Explore business with ';

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          animationController.reverse().then((value) {
            setState(() => text = text == leisure ? business : leisure);
            return animationController.forward(from: 0);
          });
        },
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) => FadeTransition(
            opacity: animationController,
            child: child,
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: textTheme?.title1,
                  textAlign: TextAlign.center,
                ),
                SpacingFoundation.verticalSpace16,
                ImageWidget(
                  link: GraphicsFoundation.instance.svg.shuffleWhite.path,
                  color: context.uiKitTheme?.colorScheme.inversePrimary,
                )
              ],
            ).paddingAll(EdgeInsetsFoundation.all24),
          ),
        ),
      ),
    );
  }
}
