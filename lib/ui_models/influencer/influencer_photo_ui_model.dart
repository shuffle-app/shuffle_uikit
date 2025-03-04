class InfluencerPhotoUiModel {
  final int id;
  final String? title;
  final String? url;
  final int? heartEyeCount;
  final int? thumbsUpCount;
  final int? fireCount;
  final int? sunglassesCount;
  final int? smileyCount;
  final String? userReaction;

  InfluencerPhotoUiModel({
    required this.id,
    this.title,
    this.url,
    this.heartEyeCount,
    this.thumbsUpCount,
    this.fireCount,
    this.sunglassesCount,
    this.smileyCount,
    this.userReaction,
  });

  InfluencerPhotoUiModel copyWith({
    int? id,
    String? title,
    String? url,
    int? heartEyeCount,
    int? thumbsUpCount,
    int? fireCount,
    int? sunglassesCount,
    int? smileyCount,
    String? userReaction,
  }) {
    return InfluencerPhotoUiModel(
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      heartEyeCount: heartEyeCount ?? this.heartEyeCount,
      thumbsUpCount: thumbsUpCount ?? this.thumbsUpCount,
      fireCount: fireCount ?? this.fireCount,
      sunglassesCount: sunglassesCount ?? this.sunglassesCount,
      smileyCount: smileyCount ?? this.smileyCount,
      userReaction: userReaction ?? this.userReaction,
    );
  }

  @override
  String toString() {
    return 'InfluencerPhotoUiModel{'
        'id: $id, '
        'title: ${title != null ? '"$title"' : null}, '
        'url: ${url != null ? '"$url"' : null}, '
        'heartEyeCount: $heartEyeCount, '
        'thumbsUpCount: $thumbsUpCount, '
        'fireCount: $fireCount, '
        'sunglassesCount: $sunglassesCount, '
        'smileyCount: $smileyCount, '
        'userReaction: ${userReaction != null ? '"$userReaction"' : null}'
        '}';
  }
}
