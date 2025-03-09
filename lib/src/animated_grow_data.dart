import 'animated_grow_direction.dart';

class AnimatedGrowData {
  AnimatedGrowData({
    required this.duration,
    required this.direction,
  }) {
    isHorizontal = direction == GrowDirection.leftToRight || direction == GrowDirection.rightToLeft;
  }

  Duration duration;
  GrowDirection direction;
  late bool isHorizontal;
}