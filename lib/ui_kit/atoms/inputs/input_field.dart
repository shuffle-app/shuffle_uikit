import 'package:flutter/cupertino.dart';

abstract class UiKitInputField {
  final TextEditingController controller;
  final String? hintText;
  final String? errorText;
  final bool enabled;
  final String? Function(String?)? validator;

  const UiKitInputField({
    required this.controller,
    this.hintText,
    this.enabled = true,
    this.errorText,
    this.validator,
  });
}
