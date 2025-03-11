import 'package:flutter/material.dart';

import 'animated_grow_data.dart';
import 'animated_grow_direction.dart';

/// Use [AnimatedSize]
///
class AnimatedGrowImpl extends StatefulWidget {
  const AnimatedGrowImpl({super.key, required this.data});

  final AnimatedGrowData data;

  @override
  State<AnimatedGrowImpl> createState() => _AnimatedGrowHorizontalState();
}

class _AnimatedGrowHorizontalState extends State<AnimatedGrowImpl>
    with SingleTickerProviderStateMixin {
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
      final renderBox =
          childKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final renderSize = renderBox.size;
        final renderWidth = renderSize.width;
        final renderHeight = renderSize.height;

        setState(() {
          if (widget.data.isHorizontal) {
            // horizontal
            if (widget.data.isGrowIn) {
              final int growDirect =
                  widget.data.direction == GrowDirection.leftToRight ? -1 : 1;
              // GrowIn
              sizeAnimation = Tween<double>(
                begin: growDirect * renderWidth,
                end: 0.0,
              ).animate(
                CurvedAnimation(parent: controller, curve: widget.data.curve),
              );
            } else {
              final int growDirect =
                  widget.data.direction == GrowDirection.leftToRight ? 1 : -1;
              // GrowOut
              sizeAnimation = Tween<double>(
                begin: 0.0,
                end: growDirect * renderWidth,
              ).animate(
                CurvedAnimation(parent: controller, curve: widget.data.curve),
              );
            }
          } else {
            // vertical
            if (widget.data.isGrowIn) {
              // GrowIn
              final int growDirection =
                  widget.data.direction == GrowDirection.bottomToTop ? 1 : -1;
              sizeAnimation = Tween<double>(
                begin: growDirection * renderHeight,
                end: 0.0,
              ).animate(
                CurvedAnimation(parent: controller, curve: widget.data.curve),
              );
            } else {
              // GrowOut
              final int growDirection =
                  widget.data.direction == GrowDirection.bottomToTop ? -1 : 1;
              sizeAnimation = Tween<double>(
                begin: 0.0,
                end: growDirection * renderHeight,
              ).animate(
                CurvedAnimation(parent: controller, curve: widget.data.curve),
              );
            }
          }
        });
      }
    });

    alignment = switch (widget.data.direction) {
      GrowDirection.leftToRight => AlignmentDirectional.centerEnd,
      GrowDirection.rightToLeft => AlignmentDirectional.centerStart,
      GrowDirection.bottomToTop => AlignmentDirectional.bottomCenter,
      GrowDirection.topToBottom => AlignmentDirectional.topCenter,
      // _ => throw UnimplementedError(),
    };

    controller = AnimationController(
      vsync: this,
      duration: widget.data.duration,
      reverseDuration: widget.data.reverseDuration,
    );

    sizeAnimation = Tween<double>(
      begin: 0.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: controller, curve: widget.data.curve));

    widget.data.controller?.call(controller);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
          // isCollapsed: false, used Align widget.
          // isCollapsed: true, not used Align widget.
          if (widget.data.isCollapsed) {
            return Align(
              alignment: alignment,
              widthFactor:
                  widget.data.isHorizontal
                      ? widget.data.isGrowIn
                          ? controller.value
                          : 1.0 - controller.value
                      : null,
              heightFactor:
                  !widget.data.isHorizontal
                      ? widget.data.isGrowIn
                          ? controller.value
                          : 1.0 - controller.value
                      : null,
              child: translatedWidget(child!),
            );
          } else {
            return translatedWidget(child!);
          }
        },
        child: SizedBox(key: childKey, child: widget.data.child),
      ),
    );
  }

  // horizontal
  Offset get horizontalOffsetWidget => Offset(sizeAnimation.value, 0.0);

  // vertical
  Offset get verticalOffsetWidget => Offset(0.0, sizeAnimation.value);

  Widget translatedWidget(Widget child) {
    return Transform.translate(
      offset:
          widget.data.isHorizontal
              ? horizontalOffsetWidget
              : verticalOffsetWidget, // horizontal
      child: child,
    );
  }
}
