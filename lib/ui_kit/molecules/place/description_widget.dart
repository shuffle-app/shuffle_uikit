import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;

  const DescriptionWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    bool hide = true;

    return StatefulBuilder(
        builder: (c, s) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    description,
                    maxLines: hide ? 7 : null,
                    softWrap: true,
                    overflow: hide ? TextOverflow.ellipsis : null,
                    style: theme?.boldTextTheme.caption1Bold
                        .copyWith(color: Colors.white),
                  ),
                  if ((description.replaceAll('\n', '').codeUnits.length *
                              2.w /
                              0.9.sw +
                          description.characters
                              .where((p0) => p0 == '\n')
                              .length) > 7)
                    InkWell(
                      onTap: () => s(() => hide = !hide),
                      child: Text(
                        'Read ${hide ? 'more' : 'less'}',
                        style: theme?.boldTextTheme.caption1Bold
                            .copyWith(color: ColorsFoundation.darkNeutral300),
                      ),
                    ).paddingOnly(top: SpacingFoundation.verticalSpacing12)
                ]));
  }
}
