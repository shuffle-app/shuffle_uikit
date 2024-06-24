import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPropertyRecentlyAdded extends StatelessWidget {
  final List<String> listIconPath;
  const UiKitPropertyRecentlyAdded({super.key, required this.listIconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 0.3.sh,
      decoration: BoxDecoration(
        color: ColorsFoundation.lightSurface2,
        borderRadius: BorderRadiusFoundation.all12,
      ),
      child: Scrollbar(
        thumbVisibility: true,
        child: GridView.builder(
          padding: EdgeInsetsDirectional.zero,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            crossAxisSpacing: EdgeInsetsFoundation.all16,
          ),
          itemCount: listIconPath.length,
          itemBuilder: (context, index) {
            return ImageWidget(
              link: listIconPath[index],
            );
          },
        ).paddingAll(EdgeInsetsFoundation.all8),
      ).paddingAll(EdgeInsetsFoundation.all8),
    ).paddingSymmetric(vertical: SpacingFoundation.verticalSpacing20);
  }
}
