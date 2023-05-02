import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with TickerProviderStateMixin {
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
          svgAsset: Assets.images.svg.sufle,
        ),
        Positioned(
            left: 100.w,
            width: 60.w,
            child: Assets.images.svg.logo
                .svg(package: 'shuffle_uikit', fit: BoxFit.fitWidth))
      ],
    );
  }
}
