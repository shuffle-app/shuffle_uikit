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
              GradientButton(
                text: 'Book it (+20)',
                onPressed: () {},
              ),
              SpacingFoundation.verticalSpace16,
              const GradientButton(
                text: 'Book it (+20)',
                enabled: false,
              ),
              SpacingFoundation.verticalSpace16,
              const GradientButtonWithIcon(
                icon: CupertinoActivityIndicator(),
                text: 'Book it (+20)',
              ),
            ],
          ),
        ),
        SpacingFoundation.horizontalSpace16,
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GeneralPurposeButton(
                text: 'GET CODE',
                onPressed: () {},
              ),
              SpacingFoundation.verticalSpace16,
              const GeneralPurposeButton(
                text: 'GET CODE',
              ),
              SpacingFoundation.verticalSpace16,
              const GeneralPurposeButtonWithIcon(
                icon: CupertinoActivityIndicator(),
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
              GradientButton(
                text: 'GET CODE',
                onPressed: () {},
              ),
              SpacingFoundation.verticalSpace16,
              const GradientButton(
                text: 'GET CODE',
              ),
              SpacingFoundation.verticalSpace16,
              const GradientButtonWithIcon(
                icon: CupertinoActivityIndicator(),
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
              GradientButton(
                text: 'GET CODE',
                onPressed: () {},
              ),
              SpacingFoundation.verticalSpace16,
              const GradientButton(
                text: 'GET CODE',
              ),
              SpacingFoundation.verticalSpace16,
              const GradientButtonWithIcon(
                icon: CupertinoActivityIndicator(),
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
              GradientButton(
                text: 'GET CODE',
                onPressed: () {},
              ),
              SpacingFoundation.verticalSpace16,
              const GradientButton(
                text: 'GET CODE',
              ),
              SpacingFoundation.verticalSpace16,
              const GradientButtonWithIcon(
                icon: CupertinoActivityIndicator(),
                text: 'GET CODE',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
