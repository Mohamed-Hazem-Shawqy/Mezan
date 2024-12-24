import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Indecator extends StatelessWidget {
  final Color? progressColor;
  final Color backgroundColor;
  final Widget? center;
  final double percent;
  const Indecator(
      {super.key,
      this.progressColor,
      required this.backgroundColor,
      this.center,
      required this.percent});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
        radius: 60.0,
        lineWidth: 10.0,
        percent: percent,
        center: center,
        progressColor: progressColor,
        backgroundColor: backgroundColor);
  }
}
