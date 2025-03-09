import 'package:flutter/material.dart';

import 'animated_grow_data.dart';

/// Use [AnimatedSize]
///
class AnimatedGrowHorizontal extends StatefulWidget {
  const AnimatedGrowHorizontal({
    super.key,
    required this.data,
  });

  final AnimatedGrowData data;

  @override
  State<AnimatedGrowHorizontal> createState() => _AnimatedGrowHorizontalState();
}

class _AnimatedGrowHorizontalState extends State<AnimatedGrowHorizontal> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: widget.data.duration,
    );
  }
}
