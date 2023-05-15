import 'package:flutter/material.dart';

//помогает создавать разделители
//16.heightBox
extension SizeBoxExtention on double {
  Widget get widthBox => SizedBox(width: this);

  Widget get heightBox => SizedBox(height: this);
}
