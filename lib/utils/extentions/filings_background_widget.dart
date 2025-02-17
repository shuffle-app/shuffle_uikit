import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

enum FilingsBackground {
  dubai,
  phuket,
}

extension FilingsBackgroundWidget on FilingsBackground {
  Widget currentBackground(double height, {Color? color}) {
    final width = 0.95.sw;
    switch (this) {
      case FilingsBackground.dubai:
        return SizedBox(
          height: height * 0.75,
          width: width,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadiusFoundation.all28,
              child: ImageWidget(
                width: double.infinity,
                svgAsset: GraphicsFoundation.instance.svg.dubaiSilhouette,
                fit: BoxFit.fitWidth,
                color: color,
              ),
            ),
          ),
        ).paddingOnly(top: height * 0.25);
      case FilingsBackground.phuket:
        return SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              Align(
                alignment: Alignment(-1.0, -0.6),
                child: ImageWidget(
                  fit: BoxFit.fill,
                  height: 1.sw <= 380 ? null : 0.37.sw,
                  svgAsset: GraphicsFoundation.instance.svg.pavilion,
                  color: color,
                ),
              ),
              Align(
                alignment: Alignment(-0.35, 0.8),
                child: ImageWidget(
                  fit: BoxFit.fill,
                  height: 0.26.sw,
                  svgAsset: GraphicsFoundation.instance.svg.elephant3,
                  color: color,
                ),
              ),
              Align(
                alignment: Alignment(1, 1),
                child: ImageWidget(
                  fit: BoxFit.fill,
                  height: 0.43.sw,
                  svgAsset: GraphicsFoundation.instance.svg.elephant1,
                  color: color,
                ),
              ),
            ],
          ),
        );
      default:
        return SizedBox.shrink();
    }
  }
}
