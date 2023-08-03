import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class CompanyProfileInfo extends StatelessWidget {
  final String? companyName;
  final List<UiKitTag>? tags;

  const CompanyProfileInfo({
    super.key,
    this.companyName,
    this.tags,
  });

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final fallBackStyle = Theme.of(context).textTheme.bodyMedium;
    TextStyle? nameStyle = boldTextTheme?.subHeadline ?? fallBackStyle;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          companyName ?? '',
          style: nameStyle,
        ),
        SpacingFoundation.verticalSpace2,
        UiKitTagsWidget(
          baseTags: tags ?? [],
        ),
      ],
    );
  }
}
