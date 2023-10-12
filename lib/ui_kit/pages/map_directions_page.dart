import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class MapDirectionsPage extends StatefulWidget {
  final ValueNotifier<LatLng>? currentLocationNotifier;
  final VoidCallback? onCurrentLocationRequested;
  final TextEditingController searchController;
  final String destinationTitle;
  final VoidCallback? onDirectionsRequested;
  final LatLng destination;

  const MapDirectionsPage({
    Key? key,
    this.currentLocationNotifier,
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
  late final FocusNode _focusNode = FocusNode()
    ..addListener(() {
      if (!_focusNode.hasFocus) {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
        );
      }
      if (focusNotifier.value != _focusNode.hasFocus) focusNotifier.value = _focusNode.hasFocus;
    });

  late final ValueNotifier<bool> focusNotifier = ValueNotifier<bool>(false);

  void _currentLocationListener() {
    if (widget.currentLocationNotifier?.value != null) {
      controller?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: widget.currentLocationNotifier!.value,
            zoom: 14,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.currentLocationNotifier?.addListener(_currentLocationListener);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    widget.currentLocationNotifier?.removeListener(_currentLocationListener);
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
              target: widget.destination,
              zoom: 14,
            ),
            trafficEnabled: true,
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
              hintText: 'Search',
              suffixIcon: SpacingFoundation.none,
              prefix: UiKitSwitchableInputPrefix(
                secondary: GestureDetector(
                  onTap: () {
                    _focusNode.unfocus();
                  },
                  child: ImageWidget(
                    svgAsset: GraphicsFoundation.instance.svg.arrowLeft,
                    color: ColorsFoundation.darkNeutral900,
                  ),
                ),
                primary: ImageWidget(
                  svgAsset: GraphicsFoundation.instance.svg.landmark,
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
        onPressed: widget.onCurrentLocationRequested ?? () {},
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        enableFeedback: true,
        child: ImageWidget(
          svgAsset: GraphicsFoundation.instance.svg.locationSearching,
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
                      svgAsset: GraphicsFoundation.instance.svg.route,
                      height: 15.h,
                      color: Colors.white,
                      fit: BoxFit.fitHeight,
                    ),
                    SpacingFoundation.horizontalSpace4,
                    Text(
                      'Directions',
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
