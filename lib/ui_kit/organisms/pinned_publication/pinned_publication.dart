import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class PinnedPublication extends StatelessWidget {
  final bool isCardVisible;
  final String text;
  final List<String?>? images;
  final VoidCallback? onPinnedPublicationTap;
  final bool pinnedIsLoading;

  const PinnedPublication({
    super.key,
    required this.text,
    this.images,
    this.isCardVisible = false,
    this.onPinnedPublicationTap,
    this.pinnedIsLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: isCardVisible
          ? GestureDetector(
              onTap: onPinnedPublicationTap,
              child: UiKitCardWrapper(
                width: double.infinity,
                borderRadius: BorderRadiusFoundation.onlyBottom24,
                color: theme?.colorScheme.surface2,
                child: Row(
                  children: [
                    if (images != null && images!.isNotEmpty)
                      SizedBox(
                        width: 0.14.sw,
                        height: 0.14.sw,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: images!.length > 1 ? -4.w : 0,
                              child: ImageWidget(
                                height: 0.125.sw,
                                width: 0.125.sw,
                                link: images!.first,
                                fit: BoxFit.cover,
                              ),
                            ),
                            if (images!.length > 1)
                              Positioned(
                                right: -2.w,
                                top: -2.w,
                                child: ImageWidget(
                                  height: 0.125.sw,
                                  width: 0.125.sw,
                                  link: images![1],
                                  fit: BoxFit.cover,
                                ),
                              ),
                          ],
                        ),
                      ).paddingOnly(right: SpacingFoundation.horizontalSpacing10),
                    Expanded(
                      child: Text(
                        text,
                        style: theme?.regularTextTheme.caption2,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (pinnedIsLoading)
                      SizedBox(
                        height: 14.h,
                        width: 14.h,
                        child: CircularProgressIndicator(
                          color: theme?.colorScheme.headingTypography,
                          strokeWidth: 2.0,
                        ),
                      ).paddingOnly(left: SpacingFoundation.horizontalSpacing4)
                  ],
                ).paddingSymmetric(
                  vertical: SpacingFoundation.verticalSpacing8,
                  horizontal: SpacingFoundation.horizontalSpacing16,
                ),
              ),
            )
          : SpacingFoundation.none,
    );
  }
}
