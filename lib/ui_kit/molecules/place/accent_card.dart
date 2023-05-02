import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class AccentCard extends StatelessWidget {
  final String title;
  final String additionalInfo;
  final String accentMessage;
  final ImageWidget image;

  const AccentCard({
    Key? key,
    required this.title,
    required this.additionalInfo,
    required this.accentMessage,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.uiKitTheme?.boldTextTheme;
    final titleStyle = textTheme?.subHeadline;
    final additionalInfoStyle = textTheme?.caption2.copyWith(color: ColorsFoundation.darkNeutral500);
    final accentMessageStyle = textTheme?.caption1.copyWith(color: ColorsFoundation.darkNeutral100);
    return IntrinsicHeight(
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusFoundation.all24,
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 16.sp,
              offset: Offset.zero,
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            image,
            Positioned(
              top: 16.h,
              right: 16.w,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.15),
                  borderRadius: BorderRadiusFoundation.all24,
                ),
                child: Text(
                  accentMessage,
                  style: accentMessageStyle,
                ).paddingSymmetric(
                  horizontal: EdgeInsetsFoundation.horizontal12,
                  vertical: EdgeInsetsFoundation.vertical8,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.5),
                  ],
                ),
                borderRadius: BorderRadiusFoundation.all24,
              ),
            ),
            Positioned(
              bottom: 16.h,
              left: 16.w,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    additionalInfo,
                    style: additionalInfoStyle,
                  ),
                  Text(
                    title,
                    style: titleStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
