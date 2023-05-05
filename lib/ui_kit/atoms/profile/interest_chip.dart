import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

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
    final chipTheme = context.uiKitTheme?.chipTheme;
    final chipTextStyle = context.uiKitTheme?.boldTextTheme.caption1Bold;
    return Container(
      decoration: BoxDecoration(
        color: bordered ? chipTheme?.backgroundColor : Colors.transparent,
        borderRadius: BorderRadiusFoundation.max,
        border: border ?? chipTheme?.border ?? Border.all(color: Colors.white, width: 2),
      ),
      child: Text(
        interest,
        style: chipTextStyle,
      ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal12, vertical: EdgeInsetsFoundation.vertical8),
    );
  }
}
