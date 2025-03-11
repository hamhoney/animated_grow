import 'package:animated_grow/src/animated_grow_direction.dart';
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

class _AnimatedGrowHorizontalState extends State<AnimatedGrowHorizontal> with SingleTickerProviderStateMixin {
  late final AlignmentDirectional alignment;
  late final double axisAlignment = 0.0;

  late final AnimationController controller;
  late Animation<double> sizeAnimation;

  // double? width = 0.0;

  final childKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final renderBox = childKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final renderSize = renderBox.size;
        final renderWidth = renderSize.width;
        final renderHeight = renderSize.height;

        setState(() {
          sizeAnimation = Tween<double>(begin: renderWidth, end: 0.0).animate(
              CurvedAnimation(parent: controller, curve: widget.data.curve)
          );
        });
      }
    },);

    alignment = switch (widget.data.direction) {
      GrowDirection.leftToRight => AlignmentDirectional.centerEnd,
      GrowDirection.rightToLeft => AlignmentDirectional.centerStart,
      _ => throw UnimplementedError(),
    };

    controller = AnimationController(
      vsync: this,
      duration: widget.data.duration,
      reverseDuration: widget.data.duration,
    );

    sizeAnimation = Tween<double>(begin: 0.0, end: 0.0).animate(
      CurvedAnimation(parent: controller, curve: widget.data.curve)
    );

    widget.data.controller?.call(controller);
    sizeAnimation.addListener(animationEventListener);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: AnimatedBuilder(
        animation: sizeAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(sizeAnimation.value, 0.0),
            child: child,
          );
        },
        child: SizedBox(
          key: childKey,
          child: widget.data.child
        ),
      ),
    );
  }

  void animationEventListener() {
    print('animationEventListener... ${sizeAnimation.value}, isForwardOrCompleted:${sizeAnimation.isForwardOrCompleted}');
    // if (sizeAnimation.isForwardOrCompleted && width == null) {
    //
    // } else {
    //   setState(() {
    //     width = null;
    //   });
    // }
  }
}
