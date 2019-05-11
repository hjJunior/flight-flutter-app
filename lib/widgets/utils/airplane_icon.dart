import 'dart:math';
import 'package:flutter/material.dart';

class AirplaneIcon extends StatelessWidget {
  AirplaneIcon({this.degress = 0, this.color=Colors.blueGrey, this.size = 18});

  final double degress;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) => Transform.rotate(
    angle: degress * pi/180,
    child: Icon(
      Icons.airplanemode_active,
      color: color,
      size: size,
    ),
  );
}
