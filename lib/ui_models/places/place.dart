import 'package:shuffle_uikit/shuffle_uikit.dart';

enum UiKitMediaType { image, video }

abstract class BaseUiKitMedia {
  final String link;
  final UiKitMediaType type;

  BaseUiKitMedia({
    required this.link,
    required this.type,
  });
}

class UiKitMediaPhoto extends BaseUiKitMedia {
  UiKitMediaPhoto({
    required String link,
  }) : super(
          link: link,
          type: UiKitMediaType.image,
        );
}

class UiKitMediaVideo extends BaseUiKitMedia {
  UiKitMediaVideo({
    required String link,
  }) : super(
          link: link,
          type: UiKitMediaType.video,
        );
}

class UiKitTag {
  final String title;
  final String iconPath;
  final bool unique;

  UiKitTag({
    required this.title,
    required this.iconPath,
    required this.unique,
  });

  UiKitTagWidget get widget => UiKitTagWidget(title: title,icon: iconPath,showGradient: unique,);
}
