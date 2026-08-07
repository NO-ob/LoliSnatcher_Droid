import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/preview/main_search_bar.dart';
import 'package:lolisnatcher/src/widgets/preview/waterfall_error_buttons.dart';

// Visibility follows the primary waterfall scroll direction and explicit
// MainAppBar show/hide requests.

class WaterfallBottomBar extends StatefulWidget {
  const WaterfallBottomBar({super.key});

  @override
  WaterfallBottomBarState createState() => WaterfallBottomBarState();
}

class WaterfallBottomBarState extends State<WaterfallBottomBar> with TickerProviderStateMixin {
  final SearchHandler searchHandler = SearchHandler.instance;
  final SettingsHandler settingsHandler = SettingsHandler.instance;

  late final AnimationController animationController;
  late final Animation<double> animation;

  double get animValue => animation.value;
  double get reverseAnimValue => 1 - animValue;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = animationController.drive(
      Tween<double>(
        begin: 0,
        end: 1,
      ).chain(CurveTween(curve: Curves.ease)),
    );
  }

  void show() {
    if (animationController.status != AnimationStatus.reverse) {
      animationController.reverse();
    }
  }

  void hide() {
    if (animationController.status != AnimationStatus.forward) {
      animationController.forward();
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.viewPaddingOf(context).bottom;

    final bool showSearchBar = settingsHandler.showBottomSearchbar;

    return Align(
      alignment: Alignment.bottomCenter,
      child: WaterfallBottomSlide(
        animation: animation,
        child: Padding(
          padding: EdgeInsets.only(bottom: showSearchBar ? 0 : bottomPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Loading/error controls and the optional search bar move as one unit so
              // every bottom control is completely outside the viewport when hidden.
              AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  final double buttonPadding = showSearchBar
                      ? ((MediaQuery.sizeOf(context).width * 0.07) + kMinInteractiveDimension) * reverseAnimValue
                      : 0;

                  return AnimatedPadding(
                    duration: const Duration(milliseconds: 100),
                    padding: EdgeInsets.only(
                      left: (settingsHandler.scrollGridButtonsPosition.isLeft ? buttonPadding : 0) + 10,
                      right: (settingsHandler.scrollGridButtonsPosition.isRight ? buttonPadding : 0) + 10,
                    ),
                    child: child,
                  );
                },
                child: WaterfallErrorButtons(animation: animation),
              ),
              if (showSearchBar)
                Padding(
                  padding: EdgeInsets.only(bottom: 12 + bottomPadding),
                  child: Container(
                    height: MainSearchBar.height,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: const MainSearchBarWithActions('bottom'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class WaterfallBottomSlide extends StatelessWidget {
  const WaterfallBottomSlide({
    required this.animation,
    required this.child,
    super.key,
  });

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return FractionalTranslation(
          translation: Offset(0, animation.value),
          child: child,
        );
      },
      child: child,
    );
  }
}
