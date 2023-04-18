import 'package:flutter/cupertino.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ButtonsList extends StatelessWidget {
  const ButtonsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
        SpacingFoundation.verticalSpace16,
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
    );
  }
}
