import 'package:shuffle_uikit/shuffle_uikit.dart';

class ContentPreviewWithRespect {
  final int? placeId;
  final int? eventId;
  final List<String> images;
  final String title;
  final List<RespectFromUser> respectFromUsers;
  final List<UiKitTag> properties;

  ContentPreviewWithRespect({
    this.placeId,
    this.eventId,
    required this.images,
    required this.title,
    required this.respectFromUsers,
    required this.properties,
  });
}

class RespectFromUser {
  final String name;
  final String avatarUrl;

  RespectFromUser({
    required this.name,
    required this.avatarUrl,
  });
}
