import 'package:flutter/material.dart';

class AnimationUtil  {
  /*static AnimationUtil? _instance;

  // private
  AnimationUtil._();

  factory AnimationUtil.getInstance() {
    _instance ??= AnimationUtil._();
    return _instance!;
  }*/

  static PageRouteBuilder SlideRightRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
        position: Tween<Offset> (
          begin: const Offset(-1, 0),
          end: Offset.zero
        ).animate(animation),
        child: child,
      )
    );
  }

  // Fade In/Out Animation
  static PageRouteBuilder FadeRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (
        BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
      ) =>
          page,
      transitionsBuilder: (
        BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
      ) => Align(
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      )
    );
  }

  //
}