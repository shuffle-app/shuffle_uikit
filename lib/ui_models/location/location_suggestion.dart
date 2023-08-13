class LocationSuggestion {
  final String title;
  final String subtitle;
  final double? latitude;
  final double? longitude;

  LocationSuggestion({
    required this.title,
    required this.subtitle,
    this.latitude,
    this.longitude,
  });

  LocationSuggestion copyWith({
    String? title,
    String? subtitle,
    double? latitude,
    double? longitude,
  }) {
    return LocationSuggestion(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
