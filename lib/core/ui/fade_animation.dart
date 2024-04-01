// import 'package:flutter/material.dart';
// import 'package:simple_animations/simple_animations.dart';
//
// class FadeAnimation extends StatelessWidget {
//   final double delay;
//   final Widget child;
//   final FadeDirection fadeDirection;
//
//   const FadeAnimation({super.key, this.delay = 1, required this.child, this.fadeDirection = FadeDirection.right});
//
//   @override
//   Widget build(BuildContext context) {
//     if (delay == 0) {
//       return child;
//     }
//     final tween = MultiTween<AniProps>()
//       ..add(AniProps.opacity, Tween(begin: 0.0, end: 1.0), const Duration(milliseconds: 500))
//       ..add(AniProps.translateY, Tween(begin: -30.0, end: 0.0), const Duration(milliseconds: 500), Curves.easeOut);
//
//     return PlayAnimation<MultiTweenValues<AniProps>>(
//       delay: Duration(milliseconds: (50 * delay).round()),
//       duration: tween.duration,
//       tween: tween,
//       child: child,
//       builder: (context, child, value) => Opacity(
//         opacity: value.get(AniProps.opacity),
//         child: Transform.translate(
//             offset: Offset(
//               (fadeDirection == FadeDirection.top || fadeDirection == FadeDirection.bottom)
//                   ? 0
//                   : value.get(AniProps.translateY) * (fadeDirection == FadeDirection.left ? -1 : 1),
//               (fadeDirection == FadeDirection.left || fadeDirection == FadeDirection.right)
//                   ? 0
//                   : value.get(AniProps.translateY) * (fadeDirection == FadeDirection.top ? -1 : 1),
//             ),
//             child: child),
//       ),
//     );
//   }
// }
//
// enum FadeDirection { top, bottom, right, left }
//
// enum AniProps { opacity, translateY }
