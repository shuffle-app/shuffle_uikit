import 'dart:developer';

import 'package:flutter/material.dart';

class DragTargetWrapper extends StatelessWidget {
  final DragTargetAcceptWithDetails<DragTargetData>? onDragAccept;
  final Widget child;
  final int? childCardId;

  const DragTargetWrapper({super.key, this.onDragAccept, required this.child, this.childCardId});

  @override
  Widget build(BuildContext context) {
    return DragTarget<DragTargetData>(
        onAcceptWithDetails: (details) {
          log('onAcceptWithDetails: ${details.data}', name: 'UiKitDraggableCard');
          onDragAccept?.call(details);
        },
        onWillAcceptWithDetails: (details) {
          if (childCardId != null && childCardId == details.data.data) {
            return false; // Do not accept the drag, as it's the same card.'
          }
          log('onWillAcceptWithDetails: ${details.offset}', name: 'UiKitDraggableCard');
          return true;
        },
        builder: (context, candidateData, rejectedData) => child);
  }
}

class DragTargetData {
  final String key;
  final int data;

  DragTargetData({required this.key, required this.data});

  @override
  String toString() => 'DragTargetData(key: $key, data: $data)';
}
