import 'package:flutter/material.dart';
import 'package:stepper/stepper.dart';

class BoardingProgressTheme {
  const BoardingProgressTheme({
    this.titleStyle,
    this.subtitleStyle,
    this.stepperTheme = const StepperTheme(),
  });

  final StepperTheme stepperTheme;

  final TextStyle? titleStyle;

  final TextStyle? subtitleStyle;
}
