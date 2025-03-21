import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';
import 'package:auto_size_text/auto_size_text.dart';

class UiKitStripeRegistrationTile extends StatelessWidget {
  final VoidCallback? onTap;
  final StripeRegistrationStatus status;

  const UiKitStripeRegistrationTile({super.key, this.onTap, required this.status});

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;

    return UiKitCardWrapper(
      borderRadius: BorderRadiusFoundation.all12,
      color: colorScheme?.surface2,
      padding: EdgeInsets.all(EdgeInsetsFoundation.all12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: AutoSizeText(
              S.current.StripeRegistration,
              style: theme?.regularTextTheme.caption3.copyWith(fontWeight: FontWeight.w500),
              maxLines: 2,
              minFontSize: 6,
              group: _group,
            ),
          ),
          SpacingFoundation.horizontalSpace12,
          UiKitBadgeColored.withoutBorder(
            title: status.stringValue,
            color: status.colorValue,
            group: _group,
            borderRadius: BorderRadiusFoundation.all12,
          ),
          if (onTap != null)
            context
                .smallOutlinedButton(
                  data: BaseUiKitButtonData(
                    onPressed: onTap,
                    borderColor: colorScheme?.inversePrimary,
                    iconInfo: BaseUiKitButtonIconData(
                        iconData: ShuffleUiKitIcons.chevronright, color: colorScheme?.inversePrimary),
                  ),
                )
                .paddingOnly(left: SpacingFoundation.horizontalSpacing8)
        ],
      ),
    );
  }
}

final AutoSizeGroup _group = AutoSizeGroup();

enum StripeRegistrationStatus { notStarted, inProgress, completed, needAction }

extension StripeRegistrationToValues on StripeRegistrationStatus {
  String get stringValue {
    switch (this) {
      case StripeRegistrationStatus.notStarted:
        return S.current.NotStarted;
      case StripeRegistrationStatus.inProgress:
        return S.current.InProgress;
      case StripeRegistrationStatus.completed:
        return S.current.Completed;
      case StripeRegistrationStatus.needAction:
        return S.current.NeedAction;
    }
  }

  Color get colorValue {
    switch (this) {
      case StripeRegistrationStatus.notStarted:
        return Colors.grey;
      case StripeRegistrationStatus.inProgress:
        return Colors.blue;
      case StripeRegistrationStatus.completed:
        return Colors.green;
      case StripeRegistrationStatus.needAction:
        return Colors.red;
    }
  }
}
