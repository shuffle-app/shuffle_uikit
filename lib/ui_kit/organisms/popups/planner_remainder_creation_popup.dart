import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class PlannerRemainderCreationPopup extends StatefulWidget {
  final ValueChanged<bool> onRemainderToggled;
  final List<String> values;
  final ValueChanged<String> onValueSelected;
  final bool isActivated;
  final String? initialValue;

  const PlannerRemainderCreationPopup(
      {super.key,
      required this.onRemainderToggled,
      this.values = const [],
      required this.onValueSelected,
      required this.isActivated,
      this.initialValue});

  @override
  State<PlannerRemainderCreationPopup> createState() => _PlannerRemainderCreationPopupState();
}

class _PlannerRemainderCreationPopupState extends State<PlannerRemainderCreationPopup> {
  bool switchedOn = false;
  String? selectedValue;

  @override
  void initState() {
    switchedOn = widget.isActivated;
    selectedValue = widget.initialValue;
    super.initState();
  }

  onChanged(bool value) {
    switchedOn = value;
    widget.onRemainderToggled(value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    return BaseDismissiblePopup(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text(
            S.of(context).Remainder,
            style: theme?.boldTextTheme.title2.copyWith(color: Colors.black),
          )),
          UiKitGradientSwitch(
            onChanged: onChanged,
            switchedOn: switchedOn,
          ),
        ],
      ),
      SpacingFoundation.verticalSpace16,
      Row(
        children: [
          Expanded(
              child: Text(
            S.of(context).RemindBefore,
            style: theme?.regularTextTheme.caption1.copyWith(color: Colors.black),
          )),
          Expanded(
              child: UiKitDropDownList<String>(
                  selectedItem: selectedValue,
                  customColor: UiKitColors.lightSurface3,
                  contentBorderRadius: BorderRadiusFoundation.all40,
                  contentPadding: EdgeInsets.symmetric(horizontal: SpacingFoundation.horizontalSpacing16),
                  onChanged: (value) {
                    selectedValue = value;
                    if (value != null) {
                      widget.onValueSelected(value);
                    }
                  },
                  items: widget.values
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: theme?.regularTextTheme.caption1.copyWith(color: Colors.black),
                            ),
                          ))
                      .toList()))
        ],
      )
    ]).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16);
  }
}
