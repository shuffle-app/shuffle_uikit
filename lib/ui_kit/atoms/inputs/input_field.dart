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

//TODO: make factory to return a UiKitInputField what we need
// ref: https://www.flutterclutter.dev/flutter/basics/2023-03-19-what-are-factory-constructors/ "Instance of a subtype"