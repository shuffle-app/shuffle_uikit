import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      controller.addListener(() {
        setState(() {});
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top, width: 1.sw),
            // UiKitParalaxPhotoCard(
            //   frontImage: GraphicsFoundation.instance.png.mockParalaxFrontImage.path,
            //   backImage: GraphicsFoundation.instance.png.mockParalaxBackImage.path,
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
