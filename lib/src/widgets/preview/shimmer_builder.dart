import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';

class ShimmerWrap extends StatelessWidget {
  const ShimmerWrap({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      linearGradient: _shimmerGradient(
        Color.lerp(Theme.of(context).colorScheme.surface, Theme.of(context).colorScheme.onSurface, 0.15)!,
        Color.lerp(Theme.of(context).colorScheme.onSurface, Theme.of(context).colorScheme.surface, 0.75)!,
        Color.lerp(Theme.of(context).colorScheme.surface, Theme.of(context).colorScheme.onSurface, 0.15)!,
      ),
      child: child,
    );
  }
}

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerWrap(
      child: LayoutBuilder(
        builder: (BuildContext layoutContext, BoxConstraints constraints) {
          final SettingsHandler settingsHandler = SettingsHandler.instance;
          final String displayType = settingsHandler.previewDisplay;
          final bool isDesktop = settingsHandler.appMode.value.isDesktop;
          final int previewCount = settingsHandler.limit;
          final int columnCount =
              MediaQuery.orientationOf(layoutContext) == Orientation.portrait ? settingsHandler.portraitColumns : settingsHandler.landscapeColumns;

          return GridView(
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            addAutomaticKeepAlives: false,
            cacheExtent: 200,
            shrinkWrap: false,
            padding: EdgeInsets.fromLTRB(
              10,
              2 + (isDesktop ? 0 : (kToolbarHeight + MediaQuery.paddingOf(context).top)),
              10,
              80,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: columnCount, childAspectRatio: displayType == 'Square' ? 1 : 9 / 16),
            children: List.generate(
              previewCount,
              (int index) {
                return Card(
                  margin: const EdgeInsets.all(2),
                  child: GridTile(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: const ShimmerCard(),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
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
      child: child ??
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
    this.child,
    super.key,
  });

  static ShimmerState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerState>();
  }

  final LinearGradient linearGradient;
  final Widget? child;

  @override
  ShimmerState createState() => ShimmerState();
}

class ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1000));
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
    final shimmerBox = context.findRenderObject() as RenderBox?;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _shimmerChanges?.removeListener(_onShimmerChange);
    _shimmerChanges = Shimmer.of(context)?.shimmerChanges;
    _shimmerChanges?.addListener(_onShimmerChange);
  }

  @override
  void dispose() {
    _shimmerChanges?.removeListener(_onShimmerChange);
    super.dispose();
  }

  void _onShimmerChange() {
    if (widget.isLoading) {
      setState(() {
        // update the shimmer painting.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (!widget.isLoading) {
    //   return widget.child;
    // }

    // Collect ancestor shimmer info.
    final shimmer = Shimmer.of(context);
    final RenderObject? renderObj = context.findRenderObject();
    if (shimmer == null || !shimmer.isSized || renderObj == null) {
      // The ancestor Shimmer widget has not laid
      // itself out yet. Return an empty box.
      return const SizedBox.shrink();
    }
    final shimmerSize = shimmer.size;
    final gradient = shimmer.gradient;
    // TODO exception here after new page loads
    final offsetWithinShimmer = shimmer.getDescendantOffset(
      descendant: renderObj as RenderBox,
    );

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Container(
        key: ValueKey<bool>(widget.isLoading),
        child: widget.isLoading
            ? ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: (bounds) {
                  return gradient.createShader(
                    Rect.fromLTWH(
                      -offsetWithinShimmer.dx,
                      -offsetWithinShimmer.dy,
                      shimmerSize.width,
                      shimmerSize.height,
                    ),
                  );
                },
                child: widget.child,
              )
            : widget.child,
      ),
    );
  }
}
