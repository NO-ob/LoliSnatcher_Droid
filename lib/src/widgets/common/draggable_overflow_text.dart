import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';

/// Text widget that renders normally when text fits and on overflow turns into combination of normal text and scrollable text
class DraggableOverflowText extends StatefulWidget {
  const DraggableOverflowText(
    this.text, {
    super.key,
    this.style,
  });

  final String text;
  final TextStyle? style;

  @override
  State<DraggableOverflowText> createState() => _DraggableOverflowTextState();
}

class _DraggableOverflowTextState extends State<DraggableOverflowText> {
  bool _isInteracting = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onInteractionEnd() {
    // If the user stops interacting and we are at the start, reset to ellipsis mode
    if (_scrollController.hasClients && _scrollController.offset <= 0) {
      setState(() {
        _isInteracting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textStyle = widget.style ?? DefaultTextStyle.of(context).style;

        final textPainter = TextPainter(
          text: TextSpan(text: widget.text, style: textStyle),
          maxLines: 1,
          textDirection: Directionality.of(context),
        )..layout(maxWidth: constraints.maxWidth);

        final bool isOverflowing = textPainter.didExceedMaxLines;
        if (!isOverflowing) {
          return Text(widget.text, style: textStyle);
        }

        return Listener(
          onPointerDown: (_) {
            if (!_isInteracting) {
              setState(() {
                _isInteracting = true;
              });
            }
          },
          onPointerUp: (_) => _onInteractionEnd(),
          onPointerCancel: (_) => _onInteractionEnd(),
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollEndNotification) {
                _onInteractionEnd();
              }
              return false;
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Opacity(
                  opacity: _isInteracting ? 1.0 : 0.0,
                  child: FadingEdgeScrollView.fromSingleChildScrollView(
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Text(
                        widget.text,
                        style: textStyle,
                        softWrap: false, // Force single line
                      ),
                    ),
                  ),
                ),
                //
                IgnorePointer(
                  ignoring: true,
                  child: Opacity(
                    opacity: _isInteracting ? 0.0 : 1.0,
                    child: Text(
                      widget.text,
                      style: textStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
