import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/common/transparent_pointer.dart';

class ViewerTutorial extends StatefulWidget {
  const ViewerTutorial({super.key});

  @override
  State<ViewerTutorial> createState() => _ViewerTutorialState();
}

class _ViewerTutorialState extends State<ViewerTutorial> {
  bool _isVisible = false;
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    _isVisible = false;
  }

  Widget getTutorialPage(BoxConstraints constraints) {
    return _currentStep == 1
        ? ImageTutorial(constraints, () {
            setState(() {
              _currentStep++;
            });
          })
        : VideoTutorial(constraints, () {
            setState(() {
              _currentStep++;
            });
            tutorialDone();
          });
  }

  void tutorialDone() {
    if (_currentStep == 2) {
      // TODO save tutorial state
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return TransparentPointer(
          child: Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            color: Colors.black.withValues(alpha: 0.66),
            child: getTutorialPage(constraints),
          ),
        );
      },
    );
  }
}

class ImageTutorial extends StatelessWidget {
  const ImageTutorial(this.constraints, this.onNext, {super.key});
  final BoxConstraints constraints;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.image_outlined, size: 28),
                const SizedBox(width: 8),
                Text(context.loc.viewer.tutorial.images, style: const TextStyle(color: Colors.white, fontSize: 28)),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Text(
            context.loc.viewer.tutorial.tapLongTapToggleImmersive,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            context.loc.viewer.tutorial.doubleTapFitScreen,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class VideoTutorial extends StatelessWidget {
  const VideoTutorial(this.constraints, this.onNext, {super.key});
  final BoxConstraints constraints;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: constraints.maxWidth / 3,
          decoration: const BoxDecoration(
            border: Border.fromBorderSide(
              BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
          ),
        ),
        Container(
          width: constraints.maxWidth / 3,
          decoration: const BoxDecoration(
            border: Border.fromBorderSide(
              BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
          ),
        ),
        Container(
          width: constraints.maxWidth / 3,
          decoration: const BoxDecoration(
            border: Border.fromBorderSide(
              BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
