import 'package:flutter/material.dart';

/// Abstraction layer for all input fields
/// it has all the common properties of any input fields in UiKit
///
/// [controller] is the text controller of the input field. It enables to interact with text in the input field
/// [hintText] is the text that appears in the input field when it is empty
/// [errorText] is the text that appears under the input field when it is invalid
/// [enabled] is a boolean that enables or disables the input field
/// [validator] is a function that validates the input field. It returns a string when the input field is invalid
///
abstract class BaseUiKitInputField {
  final TextEditingController controller;
  final String? hintText;
  final String? errorText;
  final bool enabled;
  final bool obscureText;
  final String? Function(String?)? validator;

  const BaseUiKitInputField({
    required this.controller,
    this.hintText,
    this.obscureText = false,
    this.enabled = true,
    this.errorText,
    this.validator,
  });
}

//TODO: make factory to return a UiKitInputField what we need
// ref: https://www.flutterclutter.dev/flutter/basics/2023-03-19-what-are-factory-constructors/ "Instance of a subtype"
