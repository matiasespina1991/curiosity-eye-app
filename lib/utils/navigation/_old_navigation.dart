// // lib/utils/navigation/_old_navigation.dart
//
// import 'package:flutter/material.dart';
//
// enum SlideDirection { left, top, right, bottom }
//
// enum NavigationType { push, replacement }
//
// Route pushRouteWithAnimation(Widget page, {required SlideDirection direction}) {
//   Offset getBeginOffset() {
//     switch (direction) {
//       case SlideDirection.left:
//         return const Offset(-1.0, 0.0);
//       case SlideDirection.top:
//         return const Offset(0.0, -1.0);
//       case SlideDirection.right:
//         return const Offset(1.0, 0.0);
//       case SlideDirection.bottom:
//         return const Offset(0.0, 1.0);
//     }
//   }
//
//   return PageRouteBuilder(
//     transitionDuration: const Duration(milliseconds: 800),
//     pageBuilder: (context, animation, secondaryAnimation) => page,
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       var begin = getBeginOffset();
//       const end = Offset.zero;
//       const curve = Curves.easeInOutCubic;
//
//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//       var offsetAnimation = animation.drive(tween);
//
//       return SlideTransition(
//         position: offsetAnimation,
//         child: child,
//       );
//     },
//   );
// }
