import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitSpinnerCard extends StatelessWidget {
  final String? photoLink;
  final String? title;
  final DateTime? date;
  final bool? favourite;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final String? ownerPhotoLink;
  final String? ownerTileTitle;
  final Widget? ownerTileTitleTrailing;
  final String? ownerTileSubtitle;

  const UiKitSpinnerCard({
    Key? key,
    this.photoLink,
    this.title,
    this.date,
    this.favourite,
    this.onTap,
    this.onFavoriteTap,
    this.ownerPhotoLink,
    this.ownerTileTitle,
    this.ownerTileTitleTrailing,
    this.ownerTileSubtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final titleStyle = textTheme?.caption1Bold;
    final dateTextStyle = textTheme?.caption1Bold.copyWith(
      color: ColorsFoundation.darkNeutral900,
    );

    return SizedBox(
      width: 0.75.sw,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SpacingFoundation.verticalSpace8,
          Stack(
            clipBehavior: Clip.none,
            fit: StackFit.passthrough,
            children: [
              ImageWidget(
                link: photoLink,
                fit: BoxFit.contain,
              ),
              Positioned(
                bottom: SpacingFoundation.verticalSpacing10,
                left: SpacingFoundation.horizontalSpacing10,
                right: SpacingFoundation.horizontalSpacing10,
                child: UiKitBlurredListTile(
                  title: ownerTileTitle,
                  titleTrailing: ownerTileTitleTrailing,
                  subtitle: ownerTileSubtitle,
                  photoLink: ownerPhotoLink,
                ),
              ),
              Positioned.fill(
                child: Material(
                  elevation: 0,
                  clipBehavior: Clip.hardEdge,
                  color: Colors.transparent,
                  type: MaterialType.card,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusFoundation.all24,
                  ),
                  child: InkWell(
                    splashColor: ColorsFoundation.darkNeutral500.withOpacity(0.24),
                    onTap: onTap,
                    child: Ink(),
                  ),
                ),
              ),
              Positioned(
                top: -SpacingFoundation.verticalSpacing8,
                right: -SpacingFoundation.horizontalSpacing8,
                child: context.smallButton(
                  icon: ImageWidget(
                    svgAsset:
                        favourite == true ? GraphicsFoundation.instance.svg.starFill : GraphicsFoundation.instance.svg.starOutline,
                    color: Colors.white,
                    fit: BoxFit.cover,
                  ),
                  onPressed: onFavoriteTap,
                ),
              ),
            ],
          ),
          SpacingFoundation.verticalSpace12,
          Text(
            '$title',
            style: titleStyle,
          ),
          SpacingFoundation.verticalSpace4,
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ImageWidget(
                svgAsset: GraphicsFoundation.instance.svg.clock,
                color: ColorsFoundation.darkNeutral900,
              ),
              SpacingFoundation.horizontalSpace4,
              Text(
                date != null ? DateFormat('HH:MM a, MMM dd').format(date!) : 'Coming soon',
                style: dateTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
