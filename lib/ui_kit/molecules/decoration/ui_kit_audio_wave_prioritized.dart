import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitAudioWavePrioritized extends StatefulWidget {
  final List<double> amplitudes;
  final Color? color;
  final double? spacing;
  final double? availableWidth;
  final bool? scrollable;

  const UiKitAudioWavePrioritized({
    super.key,
    required this.amplitudes,
    this.color,
    this.spacing,
    this.availableWidth,
    this.scrollable,
  });

  @override
  State<UiKitAudioWavePrioritized> createState() => _UiKitAudioWavePrioritizedState();
}

class _UiKitAudioWavePrioritizedState extends State<UiKitAudioWavePrioritized> {
  final height = 72.0;
  late final ScrollController scrollController;
  int _prevAmplitudesLength = 0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    _prevAmplitudesLength = widget.amplitudes.length;
  }

  @override
  void didUpdateWidget(UiKitAudioWavePrioritized oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.amplitudes.length > _prevAmplitudesLength) {
      _prevAmplitudesLength = widget.amplitudes.length;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients && scrollController.position.maxScrollExtent > 0) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: widget.availableWidth ?? 1.sw,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.black.withValues(alpha: 0.9),
              Colors.transparent,
              Colors.transparent,
              Colors.black.withValues(alpha: 0.9),
            ],
            stops: const [0.1, 0.3, 0.5, 1.0],
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstOut,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          controller: scrollController,
          itemCount: widget.amplitudes.length,
          physics: widget.scrollable == true ? const ClampingScrollPhysics() : const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => widget.spacing?.widthBox ?? SpacingFoundation.horizontalSpace8,
          itemBuilder: (context, index) {
            final amplitude = widget.amplitudes[index];
            final waveHeight = (amplitude * 1.5);

            return Center(
              child: Container(
                width: 4,
                height: waveHeight.clamp(10.0, height),
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: widget.color,
                  gradient: widget.color != null ? null : GradientFoundation.defaultLinearGradient,
                  borderRadius: BorderRadiusFoundation.max,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
