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
    super.onEnd,
    super.controller,
    required super.direction,
    super.autoStart,
    super.delay,
    super.duration,
    super.reverseDuration,
    super.curve,
    super.collapsed,
    super.fixed,
    super.from,
    required super.child,
  }) : super(isGrowIn: true);
}

class GrowOut extends AnimatedGrowBase {
  const GrowOut({
    super.key,
    super.onEnd,
    super.controller,
    required super.direction,
    super.autoStart,
    super.delay,
    super.duration,
    super.reverseDuration,
    super.curve,
    super.collapsed,
    super.fixed,
    super.from,
    required super.child,
  }) : super(isGrowIn: false);
}
