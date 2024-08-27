import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitAnimatedPullToShowRow extends StatelessWidget {
  final ValueNotifier<double> progressNotifier;
  final List<Widget> children;
  final String noChildrenText;

  const UiKitAnimatedPullToShowRow({
    Key? key,
    required this.progressNotifier,
    required this.children,
    required this.noChildrenText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final colorScheme = context.uiKitTheme?.colorScheme;

    return AnimatedBuilder(
      animation: progressNotifier,
      builder: (context, child) {
        if (progressNotifier.value == 0) return const SizedBox.shrink();

        return UiKitCardWrapper(
          color: colorScheme?.surface2,
          borderRadius: BorderRadiusFoundation.zero,
          padding: EdgeInsets.all(EdgeInsetsFoundation.all16),
          height: (0.15.sw + (SpacingFoundation.verticalSpacing16 * 2)) * progressNotifier.value,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 20),
            opacity: progressNotifier.value,
            child: child,
          ),
        );
      },
      child: children.isEmpty
          ? GradientableWidget(
              gradient: GradientFoundation.defaultLinearGradient,
              child: Text(
                noChildrenText,
                style: boldTextTheme?.caption1Medium.copyWith(color: Colors.white),
              ),
            )
          : ListView.separated(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => children.elementAt(index),
              separatorBuilder: (context, index) => SpacingFoundation.horizontalSpace16,
              itemCount: children.length,
            ),
    );
  }
}
