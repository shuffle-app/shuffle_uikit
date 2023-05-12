import 'package:flutter/cupertino.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ButtonsGrid extends StatelessWidget {
  const ButtonsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              context.gradientButton(
                text: 'Book it (+20)',
                onPressed: () {},
              ),
              context.gradientButton(
                text: 'Book it (+20)',
              ),
              context.gradientButton(
                icon: const CupertinoActivityIndicator(),
                text: 'Book it (+20)',
              ),
              SpacingFoundation.verticalSpace16,
              SpacingFoundation.verticalSpace16,
            ],
          ),
        ),
        SpacingFoundation.horizontalSpace16,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              context.button(
                text: 'GET CODE',
                onPressed: () {},
              ),
              SpacingFoundation.verticalSpace16,
              context.button(
                text: 'GET CODE',
              ),
              SpacingFoundation.verticalSpace16,
              context.button(
                icon: const CupertinoActivityIndicator(),
                text: 'GET CODE',
              ),
            ],
          ),
        ),
        SpacingFoundation.horizontalSpace16,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              context.gradientButton(
                text: 'Book it (+20)',
                onPressed: () {},
              ),
              context.gradientButton(
                text: 'Book it (+20)',
              ),
              context.gradientButton(
                icon: const CupertinoActivityIndicator(),
                text: 'Book it (+20)',
              ),
              SpacingFoundation.verticalSpace16,
              SpacingFoundation.verticalSpace16,
            ],
          ),
        ),
        SpacingFoundation.horizontalSpace16,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              context.gradientButton(
                text: 'Book it (+20)',
                onPressed: () {},
              ),
              context.gradientButton(
                text: 'Book it (+20)',
              ),
              context.gradientButton(
                icon: const CupertinoActivityIndicator(),
                text: 'Book it (+20)',
              ),
              SpacingFoundation.verticalSpace16,
              SpacingFoundation.verticalSpace16,
            ],
          ),
        ),
        SpacingFoundation.horizontalSpace16,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              context.gradientButton(
                text: 'Book it (+20)',
                onPressed: () {},
              ),
              context.gradientButton(
                text: 'Book it (+20)',
              ),
              context.gradientButton(
                icon: const CupertinoActivityIndicator(),
                text: 'Book it (+20)',
              ),
              SpacingFoundation.verticalSpace16,
              SpacingFoundation.verticalSpace16,
            ],
          ),
        ),
      ],
    );
  }
}
