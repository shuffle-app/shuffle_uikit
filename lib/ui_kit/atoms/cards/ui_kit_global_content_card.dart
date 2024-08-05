import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitGlobalContentCard extends StatelessWidget {
  const UiKitGlobalContentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all24,
        gradient: const LinearGradient(
          colors: [
            Color(0xffE32900),
            Color(0xffC6E216),
          ],
        ),
      ),
      child: Text(
        S.current.Global,
        style: context.uiKitTheme?.boldTextTheme.caption1Bold
            .copyWith(color: ColorsFoundation.surface),
      ).paddingSymmetric(
          horizontal: EdgeInsetsFoundation.horizontal24,
          vertical: EdgeInsetsFoundation.vertical6),
    );
  }
}
