import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/tutorial.dart';
import '../domain/tutorial_repository.dart';
import '../model/tutorial_runner.dart';
import 'tutorial_handler.dart';

class TutorialStartButton extends StatefulWidget {
  final Widget Function(VoidCallback onPressed) buttonBuilder;
  final Tutorial tutorial;

  const TutorialStartButton({
    super.key,
    required this.buttonBuilder,
    required this.tutorial,
  });

  @override
  State<TutorialStartButton> createState() => _TutorialStartButtonState();
}

class _TutorialStartButtonState extends State<TutorialStartButton> {
  @override
  Widget build(BuildContext context) {
    return widget.buttonBuilder(_startTutorial);
  }

  void _startTutorial() {
    TutorialRepository tutorialRepository = context.read<TutorialRepository>();
    TutorialRunner tutorialRunner = TutorialRunner(widget.tutorial, tutorialRepository);
    TutorialHandler tutorialHandler = TutorialHandler(tutorialRunner, tutorialRepository);
    tutorialHandler.startTutorial();
  }
}
