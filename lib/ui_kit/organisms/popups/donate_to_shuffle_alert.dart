import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class DonateToShuffleAlert extends StatefulWidget {
  final ValueChanged<int>? onDonate;

  const DonateToShuffleAlert({
    super.key,
    this.onDonate,
  });

  @override
  State<DonateToShuffleAlert> createState() => _DonateToShuffleAlertState();
}

class _DonateToShuffleAlertState extends State<DonateToShuffleAlert> {
  int? selectedValue;
  final values = [
    ...List<int>.generate(50, (index) => index + 1),
    60,
    70,
    80,
    90,
    100,
    200,
    300,
    400,
    500,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return BaseDismissiblePopup(
            children: [
              Text(
                S.of(context).HowMuchDoYouWantToDonate,
                style: theme?.boldTextTheme.title2.copyWith(color: Colors.black),
              ),
              SpacingFoundation.verticalSpace12,
              UiKitHorizontalWheelNumberSelector(
                backgroundColor: Colors.transparent,
                numbersColor: Colors.black,
                values: values,
                initialValue: 0,
                hideTitle: true,
                onValueChanged: (value) => setState(() => selectedValue = value),
              ),
              SpacingFoundation.verticalSpace12,
              context.gradientButton(
                data: BaseUiKitButtonData(
                  fit: ButtonFit.fitWidth,
                  text: S.of(context).SendIt.toUpperCase(),
                  onPressed: () {
                    if (selectedValue != null) {
                      widget.onDonate?.call(selectedValue!);
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),



      ],
    ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16);
  }
}
