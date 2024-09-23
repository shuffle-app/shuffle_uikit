import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

getRefundBookingDialogUiKit({
  required BuildContext context,
  final String? userName,
  int ticketRefund = 0,
  int upsaleRefund = 0,
  final int allTicket = 0,
  final int allUpsale = 0,
  final VoidCallback? onGoAheadTap,
  final VoidCallback? onContactTap,
}) {
  final theme = context.uiKitTheme;
  final isFullRefund = (allTicket <= ticketRefund) && (allUpsale <= upsaleRefund);

  if (ticketRefund > allTicket) {
    ticketRefund = allTicket;
  }
  if (upsaleRefund > allUpsale) {
    upsaleRefund = allUpsale;
  }

  return showUiKitAlertDialog(
    context,
    AlertDialogData(
      defaultButtonText: '',
      insetPadding: EdgeInsets.all(EdgeInsetsFoundation.all24),
      title: Text(
        '$userName ${S.of(context).Requests} ${isFullRefund ? S.of(context).Full : S.of(context).Partial} ${S.of(context).Refund}',
        style: theme?.boldTextTheme.title2.copyWith(
          color: theme.colorScheme.inverseHeadingTypography,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        if (!isFullRefund) ...[
          Align(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (ticketRefund > 0 && allTicket >= ticketRefund) ...[
                  Text(
                    '${S.of(context).TicketFrom(ticketRefund)} $allTicket',
                    style: theme?.boldTextTheme.body.copyWith(
                      color: theme.colorScheme.inverseBodyTypography,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
                if (upsaleRefund > 0 && allUpsale >= upsaleRefund) ...[
                  SpacingFoundation.verticalSpace2,
                  Text(
                    '${S.of(context).UpsalesProductsFrom(upsaleRefund)} $allUpsale',
                    style: theme?.boldTextTheme.body.copyWith(
                      color: theme.colorScheme.inverseBodyTypography,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
                SpacingFoundation.verticalSpace16,
              ],
            ),
          ),
        ],
        context.outlinedButton(
          borderColor: theme?.colorScheme.primary,
          data: BaseUiKitButtonData(
            backgroundColor: theme?.colorScheme.primary,
            fit: ButtonFit.fitWidth,
            textColor: theme?.colorScheme.inversePrimary,
            text: S.of(context).GoAhead.toUpperCase(),
            onPressed: onGoAheadTap,
          ),
        ),
        SpacingFoundation.verticalSpace16,
        context.outlinedButton(
          borderColor: theme?.colorScheme.primary,
          data: BaseUiKitButtonData(
            fit: ButtonFit.fitWidth,
            textColor: theme?.colorScheme.primary,
            text: S.of(context).Contact.toUpperCase(),
            onPressed: onContactTap,
          ),
        )
      ],
    ),
  );
}
