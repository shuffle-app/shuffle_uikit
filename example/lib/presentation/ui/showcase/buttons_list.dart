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
        context.button(
          text: 'GET CODE',
          onPressed: () {},
          gradient: true,
        ),
        SpacingFoundation.verticalSpace16,
        context.button(
          text: 'GET CODE',
          gradient: true,
        ),
        SpacingFoundation.verticalSpace16,
        context.button(
          icon: const CupertinoActivityIndicator(),
          text: 'GET CODE',
          gradient: true,
        ),
        SpacingFoundation.verticalSpace16,
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
        SpacingFoundation.verticalSpace16,
        Center(
          child: context.button(
            text: 'GET CODE',
            isTextButton: true,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
