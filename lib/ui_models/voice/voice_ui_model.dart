class VoiceUiModel {
  final String? path;
  final int? duration;

  const VoiceUiModel({
    this.path,
    this.duration,
  });

  @override
  String toString() {
    return 'VoiceUiModel{path: $path, duration: $duration}';
  }
}
