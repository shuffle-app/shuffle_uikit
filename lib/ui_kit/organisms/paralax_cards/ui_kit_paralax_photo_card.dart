import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:parallax_sensors_bg/parallax_sensors_bg.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitParallaxPhotoCard extends StatefulWidget {
  final String frontImage;
  final String upperMiddleImage;
  final String lowerMiddleImage;
  final String backImage;
  final double height;
  final double width;

  const UiKitParallaxPhotoCard({
    Key? key,
    required this.frontImage,
    required this.upperMiddleImage,
    required this.backImage,
    required this.lowerMiddleImage,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  State<UiKitParallaxPhotoCard> createState() => _UiKitParallaxPhotoCardState();
}

class _UiKitParallaxPhotoCardState extends State<UiKitParallaxPhotoCard> {
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

    print('dx: $dx, dy: $dy, dz: $dz');

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
    final regularTextTheme = context.uiKitTheme?.regularTextTheme;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusFoundation.all24,
      ),
      height: widget.height,
      width: widget.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ImageWidget(
            link: widget.backImage,
            fit: BoxFit.cover,
            height: widget.height,
            width: widget.width,
          ),
          Parallax(
            onAccelerometerEvent: _accelerometerListener,
            animationDuration: 200,
            layers: [
              Layer(
                preventCrop: true,
                sensitivity: 8,
                child: ImageWidget(
                  link: widget.lowerMiddleImage,
                  fit: BoxFit.cover,
                ),
              ),
              Layer(
                preventCrop: true,
                sensitivity: 4,
                child: ImageWidget(
                  link: widget.upperMiddleImage,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Positioned(
            width: widget.width,
            bottom: 0,
            child: Tilt(
              childLayout: ChildLayout(
                outer: [
                  TiltParallax(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'palette\nyourself',
                        style: regularTextTheme?.title2,
                      ).paddingOnly(right: EdgeInsetsFoundation.horizontal16),
                    ),
                  )
                ],
              ),
              tiltConfig: TiltConfig(
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
              child: ImageWidget(
                link: widget.frontImage,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
