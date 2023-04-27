import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitPhotoSlider extends StatefulWidget {
  final List<UiKitMedia> media;
  final double width;
  final double height;

  const UiKitPhotoSlider({
    Key? key,
    required this.media,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  State<UiKitPhotoSlider> createState() => _UiKitPhotoSliderState();
}

class _UiKitPhotoSliderState extends State<UiKitPhotoSlider> {
  final ValueNotifier _slideController = ValueNotifier(0);
  // final PageController _pageController = PageController(initialPage: 0);
  final _animDuration = const Duration(milliseconds: 150);

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: GestureDetector(
        onPanUpdate: (details) {
          _slideController.value = details.delta.dx;
        },
        onPanStart: (details) {
          print('onPanStart: ${details.localPosition.dx}');
        },
        onPanEnd: (details) {
          print('onPanEnd: ${details.velocity}');
          //end of pan where we need to finish animation
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              right: 0.w,
              top: 20.h,
              child: Opacity(
                opacity: 0.5,
                child: SliderPhotoCard(
                  givenSize: Size(widget.width, widget.height - 40.h),
                  media: widget.media[0],
                ),
              ),
            ),
            Positioned(
              right: 10.w,
              top: 10.h,
              child: Opacity(
                opacity: 0.75,
                child: SliderPhotoCard(
                  givenSize: Size(widget.width - 10.w, widget.height - 20.h),
                  media: widget.media[1],
                ),
              ),
            ),
            Positioned(
              right: 20.w,
              top: 0.h,
              child: Opacity(
                opacity: 1,
                child: SliderPhotoCard(
                  givenSize: Size(widget.width - 20.w, widget.height),
                  media: widget.media[2],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliderPhotoCard extends StatelessWidget {
  final UiKitMedia media;
  final Size givenSize;

  const SliderPhotoCard({
    Key? key,
    required this.media,
    required this.givenSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: givenSize,
      child: media.type == UiKitMediaType.image ? MediaWidget.image(media: media) : MediaWidget.video(media: media),
    );
  }
}
