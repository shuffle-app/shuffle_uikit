import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitFindSomeoneCard extends StatelessWidget {
  final String? avatarUrl;
  final String? userNickName;
  final String? userName;

  final int? userPoints;
  final String? sameInterests;
  final VoidCallback? onMessage;

  const UiKitFindSomeoneCard({
    super.key,
    this.avatarUrl,
    this.userNickName,
    this.userName,
    this.userPoints,
    this.sameInterests,
    this.onMessage,
  });

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;

    return LayoutBuilder(
      builder: (context, size) {
        final calculatedHeight = size.maxWidth * 0.55;

        return Padding(
          padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
          child: Material(
            color: ColorsFoundation.surface3,
            borderRadius: BorderRadiusFoundation.all24,
            clipBehavior: Clip.hardEdge,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularAvatar(
                            avatarUrl: avatarUrl ?? '',
                            name: '',
                            height: calculatedHeight * 0.3,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            userNickName ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Unbounded',
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            userName ?? '',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Unbounded',
                                fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: calculatedHeight * 0.15,
                            width: calculatedHeight,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xFFE32900),
                                    Color(0xFFC6E216),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                userPoints.toString() + '  points',
                                style: const TextStyle(
                                  fontFamily: 'Unbounded',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            sameInterests!,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Unbounded',
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                              onTap: onMessage,
                              child: Container(
                                height: calculatedHeight * 0.15,
                                width: calculatedHeight,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: const Center(
                                    child: Text(
                                  'MESSAGE',
                                  style: TextStyle(
                                    fontFamily: 'Unbounded',
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ).paddingAll(15),
          ),
        );
      },
    );
  }
}
