import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiKitPhotoSlider extends StatefulWidget {
  final List<String> photos;
  final double width;

  const UiKitPhotoSlider({
    Key? key,
    required this.photos,
    required this.width,
  }) : super(key: key);

  @override
  State<UiKitPhotoSlider> createState() => _UiKitPhotoSliderState();
}

class _UiKitPhotoSliderState extends State<UiKitPhotoSlider> {
  final ValueNotifier _pageController = ValueNotifier(120);
  final _animDuration = const Duration(milliseconds: 150);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 156.h,
      width: widget.width,
      child: GestureDetector(
        onPanUpdate: (details) {
          _pageController.value = details.localPosition.dx;
        },
        onPanStart: (details) {
          print('onPanStart: ${details.localPosition.dx}');
        },
        onPanEnd: (details) {
          /// end of pan where we need to finish animation
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            ValueListenableBuilder(
              valueListenable: _pageController,
              builder: (context, value, child) {
                print('value: $value');
                return AnimatedPositioned(
                  duration: _animDuration,
                  right: widget.width - value,
                  child: AnimatedContainer(
                    duration: _animDuration,
                    width: widget.width - 20,
                    height: 156.h,
                    color: Colors.white,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
