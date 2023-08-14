class LocationSuggestion {
  final String title;
  final String subtitle;
  final double? latitude;
  final double? longitude;
  final String placeId;

  LocationSuggestion({
    required this.title,
    required this.subtitle,
    required this.placeId,
    this.latitude,
    this.longitude,
  });

  LocationSuggestion copyWith({
    String? title,
    String? subtitle,
    double? latitude,
    double? longitude,
    String? placeId,
  }) {
    return LocationSuggestion(
      title: title ?? this.title,
      placeId: placeId ?? this.placeId,
      subtitle: subtitle ?? this.subtitle,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
