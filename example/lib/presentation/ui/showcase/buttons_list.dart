import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          onPressed: () {},
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
        SpacingFoundation.verticalSpace16,
        Center(
          child: context.smallButton(
            text: 'GET CODE',
            onPressed: () {},
          ),
        ),
        SpacingFoundation.verticalSpace16,
        context.dialogButton(
          onPressed: () {},
          text: 'GET CODE',
          small: true,
          dialogButtonType: DialogButtonType.buttonWhite,
        ),
        SpacingFoundation.verticalSpace16,
        ColoredBox(
          color: Colors.white,
          child: context.dialogButton(
            onPressed: () {},
            text: 'GET CODE',
            small: true,
            dialogButtonType: DialogButtonType.buttonBlack,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            context.button(
              icon: ImageWidget(
                svgAsset: GraphicsFoundation.instance.svg.route,
                color: Colors.white,
              ),
              onPressed: () {},
              outlined: true,
            ),
            SpacingFoundation.horizontalSpace8,
            context.button(
              icon: ImageWidget(
                svgAsset: GraphicsFoundation.instance.svg.route,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
