extension StringCleaner on String {
  String cleanWhitespace() {
    var cleanedString = trim();

    cleanedString = cleanedString.replaceAll(RegExp(r'\s+'), ' ');

    return cleanedString;
  }
}
