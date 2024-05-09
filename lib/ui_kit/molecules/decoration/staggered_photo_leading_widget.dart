import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class StaggeredPhotosLeadingWidget extends StatelessWidget {
  final List<String> photoLinks;

  const StaggeredPhotosLeadingWidget({
    Key? key,
    required this.photoLinks,
  }) : super(key: key);

  double get firstPhotoWidth => 0.125.sw;

  double get firstPhotoHeight => firstPhotoWidth * 1.575;

  double get secondPhotoWidth => 0.14375.sw;

  double get secondPhotoHeight => secondPhotoWidth * 0.6;

  @override
  Widget build(BuildContext context) {
    if (photoLinks.length < 3) throw Exception('There should be at least 3 photos in StaggeredPhotosLeadingWidget');
    return SizedBox(
      height: firstPhotoHeight,
      width: 0.2875.sw,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusFoundation.all8,
            child: ImageWidget(
              link: photoLinks[0],
              width: firstPhotoWidth,
              height: firstPhotoHeight,
              fit: BoxFit.cover,
            ),
          ),
          SpacingFoundation.horizontalSpace4,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusFoundation.all8,
                  child: ImageWidget(
                    link: photoLinks[1],
                    width: secondPhotoWidth,
                    height: secondPhotoHeight,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadiusFoundation.all8,
                  child: ImageWidget(
                    link: photoLinks[2],
                    width: secondPhotoWidth,
                    height: secondPhotoHeight,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
