extension CompactFormat on int {
  String toCompactString() {
    if (this >= 1000000) {
      double result = this / 1000000;
      return '${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}M';
    } else if (this >= 1000) {
      double result = this / 1000;
      return '${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}K';
    } else {
      return toString();
    }
  }
}
