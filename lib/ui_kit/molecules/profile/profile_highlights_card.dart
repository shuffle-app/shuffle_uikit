import 'package:flutter/material.dart';
import 'package:shuffle_uikit/tokens/foundation.dart';

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
      width: 91,
      padding: UiKitEdgeInsets.all16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${value > 1000 ? '${value ~/ 1000}k+' : value}',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          UiKitSpacing.verticalSpace12,
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
