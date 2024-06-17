import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class UiKitBase3DViewer extends StatelessWidget {
  final String localPath;
  final Color? backgroundColor;
  final String? animationName;
  final String? poster;
  final String? scale;
  final bool? autoPlay;
  final String? environmentImage;
  final bool? autoRotate;
  final ValueChanged<WebViewController>? onWebViewCreated;
  final Set<JavascriptChannel>? javascriptChannels;

  const UiKitBase3DViewer({super.key,
    required this.localPath,
    this.backgroundColor,
    this.animationName,
    this.javascriptChannels,
    this.poster,
    this.scale,
    this.autoPlay,
    this.onWebViewCreated,
    this.environmentImage,
    this.autoRotate});

  @override
  Widget build(BuildContext context) {
    return ModelViewer(
      onWebViewCreated: onWebViewCreated,
      animationName: animationName,
      autoPlay: autoPlay,
      id: 'model-viewer',
      backgroundColor: backgroundColor ?? Colors.transparent,
      src: 'file:///$localPath',
      poster: poster,
      scale: scale,
      disableTap: true,
      loading: Loading.eager,
      // disablePan: true,
      // cameraOrbit: '10deg 75deg 0m',
      animationCrossfadeDuration: 500,
      interactionPrompt: InteractionPrompt.whenFocused,
      // touchAction: TouchAction.panY,
      // xrEnvironment: true,
      // arPlacement: ArPlacement.floor,
      // arScale: ArScale.auto,
      // arModes: const ['scene-viewer', 'webxr', 'quick-look'],
      autoRotate: autoRotate,
      disableZoom: true,
      exposure: 1,
      environmentImage: environmentImage,
      javascriptChannels: javascriptChannels,
    );
  }
}
