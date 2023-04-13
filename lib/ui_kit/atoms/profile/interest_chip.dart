import 'package:flutter/material.dart';
import 'package:shuffle_uikit/foundation/ui_kit_border_radius.dart';
import 'package:shuffle_uikit/foundation/ui_kit_insets.dart';
import 'package:shuffle_uikit/themes/ui_kit_theme_data.dart';

class UiKitChip extends StatelessWidget {
  final String interest;
  final bool isSelected;
  final bool bordered;
  final BoxBorder? border;

  const UiKitChip({
    Key? key,
    required this.interest,
    required this.isSelected,
    this.bordered = false,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final chipTheme = Theme.of(context).extension<UiKitThemeData>()?.chipTheme;
        final chipTextStyle = Theme.of(context).extension<UiKitThemeData>()?.boldTextTheme.caption1;
        return Container(
          padding: EdgeInsetsFoundation.symmetricH12V6,
          decoration: BoxDecoration(
            color: bordered ? chipTheme?.backgroundColor : Colors.transparent,
            borderRadius: BorderRadiusFoundation.max,
            border: border ?? chipTheme?.border ?? Border.all(color: Colors.white, width: 2),
          ),
          child: Text(
            interest,
            style: chipTextStyle,
          ),
        );
      },
    );
  }
}
