import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitParalaxPhotoCard extends StatefulWidget {
  final String? frontImage;
  final String? upperMiddleImage;
  final String? lowerMiddleImage;
  final String? backImage;

  const UiKitParalaxPhotoCard({
    Key? key,
    this.frontImage,
    this.upperMiddleImage,
    this.backImage,
    this.lowerMiddleImage,
  }) : super(key: key);

  @override
  State<UiKitParalaxPhotoCard> createState() => _UiKitParalaxPhotoCardState();
}

class _UiKitParalaxPhotoCardState extends State<UiKitParalaxPhotoCard> {
  UserAccelerometerEvent? initialEvent;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((time) {
      _subscription = userAccelerometerEventStream().listen(_accelerometerListener);
      setState(() {});
    });
  }

  final StreamController<TiltStreamModel> _tiltStreamController = StreamController<TiltStreamModel>.broadcast();

  StreamSubscription<UserAccelerometerEvent>? _subscription;

  void _accelerometerListener(UserAccelerometerEvent event) {
    if (initialEvent == null) {
      print('updating initial event');
      setState(() => initialEvent = event);
      print('updated initial event: $initialEvent');
    }
    double x = event.x;
    double y = event.y;
    if (initialEvent != null) {
      x += initialEvent!.x;
      y += initialEvent!.y;
    }
    _tiltStreamController.add(
      TiltStreamModel(
        gesturesType: GesturesType.sensors,
        position: Offset(x, y),
      ),
    );
    print(event);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.8.sh,
      width: 1.sw,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (widget.backImage != null)
            ImageWidget(
              link: widget.backImage,
              fit: BoxFit.cover,
            ),
          Tilt(
            tiltStreamController: _tiltStreamController,
            childLayout: ChildLayout(
              inner: [
                if (widget.upperMiddleImage != null)
                  TiltParallax(
                    child: ImageWidget(
                      link: widget.upperMiddleImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                if (widget.frontImage != null)
                  TiltParallax(
                    child: ImageWidget(
                      link: widget.frontImage,
                      fit: BoxFit.cover,
                    ),
                  ),
              ],
            ),
            lightConfig: LightConfig(disable: true),
            shadowConfig: ShadowConfig(disable: true),
            tiltConfig: TiltConfig(
              sensorFactor: 25,
              enableRevert: false,
              enableSensorRevert: false,
              enableReverse: false,
              angle: 10,
            ),
            child: Container(
              height: 0.8.sh,
              width: 1.sw,
            ),
          )
        ],
      ),
    );
  }
}
