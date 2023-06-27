import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitImportanceChip extends StatelessWidget {
  final String title;
  final bool joke;
  final ImportanceChip importance;
  final ValueChanged<ImportanceChip>? onImportanceChanged;

  late final ValueNotifier<ImportanceChip> _valueNotifier = ValueNotifier<ImportanceChip>(importance);

  UiKitImportanceChip({
    Key? key,
    required this.title,
    this.joke = false,
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
            child: UiKitShadowWrapper(
              applyShadow: joke,
              color: UiKitColors.pinkLight,
              shape: BoxShape.circle,
              child: importance == ImportanceChip.high
                  ? HighImportanceChip(
                      text: title,
                      onTap: () {
                        onImportanceChanged?.call(ImportanceChip.none);
                        _valueNotifier.value = ImportanceChip.none;
                      },
                    )
                  : importance == ImportanceChip.medium
                      ? MediumImportanceChip(
                          text: title,
                          onTap: () {
                            onImportanceChanged?.call(ImportanceChip.high);
                            _valueNotifier.value = ImportanceChip.high;
                          },
                        )
                      : DefaultImportanceChip(
                          text: title,
                          onTap: () {
                            onImportanceChanged?.call(ImportanceChip.medium);
                            _valueNotifier.value = ImportanceChip.medium;
                          },
                        ),
            ));
      },
    );
  }
}

enum ImportanceChip { none, medium, high }
