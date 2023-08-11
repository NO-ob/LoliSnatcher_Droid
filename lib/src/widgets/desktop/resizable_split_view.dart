import 'package:flutter/material.dart';

enum SplitDirection {
  horizontal,
  vertical,
}

class ResizableSplitView extends StatefulWidget {
  const ResizableSplitView({
    required this.firstChild,
    required this.secondChild,
    this.startRatio = 0.5,
    this.minRatio = 0.2,
    this.maxRatio = 1,
    this.direction = SplitDirection.horizontal,
    this.onRatioChange,
    super.key,
  })  : assert(startRatio >= 0 && startRatio <= 1, 'startRatio must be between 0 and 1'),
        assert(minRatio >= 0 && minRatio <= 1, 'minRatio must be between 0 and 1');

  final Widget firstChild;
  final Widget secondChild;
  final double startRatio;
  final double minRatio;
  final double maxRatio;
  final SplitDirection direction;
  final void Function(double)? onRatioChange;

  @override
  State<ResizableSplitView> createState() => _ResizableSplitViewState();
}

class _ResizableSplitViewState extends State<ResizableSplitView> {
  final _dividerWidth = 16.0;

  late double _ratio;
  double? _maxSize;

  double get _size1 => _ratio * _maxSize!;

  double get _size2 => (1 - _ratio) * _maxSize!;

  @override
  void initState() {
    super.initState();
    _ratio = widget.startRatio;
  }

  Widget directionWidget({List<Widget> children = const []}) {
    if (widget.direction == SplitDirection.horizontal) {
      return Row(
        children: children,
      );
    } else {
      return Column(
        children: children,
      );
    }
  }

  void updateRatio(DragUpdateDetails details) {
    if (widget.direction == SplitDirection.horizontal) {
      _ratio += details.delta.dx / _maxSize!;
    } else {
      _ratio += details.delta.dy / _maxSize!;
    }

    if (_ratio > widget.maxRatio) {
      _ratio = widget.maxRatio;
    } else if (_ratio < widget.minRatio) {
      _ratio = widget.minRatio;
    }

    widget.onRatioChange?.call(_ratio);

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, BoxConstraints constraints) {
        assert(_ratio <= 1 && _ratio >= 0, 'ratio must be between 0 and 1');
        final double directionSize = widget.direction == SplitDirection.horizontal ? constraints.maxWidth : constraints.maxHeight;
        _maxSize ??= directionSize - _dividerWidth;
        if (_maxSize != directionSize) {
          _maxSize = directionSize - _dividerWidth;
        }

        return SizedBox(
          width: widget.direction == SplitDirection.horizontal ? constraints.maxWidth : null,
          height: widget.direction == SplitDirection.horizontal ? null : constraints.maxHeight,
          child: directionWidget(
            children: <Widget>[
              SizedBox(
                width: widget.direction == SplitDirection.horizontal ? _size1 : null,
                height: widget.direction == SplitDirection.horizontal ? null : _size1,
                child: widget.firstChild,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.grab,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onPanUpdate: updateRatio,
                  child: SizedBox(
                    width: widget.direction == SplitDirection.horizontal ? _dividerWidth : constraints.maxWidth,
                    height: widget.direction == SplitDirection.horizontal ? constraints.maxHeight : _dividerWidth,
                    child: RotationTransition(
                      turns: widget.direction == SplitDirection.horizontal ? const AlwaysStoppedAnimation(0.25) : const AlwaysStoppedAnimation(0.50),
                      child: const Icon(Icons.drag_handle),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: widget.direction == SplitDirection.horizontal ? _size2 : null,
                height: widget.direction == SplitDirection.horizontal ? null : _size2,
                child: widget.secondChild,
              ),
            ],
          ),
        );
      },
    );
  }
}
