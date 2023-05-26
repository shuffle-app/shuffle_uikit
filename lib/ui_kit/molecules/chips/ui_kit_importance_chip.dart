import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitImportanceChip extends StatefulWidget {
  final String title;
  final ImportanceChip importance;
  final ValueChanged<ImportanceChip>? onImportanceChanged;

  const UiKitImportanceChip({
    Key? key,
    required this.title,
    required this.importance,
    this.onImportanceChanged,
  }) : super(key: key);

  @override
  State<UiKitImportanceChip> createState() => _UiKitImportanceChipState();
}

class _UiKitImportanceChipState extends State<UiKitImportanceChip> {
  late ImportanceChip _importance = widget.importance;

  @override
  Widget build(BuildContext context) {
    switch (_importance) {
      case ImportanceChip.none:
        return DefaultImportanceChip(
          text: widget.title,
          onTap: () => setState(() => _importance = ImportanceChip.medium),
        );
      case ImportanceChip.medium:
        return MediumImportanceChip(
          text: widget.title,
          onTap: () => setState(() => _importance = ImportanceChip.high),
        );
      case ImportanceChip.high:
        return HighImportanceChip(
          text: widget.title,
          onTap: () => setState(() => _importance = ImportanceChip.none),
        );
    }
  }
}

enum ImportanceChip { none, medium, high }
