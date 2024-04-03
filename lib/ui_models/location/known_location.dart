class KnownLocation {
  final String title;
  final String addressLine;
  final int id;
  final double? latitude;
  final double? longitude;

  KnownLocation({
    required this.title,
    required this.addressLine,
    this.id = -1,
    this.latitude,
    this.longitude,
  });
}
