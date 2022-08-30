import 'package:boarding_progress/src/models/boarding_progress_page.dart';
import 'package:boarding_progress/src/models/boarding_progress_theme.dart';
import 'package:flutter/material.dart';
import 'package:stepper/stepper.dart';

class BoardingProgress extends StatefulWidget {
  /// BoardingProgress is a widget that displays a vertical list of steps.
  /// Each step is represented by a [BoardingProgressPage] widget.
  const BoardingProgress({
    required this.header,
    required this.pages,
    this.paddingLeft = 10,
    this.paddingRight = 20,
    this.pageHeight = 400,
    this.initialPage = 0,
    this.theme = const BoardingProgressTheme(),
    Key? key,
  }) : super(key: key);

  /// List of pages to display in the boarding progress.
  final List<BoardingProgressPage> pages;

  final Widget header;

  final int initialPage;

  /// The padding between the start and the line of the stepper.
  final double paddingLeft;

  /// The padding between the line and the step indicator.
  final double paddingRight;

  /// The height of the page.
  final double pageHeight;

  /// The theme of the [BoardingProgress] widget.
  /// The theme for the underlying [MultiStepperView] is included.
  final BoardingProgressTheme theme;

  @override
  State<BoardingProgress> createState() => _BoardingProgressState();
}

class _BoardingProgressState extends State<BoardingProgress> {
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    _currentStep = widget.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.header,
        MultiStepperView(
          currentStep: _currentStep,
          showAllSteps: false,
          zeroIndexed: false,
          paddingLeft: widget.paddingLeft,
          paddingRight: widget.paddingRight,
          pageHeight: widget.pageHeight,
          theme: widget.theme.stepperTheme,
          steps: [
            for (var page in widget.pages) ...[
              MultiViewStep(
                title: page.title,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      page.title,
                      style: widget.theme.titleStyle ??
                          Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      page.subtitle,
                      style: widget.theme.subtitleStyle ??
                          Theme.of(context).textTheme.bodyText2,
                    ),
                    page.content,
                  ],
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
