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
  final String? skyboxImage;
  final bool? autoRotate;
  final ValueChanged<WebViewController>? onWebViewCreated;
  final Set<JavascriptChannel>? javascriptChannels;
  final VoidCallback? onTap;
  late final JavascriptChannel onTapChannel;

  UiKitBase3DViewer({super.key,
    required this.localPath,
    this.backgroundColor,
    this.animationName,
    this.javascriptChannels,
    this.poster,
    this.scale,
    this.autoPlay,
    this.onWebViewCreated,
    this.environmentImage,
    this.skyboxImage,
    this.onTap,
    this.autoRotate}) {
    onTapChannel = JavascriptChannel('onTapChannel', onMessageReceived: (message) {
      onTap?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('UiKitBase3DViewer path: $localPath');
    return ModelViewer(
      onWebViewCreated: onWebViewCreated,
      animationName: animationName,
      autoPlay: autoPlay,
      id: 'model-viewer',
      backgroundColor: backgroundColor ?? Colors.transparent,
      src: localPath.startsWith('http') ? localPath : 'file://$localPath',
      poster: poster,
      scale: scale,
      disableTap: true,
      loading: Loading.eager,
      interactionPrompt:InteractionPrompt.none,
      // iosSrc: 'https://shuffle-app-production.s3.eu-west-2.amazonaws.com/static-files/3dmodels/objects/Diamond.usdz',
      // disablePan: true,
      // cameraOrbit: '10deg 75deg 0m',
      animationCrossfadeDuration: 500,
      // interactionPrompt: InteractionPrompt.whenFocused,
      // touchAction: TouchAction.panY,
      // xrEnvironment: true,
      // arPlacement: ArPlacement.floor,
      // arScale: ArScale.auto,
      // arModes: const ['scene-viewer', 'webxr', 'quick-look'],
      autoRotate: autoRotate,
      disableZoom: true,
      exposure: 1,
      debugLogging: false,
      environmentImage: environmentImage ?? 'neutral',
      skyboxImage: skyboxImage,
      javascriptChannels: {...?javascriptChannels, onTapChannel},
      innerModelViewerHtml: '''
      
      <div class="progress-bar hide" slot="progress-bar">
        <div class="update-bar"></div>
    </div>
      ''',
      relatedJs: '''
function handleTap(event) {
  // Send the tap data to the JavascriptChannel
  onTapChannel.postMessage("tap");
}

// Attach the event listener to the relevant element(s)
const tappableElements = document.querySelectorAll('model-viewer'); 
tappableElements.forEach(element => {
  element.addEventListener('click', handleTap);
});
      ''',
    );
  }
}
