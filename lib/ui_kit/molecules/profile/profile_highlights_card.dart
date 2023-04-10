import 'package:flutter/material.dart';
import 'package:shuffle_uikit/ui_kit/atoms/common/ui_kit_card_wrapper.dart';

import '../../../foundation/shuffle_ui_kit_foundation.dart';

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
    return CardWrapper(
      padding: EdgeInsetsFoundation.all16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${value > 1000 ? '${value ~/ 1000}k+' : value}',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          SpacingFoundation.verticalSpace12,
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
