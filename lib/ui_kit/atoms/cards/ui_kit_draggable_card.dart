import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class UiKitDraggableCard extends StatefulWidget {
  final Axis dragDirection;
  final Widget child;
  final Widget feedbackChild;
  final DragTargetAcceptWithDetails<DragTargetData>? onDragAccept;
  final int cardId;
  final ScrollController? scrollController;

  const UiKitDraggableCard(
      {super.key,
      required this.dragDirection,
      required this.child,
      required this.feedbackChild,
      this.onDragAccept,
      this.scrollController,
      required this.cardId});

  @override
  State<UiKitDraggableCard> createState() => _UiKitDraggableCardState();
}

class _UiKitDraggableCardState extends State<UiKitDraggableCard> {
  Offset _offset = Offset.zero;
  double startDragPositionPixels = 0;

  @override
  Widget build(BuildContext context) {
    return DragTargetWrapper(
      childCardId: widget.cardId,
      onDragAccept: widget.onDragAccept,
      child: LongPressDraggable<DragTargetData>(
        data: DragTargetData(key: 'card', data: widget.cardId),
        axis: widget.dragDirection,
        onDragStarted: () {
          FeedbackIsolate.instance.addEvent(FeedbackIsolateHaptics(
            intensities: [130, 170],
            pattern: [10, 5],
          ));
          if (widget.scrollController != null) {
            setState(() {
              startDragPositionPixels = widget.scrollController!.position.pixels;
            });
          }
        },
        childWhenDragging: Transform.translate(
            offset: _offset,
            child: UiKitCardWrapper(
              padding: EdgeInsets.symmetric(vertical: SpacingFoundation.verticalSpacing8),
              child: widget.child,
            )),
        rootOverlay: true,
        onDragUpdate: (details) {
          setState(() {
            _offset = _offset.translate(0, details.delta.dy);
            if (_offset.dy > 0) {
              _offset = Offset(_offset.dx, 0);
            }
          });
          debugPrint('Drag update: details.delta = ${details.delta}');
          if (widget.scrollController != null) {
            final currentPosition = widget.scrollController!.position.pixels;
            debugPrint('Drag update: currentPosition = $currentPosition and _offset is $_offset');
            if (details.globalPosition.dy > 0.5.sh && _offset.dy > 0) {
              widget.scrollController?.jumpTo(currentPosition + 20);
            } else if (currentPosition > 50 && details.globalPosition.dy < 0.3.sh) {
              widget.scrollController?.jumpTo(currentPosition - 20);
            }
            final updatedPosition = widget.scrollController!.position.pixels;
            debugPrint('Drag update: updatedPosition = $updatedPosition');
            if (currentPosition != updatedPosition) {
              // setState(() {
              _offset = _offset.translate(0, (updatedPosition - currentPosition - details.delta.dy));
              // });
            }
          }
        },
        onDragEnd: (details) {
          debugPrint('Drag end: $_offset');
          setState(() {
            _offset = Offset.zero;
          });
        },
        feedback: widget.feedbackChild,
        child: widget.child,
      ),
    );
  }
}

extension DraggableCardExtension on Widget {
  Widget asDraggableCard(
          {required bool activated,
          Axis dragDirection = Axis.vertical,
          required Widget feedbackChild,
          DragTargetAcceptWithDetails<DragTargetData>? onDragEnd,
          ScrollController? scrollController,
          int cardId = 0}) =>
      activated
          ? UiKitDraggableCard(
              cardId: cardId,
              feedbackChild: feedbackChild,
              onDragAccept: onDragEnd,
              dragDirection: dragDirection,
              scrollController: scrollController,
              child: this,
            )
          : this;
}
