import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitShadowWrapper extends StatelessWidget {
  final BorderRadius? borderRadius;
  final BoxShape? shape;
  final Widget child;
  final bool applyShadow;
  final Color? color;
  final Color? backgroundColor;


  const UiKitShadowWrapper({
    super.key,
     this.borderRadius,
     this.color,
     this.backgroundColor,
     this.shape,
    required this.child,
    this.applyShadow = true
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: shape ?? BoxShape.rectangle,
        borderRadius: borderRadius,
        color: backgroundColor,
        boxShadow:  [
          if(applyShadow)
           BoxShadow(
            color: color ?? ColorsFoundation.shadowPink,
            blurRadius: 18,
            spreadRadius: 0,
            offset: Offset.zero,
            // blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: child,
    );
    
  }
}
