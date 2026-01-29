import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

export 'package:lolisnatcher/src/widgets/common/kaomoji_data.dart';

import 'package:lolisnatcher/src/widgets/common/kaomoji_data.dart';

// TODO move to package?

/// Animation types for kaomoji display.
///
/// - [none]: No animation, static text
/// - [wave]: Characters move up and down in a wave pattern
/// - [rainbow]: Animated rainbow gradient flows across text
/// - [waveRainbow]: Combined wave movement and rainbow colors
enum KaomojiAnimation {
  /// No animation, static text.
  none,

  /// Characters move up and down in a wave pattern.
  wave,

  /// Animated rainbow gradient flows across text.
  rainbow,

  /// Combined wave movement and rainbow colors.
  waveRainbow,
}

/// A widget that displays a kaomoji (Japanese emoticon) with optional animations.
///
/// Kaomojis can be selected in several ways:
/// - By [category] for random selection from a themed group
/// - By [category] and [index] for a specific kaomoji
/// - By direct [kaomoji] string
///
/// ## Animation Options
///
/// Use [animation] to add visual effects:
/// - [KaomojiAnimation.wave]: Characters bounce up and down
/// - [KaomojiAnimation.rainbow]: Flowing rainbow gradient
/// - [KaomojiAnimation.waveRainbow]: Both effects combined
///
/// ## Animation Duration
///
/// By default, animations run forever. Use [animationDuration] to make
/// the animation stop after a duration and fade to static text.
///
/// ## Auto Re-randomization
///
/// When using category-based selection, set [reRandomizeInterval] to
/// automatically pick a new random kaomoji at regular intervals.
///
/// ## Example Usage
///
/// ```dart
/// // Random joy kaomoji with wave animation
/// Kaomoji(
///   category: KaomojiCategory.joy,
///   animation: KaomojiAnimation.wave,
/// )
///
/// // Specific cat kaomoji with rainbow, stops after 3 seconds
/// Kaomoji(
///   category: KaomojiCategory.cat,
///   index: 0, // (=^･ω･^=)
///   animation: KaomojiAnimation.rainbow,
///   animationDuration: Duration(seconds: 3),
/// )
///
/// // Random love kaomoji that changes every 5 seconds
/// Kaomoji(
///   category: KaomojiCategory.love,
///   reRandomizeInterval: Duration(seconds: 5),
/// )
/// ```
class Kaomoji extends StatefulWidget {
  /// Creates a kaomoji widget.
  ///
  /// At least one of [category] or [kaomoji] must be provided.
  const Kaomoji({
    this.category,
    this.index,
    this.kaomoji,
    this.style,
    this.richText = false,
    this.animation = KaomojiAnimation.none,
    this.animationSpeed = const Duration(milliseconds: 150),
    this.animationDuration,
    this.reRandomizeInterval,
    super.key,
  }) : assert(
         category != null || kaomoji != null,
         'Either category, or kaomoji must be provided',
       );

  /// Category for random or indexed selection.
  ///
  /// If [index] is null, a random kaomoji from this category is selected.
  /// See [KaomojiCategory] for available categories with examples.
  final KaomojiCategory? category;

  /// Specific index within [category].
  ///
  /// If null and [category] is set, a random kaomoji is selected.
  /// Index wraps around if it exceeds the category size.
  final int? index;

  /// Direct kaomoji string to display.
  ///
  /// Takes precedence over [category].
  final String? kaomoji;

  /// Text style for the kaomoji.
  ///
  /// The font family is always overridden to Noto Sans for consistent rendering.
  final TextStyle? style;

  /// Whether to use RichText instead of Text widget.
  final bool richText;

  /// Animation type to apply.
  ///
  /// See [KaomojiAnimation] for available animations.
  final KaomojiAnimation animation;

  /// Speed of the animation per character.
  ///
  /// Lower values = faster animation.
  /// Default is 150ms.
  final Duration animationSpeed;

  /// Duration after which animation stops and fades to static text.
  ///
  /// If null, animation runs forever.
  /// The transition from animated to static uses a fade effect.
  final Duration? animationDuration;

  /// Interval for automatic re-randomization.
  ///
  /// Only works when [category] is set and [index] is null.
  /// If null, the kaomoji doesn't change automatically.
  final Duration? reRandomizeInterval;

  @override
  State<Kaomoji> createState() => _KaomojiState();
}

class _KaomojiState extends State<Kaomoji> with SingleTickerProviderStateMixin {
  late String _kaomoji;
  Timer? _reRandomizeTimer;
  Timer? _animationStopTimer;
  bool _animationActive = true;
  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: 1,
    );

    _resolveKaomoji();
    _setupTimers();
  }

  @override
  void didUpdateWidget(Kaomoji oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.category != oldWidget.category ||
        widget.index != oldWidget.index ||
        widget.kaomoji != oldWidget.kaomoji) {
      _resolveKaomoji();
    }
    if (widget.reRandomizeInterval != oldWidget.reRandomizeInterval ||
        widget.animationDuration != oldWidget.animationDuration) {
      _setupTimers();
    }
  }

  @override
  void dispose() {
    _reRandomizeTimer?.cancel();
    _animationStopTimer?.cancel();
    _fadeController.dispose();
    super.dispose();
  }

  void _setupTimers() {
    // Cancel existing timers
    _reRandomizeTimer?.cancel();
    _animationStopTimer?.cancel();

    // Reset animation state
    _animationActive = widget.animation != KaomojiAnimation.none;
    _fadeController.value = 1.0;

    // Setup re-randomize timer
    if (widget.reRandomizeInterval != null && widget.category != null && widget.index == null) {
      _reRandomizeTimer = Timer.periodic(widget.reRandomizeInterval!, (_) {
        if (mounted) {
          setState(_resolveKaomoji);
        }
      });
    }

    // Setup animation stop timer
    if (widget.animationDuration != null && widget.animation != KaomojiAnimation.none) {
      _animationStopTimer = Timer(widget.animationDuration!, () {
        if (mounted) {
          _fadeController.reverse().then((_) {
            if (mounted) {
              setState(() {
                _animationActive = false;
              });
            }
          });
        }
      });
    }
  }

  void _resolveKaomoji() {
    if (widget.kaomoji != null) {
      _kaomoji = widget.kaomoji!;
    } else if (widget.category != null) {
      if (widget.index != null) {
        _kaomoji = KaomojiData.get(widget.category!, widget.index!);
      } else {
        _kaomoji = KaomojiData.random(widget.category!);
      }
    } else {
      _kaomoji = KaomojiData.randomAny();
    }
  }

  @override
  Widget build(BuildContext context) {
    final usedStyle = (widget.style ?? Theme.of(context).textTheme.bodyLarge)?.copyWith(
      fontFamily: GoogleFonts.notoSans().fontFamily,
    );

    final text = ' $_kaomoji ';

    Widget content;

    if (!_animationActive || widget.animation == KaomojiAnimation.none) {
      // Static text
      if (widget.richText) {
        content = RichText(
          text: TextSpan(
            style: usedStyle,
            children: [TextSpan(text: text)],
          ),
        );
      } else {
        content = Text(text, style: usedStyle);
      }
    } else {
      // Animated text with fade transition
      content = FadeTransition(
        opacity: _fadeController,
        child: _AnimatedKaomojiText(
          text: text,
          style: usedStyle,
          animation: widget.animation,
          animationSpeed: widget.animationSpeed,
        ),
      );
    }

    return GestureDetector(
      onLongPress: () => setState(_resolveKaomoji),
      onDoubleTap: () => setState(_resolveKaomoji),
      child: content,
    );
  }
}

/// Internal animated kaomoji text widget with wave and rainbow effects.
class _AnimatedKaomojiText extends StatefulWidget {
  const _AnimatedKaomojiText({
    required this.text,
    required this.style,
    required this.animation,
    required this.animationSpeed,
  });

  final String text;
  final TextStyle? style;
  final KaomojiAnimation animation;
  final Duration animationSpeed;

  @override
  State<_AnimatedKaomojiText> createState() => _AnimatedKaomojiTextState();
}

class _AnimatedKaomojiTextState extends State<_AnimatedKaomojiText> with TickerProviderStateMixin {
  late AnimationController _waveController;
  late AnimationController _rainbowController;

  static const List<Color> _rainbowColors = [
    Color(0xFFFF0000), // Red
    Color(0xFFFF7F00), // Orange
    Color(0xFFFFFF00), // Yellow
    Color(0xFF00FF00), // Green
    Color(0xFF0000FF), // Blue
    Color(0xFF4B0082), // Indigo
    Color(0xFF9400D3), // Violet
    Color(0xFFFF0000), // Red (wrap for seamless loop)
  ];

  @override
  void initState() {
    super.initState();

    _waveController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationSpeed.inMilliseconds * widget.text.length),
    );

    _rainbowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _startAnimations();
  }

  void _startAnimations() {
    if (widget.animation == KaomojiAnimation.wave || widget.animation == KaomojiAnimation.waveRainbow) {
      _waveController.repeat();
    }

    if (widget.animation == KaomojiAnimation.rainbow || widget.animation == KaomojiAnimation.waveRainbow) {
      _rainbowController.repeat();
    }
  }

  @override
  void didUpdateWidget(_AnimatedKaomojiText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animation != oldWidget.animation) {
      _waveController.stop();
      _rainbowController.stop();
      _startAnimations();
    }
  }

  @override
  void dispose() {
    _waveController.dispose();
    _rainbowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasWave = widget.animation == KaomojiAnimation.wave || widget.animation == KaomojiAnimation.waveRainbow;
    final hasRainbow = widget.animation == KaomojiAnimation.rainbow || widget.animation == KaomojiAnimation.waveRainbow;

    Widget content = AnimatedBuilder(
      animation: hasWave ? _waveController : _rainbowController,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.text.length, (index) {
            double offset = 0;
            if (hasWave) {
              final phase = (_waveController.value * 2 * pi) - (index * 0.5);
              offset = sin(phase) * 3;
            }

            return Transform.translate(
              offset: Offset(0, offset),
              child: Text(
                widget.text[index],
                style: widget.style,
              ),
            );
          }),
        );
      },
    );

    if (hasRainbow) {
      content = AnimatedBuilder(
        animation: _rainbowController,
        builder: (context, child) {
          // The gradient width determines one full color cycle
          // Offset slides by exactly one cycle width for seamless looping
          const double cycleWidth = 250;
          final offset = _rainbowController.value * cycleWidth;
          return ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: _rainbowColors,
                tileMode: TileMode.repeated,
              ).createShader(
                // Shader rect: starts at -offset and spans multiple cycles
                Rect.fromLTWH(-offset, 0, cycleWidth, bounds.height),
              );
            },
            blendMode: BlendMode.srcIn,
            child: child,
          );
        },
        child: content,
      );
    }

    return content;
  }
}
