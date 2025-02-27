extension AudioTimeFormatter on Duration {
  String toAudioTime(Duration? totalDuration) {
    final seconds = inSeconds;
    final totalMinutes = (totalDuration?.inMinutes ?? 0);
    final minutesPad = totalMinutes < 10 ? 1 : 2;

    final minutes = (seconds ~/ 60).toString().padLeft(minutesPad, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds';
  }
}
