abstract class UiKitSearchableListBodyItem {
  final String title;
  final String? leadingPath;
  final String? trailingText;

  UiKitSearchableListBodyItem({
    required this.title,
    this.leadingPath,
    this.trailingText,
  });
}
