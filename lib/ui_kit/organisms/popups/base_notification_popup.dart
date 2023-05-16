import 'package:flutter/cupertino.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class BaseNotificationPopup extends StatelessWidget implements NotificationPopUpFactory {
  final NotificationPopupRequiredData requiredData;
  final bool? hasShadow;

  const BaseNotificationPopup({
    super.key,
    required this.requiredData,
    this.hasShadow,
  });

  @override
  Widget build(BuildContext context);
}
