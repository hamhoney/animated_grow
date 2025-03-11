import 'animated_grow_base.dart';

/// HAMHONEY MADE
/// Sunday, March 9. 2025
///
/// AnimatedGrow' Recipe
/// [onEnd]
/// [AnimationController]
/// [duration]
/// [reverseDuration]
/// [manualTrigger]
/// [child]
class GrowIn extends AnimatedGrowBase {
  const GrowIn({
    super.key,
    super.controller,
    super.curve,
    super.duration,
    super.reverseDuration,
    required super.direction,
    super.collapsed,
    required super.child,
  }) : super(isGrowIn: true);
}

class GrowOut extends AnimatedGrowBase {
  const GrowOut({
    super.key,
    super.controller,
    super.curve,
    super.duration,
    super.reverseDuration,
    required super.direction,
    super.collapsed,
    required super.child,
  }) : super(isGrowIn: false);
}
