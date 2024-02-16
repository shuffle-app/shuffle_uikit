import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitBaseDropdown<T> extends StatelessWidget {
  final List<T> items;
  final bool useLightTheme;
  final ValueChanged<T?>? onChanged;
  final T? value;
  final Color? color;

  const UiKitBaseDropdown(
      {super.key,
      required this.items,
      this.useLightTheme = false,
      this.onChanged,
      this.value,
      this.color = UiKitColors.surface4});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: kIsWeb ? 250.0 : double.infinity),
        child: UiKitCardWrapper(
            borderRadius: BorderRadiusFoundation.all8,
            color: color,
            child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<T>(
              focusColor: Colors.transparent,
              borderRadius: BorderRadiusFoundation.all8,
              padding: const EdgeInsets.symmetric(horizontal: 6),
              value: value,
              dropdownColor: color,
              items: items
                  .map((e) => DropdownMenuItem<T>(
                        value: e,
                        // child: Text(e.name),
                        child: Text(e.toString(), style: theme?.regularTextTheme.body),
                      ))
                  .toList(),
              hint: Text('Select an option', style: theme?.regularTextTheme.body),
              style: theme?.regularTextTheme.body,
              icon: ImageWidget(
                iconData: ShuffleUiKitIcons.chevrondown,
                color: theme?.colorScheme.inversePrimary,
              ),
              onChanged: onChanged,
            ))));
  }
}
