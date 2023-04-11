import 'package:flutter/cupertino.dart';

abstract class UiKitInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? errorText;
  final bool enabled;
  final String? Function(String?)? validator;

  const UiKitInputField({
    super.key,
    required this.controller,
    this.hintText,
    this.enabled = true,
    this.errorText,
    this.validator,
  });

  @override
  Widget build(BuildContext context);
}
