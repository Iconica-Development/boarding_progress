import 'package:flutter/cupertino.dart';

class BoardingProgressPage {
  const BoardingProgressPage({
    required this.title,
    required this.subtitle,
    required this.content,
    this.onNext,
    this.onPrevious,
    this.showConfirmation,
  });
  final String title;
  final String subtitle;
  final Widget content;
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;
  // method to call when the onNext button should be visible
  final bool Function()? showConfirmation;
}
