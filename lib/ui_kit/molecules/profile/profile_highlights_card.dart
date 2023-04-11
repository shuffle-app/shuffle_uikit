import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class ProfileHighlightCard extends StatelessWidget {
  final String title;
  final int value;

  const ProfileHighlightCard({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context).extension<UiKitThemeData>();
        return CardWrapper(
          padding: EdgeInsetsFoundation.all16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${value > 1000 ? '${value ~/ 1000}k+' : value}',
                style: theme?.boldTextTheme.title2,
                textAlign: TextAlign.center,
              ),
              SpacingFoundation.verticalSpace12,
              Text(
                title,
                style: theme?.boldTextTheme.body.copyWith(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
