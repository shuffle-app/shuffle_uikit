bool isOnlyEmoji(String text) {
  final trimmedText = text.trim();

  if (trimmedText.isEmpty) {
    return false;
  }

  final emojiRegex = RegExp(
    r'^(\p{Emoji}|\uFE0F)+$',
    unicode: true,
  );

  return emojiRegex.hasMatch(trimmedText);
}
