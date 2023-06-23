import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:shuffle_uikit/ui_kit/atoms/profile/profile_avatar.dart';
import 'package:shuffle_uikit/ui_kit/atoms/profile/profile_description.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCard extends StatelessWidget {
  final String? nickname;
  final String? name;
  final String? description;
  final String? avatarUrl;
  final int? followers;
  final VoidCallback? onFollow;
  final List<String>? interests;
  final List<String>? matchingInterests;

  const ProfileCard({
    Key? key,
    this.nickname,
    this.description,
    this.avatarUrl,
    this.name,
    this.followers,
    this.onFollow,
    this.interests,
    this.matchingInterests,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UiKitCardWrapper(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// Frame 359 in Figma
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (followers != null && onFollow != null)
                ProfileAvatar(
                  avatarLink: avatarUrl ?? '',
                  name: name,
                )
              else
                CircularAvatar(
                  height: 48,
                  avatarUrl: avatarUrl ?? '',
                  name: name,
                ),
              if (followers != null && onFollow != null)
                SpacingFoundation.horizontalSpace16
              else
                SpacingFoundation.horizontalSpace12,
              Expanded(
                child: ProfileInfo(
                  name: name,
                  nickname: '@${nickname ?? ''}',
                  followers: followers,
                  onFollow: onFollow,
                ),
              ),
            ],
          ),
          if (description != null) ...[
            SpacingFoundation.verticalSpace16,
            ProfileDescription(
              text: description ?? '',
            )
          ],
          Stack(children: [

            ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 100.h),
                    child: SingleChildScrollView(
                        child: ProfileInterests(
                      matchingInterests: matchingInterests,
                      profileInterests: interests ?? [],
                    )))
                .paddingSymmetric(vertical: SpacingFoundation.verticalSpacing16),
            // Container(
            //   decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //         colors: [
            //           context.uiKitTheme?.cardColor.withOpacity(0.5) ?? ColorsFoundation.surface3.withOpacity(0.5),
            //           Colors.transparent
            //         ],
            //         tileMode: TileMode.decal,
            //         end: Alignment.bottomCenter,
            //         begin: Alignment.topCenter,
            //       )),
            //   height: 16.sp,
            //   width: double.infinity,
            // ),
            // Positioned(
            //     bottom: 0,
            //     left: 0,
            //     right: 0,
            //     child: Container(
            //       alignment: Alignment.bottomCenter,
            //       decoration: BoxDecoration(
            //           gradient: LinearGradient(
            //             colors: [
            //               context.uiKitTheme?.cardColor.withOpacity(0.5) ??
            //                   ColorsFoundation.surface3.withOpacity(0.5),
            //               Colors.transparent
            //             ],
            //             tileMode: TileMode.decal,
            //             begin: Alignment.bottomCenter,
            //             end: Alignment.topCenter,
            //           )),
            //       height: 16.sp,
            //     )),
          ]),
        ],
      ).paddingLTRB(EdgeInsetsFoundation.all16, EdgeInsetsFoundation.all16,
          EdgeInsetsFoundation.all16, 0),
    );
  }
}
