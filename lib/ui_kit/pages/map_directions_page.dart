// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:huawei_map/huawei_map.dart' as hms;
import 'package:shuffle_uikit/shuffle_uikit.dart';

class MapDirectionsPage extends StatefulWidget {
  final ValueNotifier<LatLng> currentLocationNotifier;
  final Future Function()? onCurrentLocationRequested;
  final TextEditingController searchController;
  final String destinationTitle;
  final VoidCallback? onDirectionsRequested;
  final VoidCallback? onTaxisRequested;
  final LatLng destination;
  final bool isHuawei;

  const MapDirectionsPage({
    super.key,
    required this.currentLocationNotifier,
    this.onCurrentLocationRequested,
    this.onDirectionsRequested,
    this.onTaxisRequested,
    required this.searchController,
    required this.destination,
    required this.destinationTitle,
    this.isHuawei = false,
  });

  @override
  State<MapDirectionsPage> createState() => _MapDirectionsPageState();
}

class _MapDirectionsPageState extends State<MapDirectionsPage> {
  GoogleMapController? controller;
  hms.HuaweiMapController? huaweiController;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  Marker? marker;
  final apiKey = const String.fromEnvironment('googleApiKey');
  List<Polyline> directionLines = [];
  late final FocusNode _focusNode = FocusNode()
    ..addListener(() {
      if (focusNotifier.value != _focusNode.hasFocus) {
        focusNotifier.value = _focusNode.hasFocus;
      }
    });

  late final ValueNotifier<bool> focusNotifier = ValueNotifier<bool>(false);
  bool loading = true;

  @override
  void initState() {
    super.initState();
    if (widget.isHuawei) {
      hms.HuaweiMapInitializer.initializeMap();
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Future.delayed(
        const Duration(milliseconds: 500),
        () async {
          try {
            await widget.onCurrentLocationRequested?.call();
          } catch (e) {
            if (widget.isHuawei) {
              await huaweiController?.animateCamera(
                  hms.CameraUpdate.newLatLng(hms.LatLng(widget.destination.latitude, widget.destination.longitude)));
            } else {
              await controller?.animateCamera(CameraUpdate.newLatLng(widget.destination));
            }
            setState(() {
              loading = false;
            });
          }
        },
      );
      _focusNode.requestFocus();
      // widget.currentLocationNotifier.addListener(_currentLocationListener);
    });
  }

  void _currentLocationListener() async {
    try {
      final points = PolylinePoints();
      debugPrint(
          'getRouteBetweenCoordinates from ${widget.currentLocationNotifier.value.latitude} ${widget.currentLocationNotifier.value.longitude} toooo ${widget.destination.latitude} ${widget.destination.longitude}');
      final result = await points.getRouteBetweenCoordinates(
          googleApiKey: apiKey,
          request: PolylineRequest(
            origin: PointLatLng(
                widget.currentLocationNotifier.value.latitude, widget.currentLocationNotifier.value.longitude),
            destination: PointLatLng(widget.destination.latitude, widget.destination.longitude),
            mode: TravelMode.driving,
          ));
      if (widget.isHuawei) {
        await huaweiController?.animateCamera(hms.CameraUpdate.newLatLngBounds(
          hms.LatLngBounds(
            southwest: hms.LatLng(
              min(widget.currentLocationNotifier.value.latitude, widget.destination.latitude),
              min(widget.currentLocationNotifier.value.longitude, widget.destination.longitude),
            ),
            northeast: hms.LatLng(
              max(widget.currentLocationNotifier.value.latitude, widget.destination.latitude),
              max(widget.currentLocationNotifier.value.longitude, widget.destination.longitude),
            ),
          ),
          72.w,
        ));
      } else {
        await controller?.animateCamera(
          CameraUpdate.newLatLngBounds(
            LatLngBounds(
              southwest: LatLng(
                min(widget.currentLocationNotifier.value.latitude, widget.destination.latitude),
                min(widget.currentLocationNotifier.value.longitude, widget.destination.longitude),
              ),
              northeast: LatLng(
                max(widget.currentLocationNotifier.value.latitude, widget.destination.latitude),
                max(widget.currentLocationNotifier.value.longitude, widget.destination.longitude),
              ),
            ),
            72.w,
          ),
        );
      }

      setState(() {
        directionLines = [
          Polyline(
            polylineId: const PolylineId('directions'),
            points: result.points.map((e) => LatLng(e.latitude, e.longitude)).toList(),
            color: ColorsFoundation.info,
            width: 4,
            startCap: Cap.buttCap,
            jointType: JointType.bevel,
            endCap: Cap.roundCap,
            visible: true,
          ),
        ];
        marker = Marker(
          markerId: const MarkerId('destination'),
          position: LatLng(result.points.last.latitude, result.points.last.longitude),
          icon: markerIcon,
        );
      });
    } catch (e) {
      SnackBarUtils.show(message: 'Directions unavailable', context: context, type: AppSnackBarType.error);
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    _focusNode.dispose();
    widget.currentLocationNotifier.removeListener(_currentLocationListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;
    final colorScheme = theme?.colorScheme;

    return Scaffold(
      extendBody: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (widget.isHuawei)
            hms.HuaweiMap(
              onMapCreated: (mapController) {
                widget.currentLocationNotifier.addListener(_currentLocationListener);
                setState(() => huaweiController = mapController);
                debugPrint('onMapCreated');
              },
              initialCameraPosition: hms.CameraPosition(
                target: hms.LatLng(
                    widget.currentLocationNotifier.value.latitude, widget.currentLocationNotifier.value.longitude),
                zoom: 14,
              ),
              markers: {
                if (marker != null)
                  hms.Marker(
                      markerId: hms.MarkerId(marker!.markerId.value),
                      position: hms.LatLng(marker!.position.latitude, marker!.position.longitude))
              },
              polylines: Set.from(directionLines.map((element) => hms.Polyline(
                  polylineId: hms.PolylineId(element.polylineId.value),
                  color: ColorsFoundation.info,
                  width: 4,
                  startCap: hms.Cap.buttCap,
                  jointType: hms.JointType.bevel,
                  endCap: hms.Cap.roundCap,
                  visible: true,
                  points: element.points.map((e) => hms.LatLng(e.latitude, e.longitude)).toList()))),
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
            )
          else
            GoogleMap(
              onMapCreated: (mapController) {
                widget.currentLocationNotifier.addListener(_currentLocationListener);
                setState(() => controller = mapController);
                debugPrint('onMapCreated');
              },
              initialCameraPosition: CameraPosition(
                target: widget.currentLocationNotifier.value,
                zoom: 14,
              ),
              markers: {if (marker != null) marker!},
              polylines: Set.from(directionLines),
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
            ),
          Positioned(
            top: MediaQuery.viewPaddingOf(context).top + SpacingFoundation.verticalSpacing16,
            left: SpacingFoundation.horizontalSpacing16,
            child: Material(
              clipBehavior: Clip.none,
              shape: const CircleBorder(),
              color: theme?.colorScheme.headingTypography,
              child: InkWell(
                borderRadius: BorderRadiusFoundation.all40,
                onTap: () {
                  Navigator.pop(context);
                },
                child: Ink(
                  child: ImageWidget(
                    color: theme?.colorScheme.darkNeutral900,
                    iconData: ShuffleUiKitIcons.arrowleft,
                  ).paddingAll(EdgeInsetsFoundation.all12),
                ),
              ),
            ),
          ),
          if (loading)
            Positioned(
              width: 1.sw,
              height: 1.sh,
              child: ColoredBox(
                color: colorScheme?.surface3.withOpacity(0.75) ?? Colors.black54,
                child: const Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () {
          widget.onCurrentLocationRequested?.call();
        },
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        enableFeedback: true,
        child: ImageWidget(
          iconData: ShuffleUiKitIcons.locationSearching,
          height: 16.h,
          fit: BoxFit.fitHeight,
        ),
      ),
      bottomNavigationBar: BottomNavigationBarTheme(
        data: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 16,
                offset: const Offset(0, -4),
              ),
            ],
            borderRadius: BorderRadiusFoundation.onlyTop24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacingFoundation.verticalSpace4,
              Center(
                child: Container(
                  height: 4.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusFoundation.max,
                    color: theme?.colorScheme.darkNeutral200,
                  ),
                ),
              ),
              SpacingFoundation.verticalSpace16,
              Text(
                widget.destinationTitle,
                style: theme?.boldTextTheme.caption1Medium.copyWith(color: Colors.black),
              ),
              SpacingFoundation.verticalSpace4,
              Row(children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.disabled)) {
                        return theme?.colorScheme.darkNeutral300;
                      }

                      return theme?.colorScheme.surface1;
                      // return theme?.colorScheme.info;
                    }),
                    foregroundColor: WidgetStateProperty.resolveWith((states) => Colors.white),
                    elevation: WidgetStateProperty.resolveWith((states) => 0),
                    splashFactory: WaveSplash.splashFactory,
                    shape: WidgetStateProperty.resolveWith(
                      (states) => RoundedRectangleBorder(borderRadius: BorderRadiusFoundation.max),
                    ),
                    padding: WidgetStateProperty.resolveWith(
                      (states) => EdgeInsets.symmetric(
                        vertical: EdgeInsetsFoundation.vertical8,
                        horizontal: EdgeInsetsFoundation.horizontal16,
                      ),
                    ),
                  ),
                  onPressed: widget.onDirectionsRequested,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ImageWidget(
                        iconData: ShuffleUiKitIcons.route,
                        height: 15.h,
                        color: Colors.white,
                        fit: BoxFit.fitHeight,
                      ),
                      SpacingFoundation.horizontalSpace4,
                      Text(
                        S.of(context).Directions.toUpperCase(),
                        style: theme?.boldTextTheme.caption1Bold.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                if (widget.onTaxisRequested != null) ...[
                  SpacingFoundation.horizontalSpace4,
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.resolveWith((states) {
                        if (states.contains(WidgetState.disabled)) {
                          return theme?.colorScheme.darkNeutral300;
                        }

                        return theme?.colorScheme.surface1;
                        // return theme?.colorScheme.info;
                      }),
                      foregroundColor: WidgetStateProperty.resolveWith((states) => Colors.white),
                      elevation: WidgetStateProperty.resolveWith((states) => 0),
                      splashFactory: WaveSplash.splashFactory,
                      shape: WidgetStateProperty.resolveWith(
                        (states) => RoundedRectangleBorder(borderRadius: BorderRadiusFoundation.max),
                      ),
                      padding: WidgetStateProperty.resolveWith(
                        (states) => EdgeInsets.symmetric(
                          vertical: EdgeInsetsFoundation.vertical8,
                          horizontal: EdgeInsetsFoundation.horizontal16,
                        ),
                      ),
                    ),
                    onPressed: widget.onTaxisRequested,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ImageWidget(
                          svgAsset: GraphicsFoundation.instance.svg.taxi,
                          height: 15.h,
                          color: Colors.white,
                          fit: BoxFit.fitHeight,
                        ),
                        SpacingFoundation.horizontalSpace4,
                        Text(
                          S.of(context).Taxi.toUpperCase(),
                          style: theme?.boldTextTheme.caption1Bold.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ]),
              SpacingFoundation.verticalSpace24,
            ],
          ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
        ),
      ),
    );
  }
}
