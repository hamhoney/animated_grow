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
                begin: growDirect * renderWidth + widget.data.from,
                end: 0.0,
              ).animate(
                CurvedAnimation(parent: controller, curve: widget.data.curve),
              );
            } else {
              final int growDirect =
                  widget.data.direction == GrowDirection.leftToRight ? 1 : -1;
              // GrowOut
              sizeAnimation = Tween<double>(
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
              sizeAnimation = Tween<double>(
                begin: growDirection * renderHeight + widget.data.from,
                end: 0.0,
              ).animate(
                CurvedAnimation(parent: controller, curve: widget.data.curve),
              );
            } else {
              // GrowOut
              final int growDirection =
                  widget.data.direction == GrowDirection.bottomToTop ? -1 : 1;
              sizeAnimation = Tween<double>(
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
      animationBehavior: AnimationBehavior.preserve,
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
            return ClipRect(
              clipper: widget.data.isFixed
                  ? _GrowFixedClipper(sizeFactor: sizeAnimation.value, isHorizontal: widget.data.isHorizontal)
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
                child: widget.data.isFixed
                    ? child!
                    : translatedWidget(child!),
              ),
            );
          } else {
            return ClipRect(
              // clipper: _LeftClipper(cutWidth: sizeAnimation.value),
              clipper: widget.data.isFixed
                  ? _GrowFixedClipper(sizeFactor: sizeAnimation.value, isHorizontal: widget.data.isHorizontal)
                  : null,
              // child: translatedWidget(child!)
              child: widget.data.isFixed
                  ? child!
                  : translatedWidget(child!),
            );
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

class _GrowFixedClipper extends CustomClipper<Rect> {
  _GrowFixedClipper({
    required this.sizeFactor,
    required this.isHorizontal,
  });

  final double sizeFactor;
  final bool isHorizontal;

  @override
  Rect getClip(Size size) {
    print('sizeWidth:${size.width}, sizeHeight:${size.height}, sizeFactor:$sizeFactor');
    if (isHorizontal) {
      return Rect.fromLTWH(sizeFactor, 0.0, size.width, size.height);
    } else {
      // return Rect.fromLTRB(0.0, 0.0, size.width, size.height - sizeFactor);    // bottomToTop growIn
      // return Rect.fromLTRB(0.0, 0.0, size.width, size.height + sizeFactor);    // topToBottom growIn
      return Rect.fromLTRB(0.0, sizeFactor, size.width, size.height);    // topToBottom growOut
      // return Rect.fromLTRB(0.0, 0.0, size.width, size.height+sizeFactor);    // bottomToTop groOut
    }
  }


  @override
  bool shouldReclip(covariant _GrowFixedClipper oldClipper) {
    return oldClipper.sizeFactor != sizeFactor;
  }

  // Vertical direction
  // GrowIn - BottomToTop
  Rect vGrowInBottomToTop(Size size) => Rect.fromLTRB(0.0, 0.0, size.width, size.height - sizeFactor);
  // GrowIn - TopToBottom
  Rect vGrowInTopToBottom(Size size) => Rect.fromLTRB(0.0, 0.0, size.width, size.height + sizeFactor);
  // GrowOut - BottomToTop
  Rect vGrowOutBottomToTop(Size size) => Rect.fromLTRB(0.0, 0.0, size.width, size.height + sizeFactor);
  // GrowOut - TopToBottom
  Rect vGrowOutTopToBottom(Size size) => Rect.fromLTRB(0.0, sizeFactor, size.width, size.height);
}

// class _BottomClipper extends CustomClipper<Rect> {
//   _BottomClipper({required this.cutHeight});
//
//   final double cutHeight;
//
//   @override
//   Rect getClip(Size size) {
//     // print('cutHeight:$cutHeight');
//     return Rect.fromLTRB(0.0, 0.0, size.width, size.height + cutHeight);
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
//     return true;
//   }
// }