import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/preview/main_search_bar.dart';
import 'package:lolisnatcher/src/widgets/preview/waterfall_error_buttons.dart';

// all the scroll stuff is just experiments,

// current implementation listens to MainAppBar visibility changes
// and shows/hides bottom bar as soon as it reaches starting height/leaves screen

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // loading/error text, retry button (goes down with scroll, maybe shrinks to a small version for better fullscreen experience?)
          // + grid scroll buttons on the side (fixed vertical position, if present - change width of loading/error text)
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              final double buttonPadding = showSearchBar
                  ? ((MediaQuery.sizeOf(context).width * 0.07) + kMinInteractiveDimension) * reverseAnimValue
                  : 0;

              return Transform.translate(
                offset: Offset(
                  0,
                  showSearchBar ? (MainSearchBar.height + bottomPadding) * animValue : bottomPadding,
                ),
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 100),
                  padding: EdgeInsets.only(
                    left: (settingsHandler.scrollGridButtonsPosition.isLeft ? buttonPadding : 0) + 10,
                    right: (settingsHandler.scrollGridButtonsPosition.isRight ? buttonPadding : 0) + 10,
                  ),
                  child: child,
                ),
              );
            },
            child: WaterfallErrorButtons(
              animation: animation,
              showSearchBar: showSearchBar,
            ),
          ),
          if (showSearchBar)
            // search bar (goes out of screen with scroll)
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return AnimatedSize(
                  duration: const Duration(milliseconds: 100),
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: (12 + bottomPadding) * reverseAnimValue,
                    ),
                    child: Transform.translate(
                      offset: Offset(0, (MainSearchBar.height + bottomPadding) * 2 * animValue),
                      child: child,
                    ),
                  ),
                );
              },
              child: Container(
                height: MainSearchBar.height,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: const MainSearchBarWithActions('bottom'),
              ),
            ),
        ],
      ),
    );
  }
}
