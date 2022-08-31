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
    this.previousButtonText = 'Previous',
    this.nextButtonText = 'Next',
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

  final String previousButtonText;

  final String nextButtonText;

  @override
  State<BoardingProgress> createState() => _BoardingProgressState();
}

class _BoardingProgressState extends State<BoardingProgress> {
  int _currentStep = 0;
  final bool _canContinue = false;

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
        Row(
          children: [
            if (_currentStep > 0) ...[
              TextButton(
                onPressed: () {
                  setState(() {
                    _currentStep--;
                  });
                },
                child: Text(widget.previousButtonText),
              ),
            ],
            const Spacer(),
            if (_currentStep < widget.pages.length - 1 && _canContinue) ...[
              TextButton(
                onPressed: () async {
                  var result = false;
                  if (widget.pages[_currentStep].showConfirmation != null &&
                      widget.pages[_currentStep].showConfirmation!()) {
                    // show dialog
                    result = await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Confirm'),
                        content: const Text('Are you sure?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: const Text('No'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    result = true;
                  }
                  if (_canContinue && result) {
                    setState(() {
                      _currentStep++;
                    });
                  }
                },
                child: Text(widget.nextButtonText),
              ),
            ],
          ],
        )
      ],
    );
  }
}
