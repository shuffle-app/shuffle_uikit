import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitInputFieldWithChips extends StatelessWidget {
  final List<String>? selectedChips;
  final TextEditingController controller;

  const UiKitInputFieldWithChips({
    Key? key,
    this.selectedChips,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldTextTheme = context.uiKitTheme?.boldTextTheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadiusFoundation.all24,
      borderSide: const BorderSide(
        width: 2,
        color: Colors.white,
      ),
    );

    return TextField(
      controller: controller,
      style: boldTextTheme?.caption1Bold,
      maxLines: (selectedChips?.length ?? 0) + 1,
      decoration: InputDecoration(
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        focusedErrorBorder: border,
        errorBorder: border,
        disabledBorder: border,
        enabled: true,
        filled: true,
        fillColor: ColorsFoundation.surface3,
        prefixIconConstraints: BoxConstraints(
          maxWidth: 0.75.sw,
        ),
        prefixIcon: Wrap(
          spacing: SpacingFoundation.horizontalSpacing8,
          runSpacing: SpacingFoundation.verticalSpacing8,
          children: selectedChips
                  ?.map<Widget>(
                    (e) => UiKitCompactTextCard(
                      text: e,
                    ),
                  )
                  .toList() ??
              [],
        ).paddingAll(EdgeInsetsFoundation.all16),
      ),
    );
  }
}
