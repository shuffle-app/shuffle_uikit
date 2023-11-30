import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ButtonsList extends StatelessWidget {
  const ButtonsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        context.createSmallOutlinedButton(
          data: BaseUiKitButtonData(
            text: 'GET CODE',
            onPressed: () {},
            loading: false,
            fit: ButtonFit.hugContent,
          ),
          blurred: false,
        ),
        SpacingFoundation.verticalSpace16,
        context.createSmallOutlinedButton(
          data: BaseUiKitButtonData(
            text: 'GET CODE',
            onPressed: () {},
            loading: false,
            fit: ButtonFit.hugContent,
          ),
          blurred: true,
        ),
        SpacingFoundation.verticalSpace16,
        context.gradientButton(
          data: BaseUiKitButtonData(
            text: 'GET CODE',
            onPressed: () {},
            loading: true,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        Center(
          child: context.smallGradientButton(
            data: BaseUiKitButtonData(
              text: 'GET CODE',
              onPressed: () {},
              loading: true,
            ),
          ),
        ),
        SpacingFoundation.verticalSpace16,
        context.gradientButton(
          data: BaseUiKitButtonData(
            text: 'GET CODE',
          ),
        ),
        SpacingFoundation.verticalSpace16,
        context.gradientButton(
          data: BaseUiKitButtonData(
            text: 'GET CODE',
            onPressed: () {},
            loading: true,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        context.button(
          data: BaseUiKitButtonData(
            text: 'GET CODE',
            onPressed: () {},
            loading: true,
            fit: ButtonFit.hugContent,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        Center(
          child: context.button(
            data: BaseUiKitButtonData(
              text: 'GET CODE',
              onPressed: () {},
            ),
          ),
        ),
        SpacingFoundation.verticalSpace16,
        context.button(
          data: BaseUiKitButtonData(
            fit: ButtonFit.fitWidth,
            icon: const CupertinoActivityIndicator(),
            text: 'GET CODE',
          ),
        ),
        SpacingFoundation.verticalSpace16,
        Center(
          child: context.button(
            data: BaseUiKitButtonData(
              text: 'GET CODE',
              onPressed: () {},
            ),
            isTextButton: true,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        Center(
          child: context.smallButton(
            data: BaseUiKitButtonData(
              text: 'GET CODE',
              onPressed: () {},
            ),
          ),
        ),
        SpacingFoundation.verticalSpace16,
        context.dialogButton(
          data: BaseUiKitButtonData(onPressed: () {}, text: 'GET CODE'),
          small: true,
          dialogButtonType: DialogButtonType.buttonWhite,
        ),
        SpacingFoundation.verticalSpace16,
        ColoredBox(
          color: Colors.white,
          child: context.dialogButton(
            data: BaseUiKitButtonData(onPressed: () {}, text: 'GET CODE'),
            small: true,
            dialogButtonType: DialogButtonType.buttonBlack,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            context.outlinedButton(
              data: BaseUiKitButtonData(
                icon: ImageWidget(
                  iconData: ShuffleUiKitIcons.route,
                  color: context.uiKitTheme?.colorScheme.inversePrimary,
                ),
                onPressed: () {},
              ),
            ),
            SpacingFoundation.horizontalSpace8,
            context.button(
              data: BaseUiKitButtonData(
                icon: ImageWidget(
                  iconData: ShuffleUiKitIcons.route,
                  color: context.uiKitTheme?.colorScheme.inversePrimary,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
