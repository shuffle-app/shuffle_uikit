import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_html_iframe/shims/dart_ui_real.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:parallax_sensors_bg/parallax_sensors_bg.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitGeneralPhotoBanner extends StatefulWidget {
  final double height;
  final double width;
  final String frontImage;
  final String backImage;
  final String upperMiddleImage;
  final String lowerMiddleImage;
  final String title;

  const UiKitGeneralPhotoBanner({
    Key? key,
    required this.height,
    required this.width,
    required this.frontImage,
    required this.backImage,
    required this.upperMiddleImage,
    required this.lowerMiddleImage,
    required this.title,
  }) : super(key: key);

  @override
  State<UiKitGeneralPhotoBanner> createState() => _UiKitGeneralPhotoBannerState();
}

class _UiKitGeneralPhotoBannerState extends State<UiKitGeneralPhotoBanner> {
  AccelerometerEvent? initialEvent;

  StreamSubscription<AccelerometerEvent>? accelerometerEventSubscription;

  StreamController<TiltStreamModel> accelerometerUiStreamController = StreamController<TiltStreamModel>.broadcast();

  bool get initialEventIsSet =>
      initialEvent != null && initialEvent!.x != 0 && initialEvent!.y != 0 && initialEvent!.z != 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((time) {
      // userAccelerometerEventStream(samplingPeriod: SensorInterval.normalInterval).listen(_accelerometerListener);
      setState(() {});
    });
  }

  void _accelerometerListener(AccelerometerEvent event) {
    if (initialEvent == null) {
      print('updating initial event');
      setState(() => initialEvent = event);
      print('updated initial event: $initialEvent');
    }

    double dx = event.x;
    double dy = event.y;
    double dz = event.z;

    if (initialEvent != null && initialEventIsSet) {
      dx += initialEvent!.x;
      dy += initialEvent!.y;
      dz += initialEvent!.z;
    }

    accelerometerUiStreamController.add(
      TiltStreamModel(
        gestureUse: true,
        position: Offset(dx, dy),
        gesturesType: GesturesType.sensors,
      ),
    );
  }

  @override
  void dispose() {
    accelerometerEventSubscription?.cancel();
    accelerometerUiStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.height / widget.width);
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadiusFoundation.all24,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ImageWidget(
              link: widget.backImage,
              fit: BoxFit.cover,
              height: widget.height,
              width: widget.width,
            ),
            Positioned(
              height: widget.height,
              width: widget.width,
              top: 0,
              child: Parallax(
                onAccelerometerEvent: _accelerometerListener,
                animationDuration: 200,
                layers: [
                  Layer(
                    sensitivity: 8,
                    child: ImageWidget(
                      link: widget.lowerMiddleImage,
                      fit: BoxFit.cover,
                      width: widget.width,
                      height: widget.height,
                    ),
                  ),
                  Layer(
                    sensitivity: 4,
                    child: ImageWidget(
                      link: widget.upperMiddleImage,
                      fit: BoxFit.cover,
                      width: widget.width,
                      height: widget.height,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              width: widget.width,
              height: widget.height,
              bottom: 0,
              child: Tilt(
                clipBehavior: Clip.none,
                childLayout: ChildLayout(
                  outer: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: ImageWidget(
                        link: widget.frontImage,
                        height: widget.height,
                        width: widget.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    TiltParallax(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadiusFoundation.max,
                          ),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 15,
                              sigmaY: 15,
                              tileMode: TileMode.clamp,
                            ),
                            child: Text(
                              widget.title,
                              style: regularTextTheme?.title1.copyWith(color: ColorsFoundation.lightSurface),
                            ).paddingSymmetric(
                              vertical: EdgeInsetsFoundation.vertical4,
                              horizontal: EdgeInsetsFoundation.horizontal16,
                            ),
                          ),
                        ).paddingAll(EdgeInsetsFoundation.all16),
                      ),
                    ),
                  ],
                ),
                tiltConfig: TiltConfig(
                  sensorMoveDuration: Duration(milliseconds: 200),
                  moveDuration: Duration(milliseconds: 200),
                  leaveDuration: Duration(milliseconds: 200),
                  controllerMoveDuration: Duration(milliseconds: 200),
                  controllerLeaveDuration: Duration(milliseconds: 200),
                  enableRevert: false,
                  enableReverse: false,
                  enableGestureTouch: false,
                  enableSensorRevert: false,
                  enableGestureSensors: true,
                  angle: 10,
                ),
                shadowConfig: ShadowConfig(
                  disable: true,
                ),
                lightConfig: LightConfig(
                  disable: true,
                ),
                tiltStreamController: accelerometerUiStreamController,
                child: Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
