import 'package:flutter/material.dart';
import 'package:mvp/theme/colors.dart';

class Circle extends StatelessWidget {
  Circle({this.radius = 10.0, this.child, this.color = dividerColor});

  final num radius;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    height: radius,
    width: radius,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius * 2)
    ),
    child: child,
  );
}
