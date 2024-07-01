import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with SingleTickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();
  final animDuration = const Duration(milliseconds: 250);
  Uint8List? selectedImageBytes;
  Uint8List? cropedImageBytes;
  XFile? xFile;
  UiKitPictureViewFinderController controller = UiKitPictureViewFinderController();
  List<double> depthData = [];
  late ui.Image mainImage;
  final ValueNotifier<ui.Offset> tiltNotifier = ValueNotifier(ui.Offset.zero);
  StreamSubscription<AccelerometerEvent>? accelerometerEventStreamSubscription;

  Future<List<double>> createDepthDataFromDepthMap(List<int> imageBytes) async {
    img.Image? depthMap = img.decodeImage(Uint8List.fromList(imageBytes));
    if (depthMap == null) {
      return [];
    }
    // If the image is not in grayscale, convert it to grayscale
    // This step is optional depending on the format of your depth map
    img.grayscale(depthMap);

    // Extract depth data by normalizing pixel brightness values
    List<double> depthData = [];
    for (int y = 0; y < depthMap.height; y++) {
      for (int x = 0; x < depthMap.width; x++) {
        final pixel = depthMap.getPixelSafe(x, y);
        img.Color color = depthMap.getColor(pixel.r, pixel.g, pixel.b, pixel.a);
        int brightness = color.luminance.toInt(); // Get luminance for grayscale value
        double normalizedDepth = brightness / 255.0; // Normalize to 0.0 to 1.0 range
        depthData.add(normalizedDepth);
      }
    }

    return depthData;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final depthMap = await rootBundle.load(
          'packages/shuffle_uikit/${GraphicsFoundation.instance.png.paralaxBanners.mockAdBanner16.mockAdBanner16Depth.path}');
      final mainImageData =
          await rootBundle.load('packages/shuffle_uikit/${GraphicsFoundation.instance.png.mockAdBanner16.path}');

      ui.decodeImageFromList(
        Uint8List.fromList(mainImageData.buffer.asInt8List()),
        (result) => setState(() => mainImage = result),
      );

      final depthMapBytes = depthMap.buffer.asInt8List();
      final map = await createDepthDataFromDepthMap(depthMapBytes);
      setState(() => depthData = map);
      print('depthData: ${depthData.length}');
      controller.addListener(() {
        setState(() {});
      });
      accelerometerEventStreamSubscription = accelerometerEventStream().listen((event) {
        tiltNotifier.value = ui.Offset(event.x, event.y);
      });
      // final file = await ImagePicker().pickImage(source: ImageSource.gallery);
      // final bytes = await file?.readAsBytes();
      //
      // log('bytes: ${bytes?.isNotEmpty}');
      // setState(() {
      //   xFile = file;
      //   if (bytes != null) selectedImageBytes = Uint8List.fromList(bytes);
      // });
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    controller.dispose();
    accelerometerEventStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top, width: 1.sw),
            SpacingFoundation.verticalSpace24,
            Container(
              width: 1.sw - 48,
              height: (1.sw - 48) * 1.17,
              child: AnimatedBuilder(
                animation: tiltNotifier,
                builder: (context, child) {
                  return CustomPaint(
                    size: Size(1.sw - 48, (1.sw - 48) * 1.17),
                    painter: DepthPainter(
                      mainImage: mainImage,
                      depthData: depthData,
                      tiltX: tiltNotifier.value.dx,
                      tiltY: tiltNotifier.value.dy,
                    ),
                  );
                },
              ),
            ),
            // const UiKitShuffleParallaxTextBanner2(),
            // UiKitGeneralPhotoBanner(
            //   title: 'Dubai',
            //   width: 1.sw - 48,
            //   height: (1.sw - 48) * 1.17,
            //   frontImage: GraphicsFoundation.instance.png.paralaxBanners.mockAdBanner16.front.path,
            //   backImage: GraphicsFoundation.instance.png.paralaxBanners.mockAdBanner16.back.path,
            //   upperMiddleImage: GraphicsFoundation.instance.png.paralaxBanners.mockAdBanner16.upperMid.path,
            //   lowerMiddleImage: GraphicsFoundation.instance.png.paralaxBanners.mockAdBanner16.lowerMid.path,
            // ),
            // if (xFile != null && selectedImageBytes != null)
            //   UiKitPictureViewFinder(
            //     controller: controller,
            //     viewFinderOrientation: Axis.vertical,
            //     viewPortAvailableSize: Size(1.sw, 0.85.sh),
            //     imageBytes: selectedImageBytes!,
            //     onCropCompleted: (imageValue) => setState(() => cropedImageBytes = imageValue),
            //   ),
            // SpacingFoundation.verticalSpace24,
            // context
            //     .smallButton(
            //       data: BaseUiKitButtonData(
            //         text: 'crop',
            //         onPressed: () => controller.cropImage(),
            //       ),
            //     )
            //     .loadingWrap(controller.state == UiKitViewFinderState.cropping),
            // SpacingFoundation.verticalSpace24,
            // if (cropedImageBytes != null) Image.memory(cropedImageBytes!),
            // UiKitPictureViewFinder(
            //   imageSize: Size(0.85.sw, 0.75.sh),
            //   imagePath: GraphicsFoundation.instance.png.mockAdBanner5.path,
            // ),
            // SpacingFoundation.verticalSpace24,
          ],
        ),
      ),
    );
  }
}
