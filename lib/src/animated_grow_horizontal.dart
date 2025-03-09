import 'package:animated_grow/src/animated_grow_data.dart';
import 'package:flutter/material.dart';

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
