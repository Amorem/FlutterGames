import 'package:flutter/material.dart';

Widget gradientBackground(Color startColor, Color endColor) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [startColor, endColor],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 0.2],
      ),
    ),
  );
}
