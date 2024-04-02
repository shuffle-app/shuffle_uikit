class KnownLocation {
  final String title;
  final int id;
  final double? latitude;
  final double? longitude;

  KnownLocation({
    required this.title,
    this.id = -1,
    this.latitude,
    this.longitude,
  });
}
