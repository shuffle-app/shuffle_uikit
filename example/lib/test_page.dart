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
  late ui.Image _image;
  late ui.Image _depthMap;
  bool _isLoaded = false;
  late ui.FragmentProgram _program;
  late ui.ImageShader _imageShader;
  late ui.ImageShader _depthMapShader;
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

  Future<void> _loadResources() async {
    try {
      final mainImageData =
          await rootBundle.load('packages/shuffle_uikit/${GraphicsFoundation.instance.png.mockAdBanner16.path}');
      final ui.Codec mainImageCodec = await ui.instantiateImageCodec(mainImageData.buffer.asUint8List());
      final ui.FrameInfo mainImageFrameInfo = await mainImageCodec.getNextFrame();
      _image = mainImageFrameInfo.image;
      final depthMapData = await rootBundle.load(
          'packages/shuffle_uikit/${GraphicsFoundation.instance.png.paralaxBanners.mockAdBanner16.mockAdBanner16Depth.path}');
      final ui.Codec depthMapCodec = await ui.instantiateImageCodec(depthMapData.buffer.asUint8List());
      final ui.FrameInfo depthMapFrameInfo = await depthMapCodec.getNextFrame();
      _depthMap = depthMapFrameInfo.image;

      _program = await ui.FragmentProgram.fromAsset('packages/shuffle_uikit/assets/shaders/depth_map_shader.glsl');
      _imageShader = ui.ImageShader(_image, ui.TileMode.clamp, ui.TileMode.clamp, Matrix4.identity().storage);
      _depthMapShader = ui.ImageShader(_depthMap, ui.TileMode.clamp, ui.TileMode.clamp, Matrix4.identity().storage);
      setState(() {
        _isLoaded = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // final map = await createDepthDataFromDepthMap(depthMapBytes);
      // setState(() => depthData = map);
      // print('depthData: ${depthData.length}');
      _loadResources();
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
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top, width: 1.sw),
          SpacingFoundation.verticalSpace24,
          if (!_isLoaded) Center(child: CircularProgressIndicator()),
          if (_isLoaded)
            Container(
              width: 1.sw - 48,
              height: (1.sw - 48) * 1.7,
              child: AnimatedBuilder(
                animation: tiltNotifier,
                builder: (context, child) {
                  return CustomPaint(
                    size: Size(1.sw - 48, (1.sw - 48) * 1.17),
                    painter: DepthMapPainter(
                      depthMap: _depthMap,
                      image: _image,
                      program: _program,
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
    );
  }
}
