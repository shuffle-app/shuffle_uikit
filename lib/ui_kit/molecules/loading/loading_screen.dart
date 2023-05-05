import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> with TickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        ImageWidget(
          svgAsset: GraphicsFoundation.instance.svg.sufle,
        ),
        Positioned(
          left: 98.w,
          width: 60.w,
          child: ImageWidget(
            svgAsset: GraphicsFoundation.instance.svg.logo,
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }
}
