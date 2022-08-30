import 'package:flutter/cupertino.dart';

class BoardingProgressPage {
  const BoardingProgressPage({
    required this.title,
    required this.subtitle,
    required this.content,
    this.onNext,
    this.onPrevious,
  });
  final String title;
  final String subtitle;
  final Widget content;
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;
}
