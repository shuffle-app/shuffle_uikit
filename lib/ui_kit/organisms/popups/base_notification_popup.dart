import 'package:flutter/cupertino.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

abstract class BaseNotificationPopup extends StatelessWidget implements NotificationPopUpFactory {
  final NotificationPopupRequiredData requiredData;

  const BaseNotificationPopup({
    super.key,
    required this.requiredData,
  });

  @override
  Widget build(BuildContext context);
}
