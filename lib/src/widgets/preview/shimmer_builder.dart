import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/extensions.dart';

class ShimmerWrap extends StatelessWidget {
  const ShimmerWrap({
    required this.child,
    this.enabled = true,
    super.key,
  });

  final Widget child;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Shimmer(
      enabled: true,
      linearGradient: _shimmerGradient(
        Color.lerp(colorScheme.surface, colorScheme.onSurface, 0.15)!,
        Color.lerp(colorScheme.onSurface, colorScheme.surface, 0.75)!,
        Color.lerp(colorScheme.surface, colorScheme.onSurface, 0.15)!,
      ),
      child: child,
    );
  }
}

class ThumbnailsShimmerList extends StatelessWidget {
  const ThumbnailsShimmerList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SettingsHandler settingsHandler = SettingsHandler.instance;
    final String displayType = settingsHandler.previewDisplay;
    final int previewCount = settingsHandler.itemLimit;
    final int columnCount = context.isPortrait ? settingsHandler.portraitColumns : settingsHandler.landscapeColumns;

    return SliverGrid.builder(
      addAutomaticKeepAlives: false,
      itemCount: previewCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnCount,
        childAspectRatio: displayType == 'Square' ? 1 : 9 / 16,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemBuilder: (context, index) {
        return GridTile(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: const ShimmerCard(),
          ),
        );
      },
    );
  }
}

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({
    this.isLoading = true,
    this.child,
    super.key,
  });

  final bool isLoading;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      isLoading: isLoading,
      child:
          child ??
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: Theme.of(context).colorScheme.surface,
          ),
    );
  }
}

LinearGradient _shimmerGradient(Color c1, Color c2, Color c3) => LinearGradient(
  colors: [c1, c2, c3],
  stops: const [
    0.1,
    0.3,
    0.4,
  ],
  begin: const Alignment(-1, -0.3),
  end: const Alignment(1, 0.3),
  tileMode: TileMode.clamp,
);

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class Shimmer extends StatefulWidget {
  const Shimmer({
    required this.linearGradient,
    this.enabled = true,
    this.child,
    super.key,
  });

  static ShimmerState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerState>();
  }

  final LinearGradient linearGradient;
  final bool enabled;
  final Widget? child;

  @override
  ShimmerState createState() => ShimmerState();
}

class ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  int activeChildren = 0;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this);
    if (widget.enabled) {
      _shimmerController.repeat(
        min: -0.5,
        max: 1.5,
        period: const Duration(milliseconds: 1000),
      );
    }
  }

  @override
  void didUpdateWidget(Shimmer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enabled != oldWidget.enabled) {
      if (widget.enabled) {
        play();
      } else {
        stop();
      }
    }
  }

  void activateChild() {
    activeChildren++;
    play();
  }

  void play() {
    if (!_shimmerController.isAnimating) {
      _shimmerController.repeat(
        min: -0.5,
        max: 1.5,
        period: const Duration(milliseconds: 1000),
      );
    }
  }

  void stop() {
    if (activeChildren <= 0 && _shimmerController.isAnimating) {
      _shimmerController.stop();
    }
  }

  void deactivateChild() {
    if (activeChildren <= 0) {
      return;
    }

    activeChildren--;
    stop();
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  LinearGradient get gradient => LinearGradient(
    colors: widget.linearGradient.colors,
    stops: widget.linearGradient.stops,
    begin: widget.linearGradient.begin,
    end: widget.linearGradient.end,
    transform: _SlidingGradientTransform(slidePercent: _shimmerController.value),
  );

  bool get isSized {
    final RenderObject? renderObj = context.findRenderObject();
    final RenderBox? box = renderObj != null ? renderObj as RenderBox : null;
    return box?.hasSize ?? false;
  }

  Size get size {
    final RenderObject? renderObj = context.findRenderObject();
    final RenderBox? box = renderObj != null ? renderObj as RenderBox : null;
    return box?.size ?? Size.zero;
  }

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    try {
      final shimmerBox = context.findRenderObject() as RenderBox?;
      return descendant.localToGlobal(offset, ancestor: shimmerBox);
    } catch (_) {
      return Offset.zero;
    }
  }

  Listenable get shimmerChanges => _shimmerController;

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox.shrink();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0, 0);
  }
}

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({
    required this.isLoading,
    required this.child,
    super.key,
  });

  final bool isLoading;
  final Widget child;

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  Listenable? _shimmerChanges;
  final ValueNotifier<int> _shimmerUpdateIndex = ValueNotifier(0);

  ShimmerState? _shimmerState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final bool isChanged = _shimmerState != Shimmer.of(context);
    _shimmerState = Shimmer.of(context);
    _shimmerChanges?.removeListener(_onShimmerChange);
    _shimmerChanges = _shimmerState?.shimmerChanges;
    _shimmerChanges?.addListener(_onShimmerChange);
    _shimmerState?.activateChild();

    if (isChanged) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _shimmerUpdateIndex.value++;
      });
    }
  }

  @override
  void didUpdateWidget(covariant ShimmerLoading oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLoading != oldWidget.isLoading) {
      if (widget.isLoading) {
        _shimmerState?.activateChild();
      } else {
        _shimmerState?.deactivateChild();
      }
      _shimmerUpdateIndex.value++;
    }
  }

  @override
  void dispose() {
    _shimmerState?.deactivateChild();
    _shimmerChanges?.removeListener(_onShimmerChange);
    super.dispose();
  }

  void _onShimmerChange() {
    if (widget.isLoading) {
      // update the shimmer painting.
      if (_shimmerUpdateIndex.value >= 100_000) {
        _shimmerUpdateIndex.value = 0;
      } else {
        _shimmerUpdateIndex.value++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _shimmerUpdateIndex,
      builder: (context, _, child) {
        final RenderObject? renderObj = context.findRenderObject();
        if (_shimmerState == null || !_shimmerState!.isSized || renderObj == null || !renderObj.attached) {
          // The ancestor Shimmer widget has not laid
          // itself out yet. Return an empty box.
          return child ?? const SizedBox.shrink();
        }

        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            final shimmerSize = _shimmerState!.size;
            final gradient = _shimmerState!.gradient;
            final offsetWithinShimmer = _shimmerState!.getDescendantOffset(
              descendant: renderObj as RenderBox,
            );
            return gradient.createShader(
              Rect.fromLTWH(
                -offsetWithinShimmer.dx,
                -offsetWithinShimmer.dy,
                shimmerSize.width,
                shimmerSize.height,
              ),
            );
          },
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
