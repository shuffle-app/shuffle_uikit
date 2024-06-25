import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitEmptyListPlaceHolder extends StatelessWidget {
  final String? message;

  const UiKitEmptyListPlaceHolder({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;

    return Center(
      child: Text(
        message ?? S.current.NothingFound,
        style: textTheme?.subHeadline,
      ),
    );
  }
}
