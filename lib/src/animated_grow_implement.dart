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
  @Deprecated('Not used')
  late final double axisAlignment = 0.0;

  late final AnimationController controller;
  late Animation<double> growAnimation;

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
              growAnimation = Tween<double>(
                begin: growDirect * renderWidth + widget.data.from,
                end: 0.0,
              ).animate(
                CurvedAnimation(parent: controller, curve: widget.data.curve),
              );
            } else {
              final int growDirect =
                  widget.data.direction == GrowDirection.leftToRight ? 1 : -1;
              // GrowOut
              growAnimation = Tween<double>(
                begin: widget.data.from,
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
              growAnimation = Tween<double>(
                begin: growDirection * renderHeight + widget.data.from,
                end: 0.0,
              ).animate(
                CurvedAnimation(parent: controller, curve: widget.data.curve),
              );
            } else {
              // GrowOut
              final int growDirection =
                  widget.data.direction == GrowDirection.bottomToTop ? -1 : 1;
              growAnimation = Tween<double>(
                begin: widget.data.from,
                end: growDirection * renderHeight,
              ).animate(
                CurvedAnimation(parent: controller, curve: widget.data.curve),
              );
            }
          }
        });
      }

      if (widget.data.isAutoStart) {
        Future.delayed(widget.data.delay, () {
          if (controller.isDismissed) {
            controller.forward();
          }
        });
      }
    });

    alignment = switch (widget.data.direction) {
      GrowDirection.leftToRight => AlignmentDirectional.centerStart,
      GrowDirection.rightToLeft => AlignmentDirectional.centerEnd,
      GrowDirection.bottomToTop => AlignmentDirectional.bottomCenter,
      GrowDirection.topToBottom => AlignmentDirectional.topCenter,
      // _ => throw UnimplementedError(),
    };

    controller = AnimationController(
      vsync: this,
      duration: widget.data.duration,
      reverseDuration: widget.data.reverseDuration,
      animationBehavior: AnimationBehavior.preserve,
    )..addStatusListener(animationStatusListener);

    growAnimation = Tween<double>(
      begin: 0.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: controller, curve: widget.data.curve));

    widget.data.controller?.call(controller);
  }

  @override
  void dispose() {
    controller
      ..removeStatusListener(animationStatusListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: AnimatedBuilder(
        animation: growAnimation,
        builder: (context, child) {
          // isCollapsed: false, used Align widget.
          // isCollapsed: true, not used Align widget.
          if (widget.data.isCollapsed) {
            return ClipRect(
              clipper:
                  widget.data.isFixed
                      ? _GrowFixedClipper(
                        sizeFactor: growAnimation.value,
                        isHorizontal: widget.data.isHorizontal,
                      )
                      : null,
              child: Align(
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
                child: widget.data.isFixed ? child! : translatedWidget(child!),
              ),
            );
          } else {
            return ClipRect(
              // clipper: _LeftClipper(cutWidth: growAnimation.value),
              clipper:
                  widget.data.isFixed
                      ? _GrowFixedClipper(
                        sizeFactor: growAnimation.value,
                        isHorizontal: widget.data.isHorizontal,
                      )
                      : null,
              // child: translatedWidget(child!)
              child: widget.data.isFixed ? child! : translatedWidget(child!),
            );
          }
        },
        child: SizedBox(key: childKey, child: widget.data.child),
      ),
    );
  }

  void animationStatusListener(AnimationStatus status) {
    if (status.isCompleted) {
      widget.data.onEnd?.call();
    }
  }

  // horizontal
  Offset get horizontalOffsetWidget => Offset(growAnimation.value, 0.0);

  // vertical
  Offset get verticalOffsetWidget => Offset(0.0, growAnimation.value);

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

class _GrowFixedClipper extends CustomClipper<Rect> {
  _GrowFixedClipper({required this.sizeFactor, required this.isHorizontal});

  final double sizeFactor;
  final bool isHorizontal;

  @override
  Rect getClip(Size size) {
    // print('sizeWidth:${size.width}, sizeHeight:${size.height}, sizeFactor:$sizeFactor');
    if (isHorizontal) {
      return Rect.fromLTWH(sizeFactor, 0.0, size.width, size.height);
    } else {
      // return Rect.fromLTRB(0.0, 0.0, size.width, size.height - sizeFactor);    // bottomToTop growIn
      // return Rect.fromLTRB(0.0, 0.0, size.width, size.height + sizeFactor);    // topToBottom growIn
      // return Rect.fromLTRB(0.0, sizeFactor, size.width, size.height);        // topToBottom growOut
      // return Rect.fromLTRB(0.0, 0.0, size.width, size.height+sizeFactor);    // bottomToTop growOut
      return Rect.fromLTWH(0.0, sizeFactor, size.width, size.height);
    }
  }

  @override
  bool shouldReclip(covariant _GrowFixedClipper oldClipper) {
    return oldClipper.sizeFactor != sizeFactor;
  }
}
