import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitImportanceChip extends StatelessWidget {
  final String title;
  final ImportanceChip importance;
  final ValueChanged<ImportanceChip>? onImportanceChanged;

  late final ValueNotifier<ImportanceChip> _valueNotifier = ValueNotifier<ImportanceChip>(importance);

  UiKitImportanceChip({
    Key? key,
    required this.title,
    required this.importance,
    this.onImportanceChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _valueNotifier,
      builder: (context, child) {
        final importance = _valueNotifier.value;

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: importance == ImportanceChip.high
              ? HighImportanceChip(
                  text: title,
                  onTap: () => _valueNotifier.value = ImportanceChip.none,
                )
              : importance == ImportanceChip.medium
                  ? MediumImportanceChip(
                      text: title,
                      onTap: () => _valueNotifier.value = ImportanceChip.high,
                    )
                  : DefaultImportanceChip(
                      text: title,
                      onTap: () => _valueNotifier.value = ImportanceChip.medium,
                    ),
        );
        switch (importance) {
          case ImportanceChip.none:
            return DefaultImportanceChip(
              text: title,
              onTap: () {
                _valueNotifier.value = ImportanceChip.medium;
                onImportanceChanged?.call(ImportanceChip.medium);
              },
            );
          case ImportanceChip.medium:
            return MediumImportanceChip(
              text: title,
              onTap: () {
                _valueNotifier.value = ImportanceChip.high;
                onImportanceChanged?.call(ImportanceChip.high);
              },
            );
          case ImportanceChip.high:
            return HighImportanceChip(
              text: title,
              onTap: () {
                _valueNotifier.value = ImportanceChip.none;
                onImportanceChanged?.call(ImportanceChip.none);
              },
            );
        }
      },
    );

    // switch (importance) {
    //   case ImportanceChip.none:
    //     return DefaultImportanceChip(
    //       text: widget.title,
    //       onTap: () => setState(() => importance = ImportanceChip.medium),
    //     );
    //   case ImportanceChip.medium:
    //     return MediumImportanceChip(
    //       text: widget.title,
    //       onTap: () => setState(() => importance = ImportanceChip.high),
    //     );
    //   case ImportanceChip.high:
    //     return HighImportanceChip(
    //       text: widget.title,
    //       onTap: () => setState(() => importance = ImportanceChip.none),
    //     );
    // }
  }
}

enum ImportanceChip { none, medium, high }
