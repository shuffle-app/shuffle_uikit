import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class MapDirectionsPage extends StatefulWidget {
  final ValueNotifier<LatLng> currentLocationNotifier;
  final VoidCallback? onCurrentLocationRequested;
  final TextEditingController searchController;
  final String destinationTitle;
  final VoidCallback? onDirectionsRequested;
  final LatLng destination;

  const MapDirectionsPage({
    Key? key,
    required this.currentLocationNotifier,
    this.onCurrentLocationRequested,
    this.onDirectionsRequested,
    required this.searchController,
    required this.destination,
    required this.destinationTitle,
  }) : super(key: key);

  @override
  State<MapDirectionsPage> createState() => _MapDirectionsPageState();
}

class _MapDirectionsPageState extends State<MapDirectionsPage> {
  GoogleMapController? controller;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  Marker? marker;
  final apiKey = const String.fromEnvironment('googleApiKey');
  List<Polyline> directionLines = [];
  late final FocusNode _focusNode = FocusNode()
    ..addListener(() {
      if (focusNotifier.value != _focusNode.hasFocus) focusNotifier.value = _focusNode.hasFocus;
    });

  late final ValueNotifier<bool> focusNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Future.delayed(
        const Duration(milliseconds: 500),
        () => widget.onCurrentLocationRequested?.call(),
      );
      _focusNode.requestFocus();
      widget.currentLocationNotifier.addListener(_currentLocationListener);
    });
  }

  void _currentLocationListener() async {
    final points = PolylinePoints();
    final result = await points.getRouteBetweenCoordinates(
      apiKey,
      PointLatLng(widget.currentLocationNotifier.value.latitude, widget.currentLocationNotifier.value.longitude),
      PointLatLng(widget.destination.latitude, widget.destination.longitude),
    );
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

    return Scaffold(
      extendBody: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          GoogleMap(
            onMapCreated: (mapController) => setState(() => controller = mapController),
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
            width: 1.sw - SpacingFoundation.horizontalSpacing32,
            child: UiKitElevatedInputWithSwitchingPrefix(
              focusNode: _focusNode,
              readOnly: true,
              controller: widget.searchController,
              hintText: S.of(context).Search,
              suffixIcon: SpacingFoundation.none,
              prefix: UiKitSwitchableInputPrefix(
                secondary: GestureDetector(
                  onTap: () {
                    if (_focusNode.hasFocus) {
                      Navigator.pop(context);
                    } else {
                      _focusNode.unfocus();
                    }
                  },
                  child: const ImageWidget(
                    iconData: ShuffleUiKitIcons.arrowleft,
                    color: ColorsFoundation.darkNeutral900,
                  ),
                ),
                primary: const ImageWidget(
                  iconData: ShuffleUiKitIcons.landmark,
                  color: ColorsFoundation.darkNeutral900,
                ),
                notifier: focusNotifier,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () async {
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
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.disabled)) return theme?.colorScheme.darkNeutral300;

                    return theme?.colorScheme.info;
                  }),
                  foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
                  elevation: MaterialStateProperty.resolveWith((states) => 0),
                  splashFactory: WaveSplash.splashFactory,
                  shape: MaterialStateProperty.resolveWith(
                    (states) => RoundedRectangleBorder(borderRadius: BorderRadiusFoundation.max),
                  ),
                  padding: MaterialStateProperty.resolveWith(
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
                      S.of(context).Directions,
                      style: theme?.boldTextTheme.caption1Bold,
                    ),
                  ],
                ),
              ),
              SpacingFoundation.verticalSpace24,
            ],
          ).paddingSymmetric(horizontal: EdgeInsetsFoundation.horizontal16),
        ),
      ),
    );
  }
}
