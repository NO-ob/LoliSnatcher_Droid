import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollingText extends StatefulWidget {
  const ScrollingText(
    this.text,
    this.size,
    this.mode,
    this.textColor, {
    super.key,
  });
  final String text;
  final int size;
  final String mode;
  final Color textColor;

  @override
  State<ScrollingText> createState() => _ScrollingTextState();
}

class _ScrollingTextState extends State<ScrollingText> {
  String? displayText;
  int counter = 0, pauseCounter = 0, pauseThreshold = 8, maxAllowedSize = 0;
  String bufferText = '';
  bool forward = true, disposed = false;
  static const int stepDelay = 200;
  @override
  void initState() {
    super.initState();
    counter = 0;
    pauseCounter = 0;
    maxAllowedSize = widget.size;
    bufferText = '';
    forward = true;
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if ((counter + maxAllowedSize) > widget.text.length) {
      if (counter != 0) {
        setState(initState);
      } else {
        return Text(
          widget.text,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: widget.textColor,
          ),
        );
      }
    } else {
      switch (widget.mode) {
        case 'bounce':
          bounce();
          break;
        case 'scroll':
          scroll();
          break;
        case 'infinite':
          infinite();
          break;
        case 'infiniteWithPause':
          infiniteWithPause();
          break;
      }
    }
    return Text(
      displayText!,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: widget.textColor,
      ),
    );
  }

  void bounce() {
    Future.delayed(const Duration(milliseconds: stepDelay), () {
      if (!disposed) {
        if ((counter + maxAllowedSize) >= widget.text.length) {
          setState(() {
            forward = false;
          });
        } else if (!forward && counter == 0) {
          setState(() {
            forward = true;
          });
        }
        if (forward) {
          setState(() {
            counter++;
          });
        } else {
          setState(() {
            counter--;
          });
        }
      }
    });
    displayText = widget.text.substring(counter, counter + maxAllowedSize);
  }

  void scroll() {
    Future.delayed(const Duration(milliseconds: stepDelay), () {
      if (!disposed) {
        if ((counter + maxAllowedSize) < widget.text.length) {
          setState(() {
            counter++;
          });
        } else {
          counter = 0;
        }
      }
    });
    displayText = widget.text.substring(counter, counter + maxAllowedSize);
  }

  void infinite() {
    Future.delayed(const Duration(milliseconds: stepDelay), () {
      if (!disposed) {
        if (bufferText.isEmpty) {
          if ((counter + maxAllowedSize) < widget.text.length) {
            setState(() {
              counter++;
            });
          } else {
            setState(() {
              bufferText = displayText!;
            });
          }
        } else {
          if (bufferText.length > 1) {
            setState(() {
              bufferText = bufferText.substring(1, bufferText.length);
            });
          } else {
            setState(() {
              bufferText = '';
              counter = 0;
            });
          }
        }
      }
    });
    if (bufferText.isEmpty) {
      displayText = widget.text.substring(counter, counter + maxAllowedSize);
    } else {
      displayText = '$bufferText ${widget.text.substring(0, maxAllowedSize - (bufferText.length - 1))}';
    }
  }

  Future<void> infiniteWithPause() async {
    Future.delayed(const Duration(milliseconds: stepDelay), () {
      if (!disposed) {
        if (counter == 0 && pauseCounter <= pauseThreshold) {
          setState(() {
            pauseCounter++;
          });
        } else if (bufferText.isEmpty) {
          if ((counter + maxAllowedSize) < widget.text.length) {
            setState(() {
              counter++;
            });
          } else {
            setState(() {
              bufferText = displayText!;
            });
          }
        } else {
          if (bufferText.length > 1) {
            setState(() {
              bufferText = bufferText.substring(1, bufferText.length);
            });
          } else {
            setState(() {
              bufferText = '';
              counter = 0;
              pauseCounter = 0;
            });
          }
        }
      }
    });

    if (bufferText.isEmpty) {
      displayText = widget.text.substring(counter, counter + maxAllowedSize);
    } else {
      displayText = '$bufferText ${widget.text.substring(0, maxAllowedSize - (bufferText.length - 1))}';
    }

    if (counter == 0 && pauseCounter <= pauseThreshold) {
      displayText = '${displayText!}...';
    }
  }
}
