// import 'dart:developer';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:shuffle_uikit/shuffle_uikit.dart';
// // import 'package:video_player/video_player.dart';

// import 'package:media_kit/media_kit.dart'; // Provides [Player], [Media], [Playlist] etc.
// import 'package:media_kit_video/media_kit_video.dart';

// class UiKitFullScreenPortraitVideoPlayer extends StatefulWidget {
//   final String videoUrl;
//   final Uint8List? coverImageBytes;
//   final String? coverImageUrl;
//   final ValueChanged<double>? onProgressChanged;
//   final ValueChanged<DragEndDetails>? onVerticalSwipe;
//   final ValueChanged<TapUpDetails>? onTapUp;
//   final VoidCallback? onVideoComplete;
//   final VoidCallback? onVideoInited;

//   const UiKitFullScreenPortraitVideoPlayer({
//     super.key,
//     required this.videoUrl,
//     this.coverImageBytes,
//     this.onProgressChanged,
//     this.coverImageUrl,
//     this.onVerticalSwipe,
//     this.onTapUp,
//     this.onVideoComplete,
//     this.onVideoInited,
//   });

//   @override
//   State<UiKitFullScreenPortraitVideoPlayer> createState() => _UiKitFullScreenPortraitVideoPlayerState();
// }

// class _UiKitFullScreenPortraitVideoPlayerState extends State<UiKitFullScreenPortraitVideoPlayer> {
//   // VideoPlayerController? _controller;
//   bool seeking = false;
//   double height = 0;
//   double width = 0;
//   bool isReady = false;

//   // Create a [Player] to control playback.
//   late final player = Player();

//   // Create a [VideoController] to handle video output from [Player].
//   late final controller = VideoController(player);

//   @override
//   void initState() {
//     width = 1.sw;
//     height = 1.sh;
//     super.initState();
//     // WidgetsBinding.instance.addPostFrameCallback((_) {
//     //   _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
//     //     ..initialize().then((_) {
//     //       _calculateDimensions(_controller!.value.aspectRatio);
//     //       setState(() {});
//     //       _controller!.play();
//     //       _controller!.addListener(_playBackListener);
//     //       if (widget.onVideoInited != null) {
//     //         Future.delayed(Duration.zero, widget.onVideoInited!);
//     //       }
//     //     });
//     // });
//     // Play a [Media] or [Playlist].
//     player.open(Media(widget.videoUrl));
//     controller.waitUntilFirstFrameRendered.then((_) {
//       setState(() {
//         isReady = true;
//       });
//     });
//     controller.platform.future.then((value) {
//       if (widget.onVideoInited != null) {
//         Future.delayed(Duration.zero, widget.onVideoInited!);
//       }
//       value.player.stream.position.listen((Duration event) {
//         if (!seeking && controller.player.platform!.state.duration.inSeconds != 0) {
//           widget.onProgressChanged?.call(controller.player.platform!.state.position.inMilliseconds /
//               controller.player.platform!.state.duration.inMilliseconds);
//         }
//       });
//       value.player.stream.completed.listen((value) {
//         if (!seeking && value) {
//           if (widget.onVideoComplete == null) {
//             context.pop();
//           } else {
//             widget.onVideoComplete!.call();
//           }
//         }
//       });
//     });
//   }

//   _calculateDimensions(double aspectRatio) {
//     if (aspectRatio < 1) {
//       setState(() {
//         height = height - MediaQuery.of(context).padding.top;
//         width = height / aspectRatio;
//       });
//       log('video aspect ratio: $aspectRatio and device aspect ${MediaQuery.sizeOf(context).aspectRatio} so we calculate width: $width and height: $height when screenwidth is ${1.sw} and screenheight is ${1.sh}');
//     }
//   }

//   // void _playBackListener() {
//   //   if (!seeking) {
//   //     widget.onProgressChanged
//   //         ?.call(_controller!.value.position.inMilliseconds / _controller!.value.duration.inMilliseconds);
//   //   }
//   //   if (_controller?.value.position.inMilliseconds == _controller?.value.duration.inMilliseconds) {
//   //     if (!seeking) {
//   //       if (widget.onVideoComplete == null) {
//   //         context.pop();
//   //       } else {
//   //         widget.onVideoComplete!.call();
//   //       }
//   //     }
//   //   }
//   // }

//   @override
//   void dispose() {
//     // _controller?.dispose();
//     player.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: width,
//       width: height,
//       child: GestureDetector(
//         behavior: HitTestBehavior.translucent,
//         // onHorizontalDragStart: (details) {
//         //   if (controller.player.platform?.state.playing ?? true) controller.player.pause();
//         //   setState(() => seeking = true);
//         // },
//         // onHorizontalDragUpdate: (details) {
//         //   if (seeking) {
//         //     final position = controller.player.platform?.state.position.inMilliseconds ?? 0;
//         //     final duration = controller.player.platform?.state.duration.inMilliseconds ?? 0;
//         //     int seekTo = (position + details.primaryDelta! * duration ~/ 1000);
//         //     if (details.primaryDelta! > 0) {
//         //       seekTo += (seekTo ~/ 16).clamp(0, duration);
//         //     } else {
//         //       seekTo -= (seekTo ~/ 16).abs().clamp(0, duration);
//         //     }
//         //     final progress = (seekTo / duration).clamp(0.0, 1.0);
//         //     widget.onProgressChanged?.call(progress);
//         //     player.seek(Duration(milliseconds: seekTo));
//         //   }
//         // },
//         // onHorizontalDragEnd: (details) {
//         //   setState(() => seeking = false);
//         //   if (!(controller.player.platform?.state.playing ?? true)) controller.player.play();
//         // },
//         onTapDown: (details) {
//           controller.player.pause();
//         },
//         onTapUp: (details) {
//           controller.player.play();
//           widget.onTapUp?.call(details);
//         },
//         onVerticalDragEnd: widget.onVerticalSwipe,
//         child: AnimatedSwitcher(
//             duration: const Duration(milliseconds: 500),
//             switchInCurve: Curves.decelerate,
//             child: !isReady
//                 ?
//                 // Stack(
//                 //         fit: StackFit.expand,
//                 //         children: [
//                 ImageWidget(
//                     link: widget.coverImageUrl,
//                     imageBytes: widget.coverImageBytes,
//                     fit: BoxFit.cover,
//                     width: 1.sw,
//                     height: 1.sh,
//                     // ),
//                     // Container(color: Colors.black.withOpacity(0.5)),
//                     // const Center(child: LoadingWidget()),
//                     // ],
//                   )
//                 : Video(
//                     controller: controller,
//                     height: height - MediaQuery.of(context).padding.top,
//                     width: 1.sw,
//                     fit: BoxFit.cover,
//                     controls: (_) => const SizedBox.shrink(),
//                     filterQuality: FilterQuality.high,
//                   )
//             // RepaintBoundary(
//             //         child: Transform.scale(
//             //             scale: _controller!.value.aspectRatio > (MediaQuery.sizeOf(context).aspectRatio + 0.18)
//             //                 ? 1
//             //                 : (width / 1.sw - height / 1.sh),
//             //             child: AspectRatio(
//             //               aspectRatio: _controller!.value.aspectRatio,
//             //               child: VideoPlayer(_controller!),
//             //             )))
//             ),
//       ),
//     ).paddingOnly(top: MediaQuery.paddingOf(context).top);
//   }
// }

//TODO 
