import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

import 'package:lolisnatcher/src/handlers/search_handler.dart';
import 'package:lolisnatcher/src/handlers/service_handler.dart';
import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/widgets/image/image_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/guess_extension_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/unknown_viewer_placeholder.dart';
import 'package:lolisnatcher/src/widgets/video/video_viewer.dart';
import 'package:lolisnatcher/src/widgets/video/video_viewer_placeholder.dart';

// TODO media actions, video pause/mute... global controller

class ViewerHandler extends GetxController {
  static ViewerHandler get instance => Get.find<ViewerHandler>();

  // Keys to get states of all currently built viewers
  RxList<GlobalKey?> activeKeys = RxList([]);
  // Key of the currently viewed media widget
  Rxn<GlobalKey> currentKey = Rxn(null);

  // Add media widget key
  void addViewed(Key? key) {
    if (key == null || activeKeys.contains(key)) {
      return;
    }

    if (key is GlobalKey) {
      activeKeys.add(key);
    }
  }

  // Remove media widget key
  void removeViewed(Key? key) {
    if (key == null || !activeKeys.contains(key)) {
      return;
    }

    if (key is GlobalKey) {
      activeKeys.remove(key);
    }
  }

  // Set the key of current viewed widget
  void setCurrent(Key? key) {
    if (key == null || currentKey.value == key) {
      return;
    }

    if (key is GlobalKey) {
      currentKey.value = key;
    }
    setNewState(key);
  }

  // Drop the key of viewed widget and reset the handler state
  // (used when user exits the viewerpage)
  void dropCurrent() {
    currentKey.value = null;
    resetState();
  }

  // Viewer state stuff
  RxBool inViewer = false.obs; // is in viewerpage
  RxBool displayAppbar = true.obs; // is gallery toolbar visible
  RxBool isZoomed = false.obs; // is current item zoomed in
  RxBool isLoaded = false.obs; // is current item loaded
  Rx<PhotoViewControllerValue?> viewState = Rx(null); // current view controller value
  RxBool isFullscreen = false.obs; // is in fullscreen (on mobile for videos through VideoViewer)
  RxBool isDesktopFullscreen = false.obs; // is in fullscreen mode in DesktopHome

  RxBool showNotes = true.obs;

  void resetState() {
    inViewer.value = false;
    displayAppbar.value = true;
    isZoomed.value = false;
    isLoaded.value = false;
    isFullscreen.value = false;
    isDesktopFullscreen.value = false;
    viewState.value = null;
  }

  // Get zoom state of new current item
  void setNewState(Key? key) {
    if (key == null || currentKey.value != key) {
      return;
    }

    // addPostFrameCallback waits until widget is built to avoid calling setState in it while other setState is active
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = currentKey.value?.currentState;
      switch (state?.widget.runtimeType) {
        case const (ImageViewer):
          final widgetState = state! as ImageViewerState;
          isZoomed.value = widgetState.isZoomed;
          isLoaded.value = widgetState.isLoaded;
          isFullscreen.value = false;
          viewState.value = widgetState.viewController.value;
          break;
        case const (VideoViewer):
          final widgetState = state! as VideoViewerState;
          isZoomed.value = widgetState.isZoomed;
          isLoaded.value = widgetState.isVideoInited;
          isFullscreen.value = widgetState.chewieController?.isFullScreen ?? false;
          viewState.value = widgetState.viewController.value;
          break;
        case const (VideoViewerPlaceholder):
        case const (UnknownViewerPlaceholder):
        case const (GuessExtensionViewer):
          isLoaded.value = true;
          isFullscreen.value = false;
          viewState.value = null;
          break;
        default:
          break;
      }
    });
  }

  // Set zoom state, called by the current item itself
  void setZoomed(Key? key, bool isZoom) {
    if (key == null || currentKey.value != key) {
      return;
    }

    isZoomed.value = isZoom;
  }

  // toggle item's zoom state
  void toggleZoom() {
    isZoomed.value ? resetZoom() : doubleTapZoom();
  }

  void resetZoom() {
    final dynamic state = currentKey.value?.currentState;
    state?.resetZoom?.call();
  }

  void doubleTapZoom() {
    final dynamic state = currentKey.value?.currentState;
    state?.doubleTapZoom?.call();
  }

  void setViewValue(Key? key, PhotoViewControllerValue value) {
    if (key == null || currentKey.value != key) {
      return;
    }

    viewState.value = value;
  }

  void setLoaded(Key? key, bool value) {
    if (key == null || currentKey.value != key || isLoaded.value == value) {
      return;
    }

    isLoaded.value = value;
  }

  void toggleToolbar(bool isLongTap) {
    final bool newAppbarVisibility = !displayAppbar.value;
    displayAppbar.value = newAppbarVisibility;

    if (isLongTap) {
      ServiceHandler.vibrate();
    }

    final searchHandler = SearchHandler.instance;
    final settingsHandler = SettingsHandler.instance;

    // enable volume buttons if current page is a video AND appbar is set to visible
    final bool isVideo = searchHandler.currentFetched[searchHandler.viewedIndex.value].mediaType.value.isVideo;
    final bool isVolumeAllowed = !settingsHandler.useVolumeButtonsForScroll || (isVideo && newAppbarVisibility);
    ServiceHandler.setVolumeButtons(isVolumeAllowed);
  }

  // Related to videos
  bool videoAutoMute = false; // hold volume button in VideoViewer to mute videos globally

  // ViewerHandler() {
  //   // debug: print keys list changes
  //   activeKeys.listen((keys) {
  //     print('Viewing: $keys');
  //   });

  //   currentKey.listen((key) {
  //     // debug: print current key change and what widget it represents
  //     dynamic widget = key?.currentState?.widget;
  //     print('Current: $key');
  //     print('Current url: ${widget?.booruItem?.fileURL}');
  //     print('Widget type: ${widget.runtimeType}');
  //   });
  // }
}




// TODO Stop video when audio output device changes/removed
// pubspec: audio_session: ^0.1.6+1
// import 'package:audio_session/audio_session.dart';

// late final audioSession;

// in init: audioSessionInit();

// void audioSessionInit() async {
//   audioSession = await AudioSession.instance;
//   await audioSession.configure(AudioSessionConfiguration(
//     avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
//     avAudioSessionCategoryOptions: AVAudioSessionCategoryOptions.allowBluetooth,
//     avAudioSessionMode: AVAudioSessionMode.spokenAudio,
//     avAudioSessionRouteSharingPolicy: AVAudioSessionRouteSharingPolicy.defaultPolicy,
//     avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
//     androidAudioAttributes: const AndroidAudioAttributes(
//       contentType: AndroidAudioContentType.movie,
//       flags: AndroidAudioFlags.none,
//       usage: AndroidAudioUsage.media,
//     ),
//     androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
//     androidWillPauseWhenDucked: true,
//   ));
//   await audioSession.setActive(true);

//   audioSession.becomingNoisyEventStream.listen((_) {
//       FlashElements.showSnackbar(
//       context: context,
//       title: Text(
//         "Audio disconnected!",
//         style: TextStyle(fontSize: 20)
//       ),
//       sideColor: Colors.yellow,
//       leadingIcon: Icons.audiotrack,
//     );
//   });

//   audioSession.devicesChangedEventStream.listen((event) {
//     FlashElements.showSnackbar(
//       context: context,
//       title: Text(
//         "Audio changed!",
//         style: TextStyle(fontSize: 20)
//       ),
//       content: Text(
//         'Devices A: ${event.devicesAdded} R: ${event.devicesRemoved}',
//         style: TextStyle(fontSize: 14)
//       ),
//       sideColor: Colors.yellow,
//       leadingIcon: Icons.audiotrack,
//     );
//   });
// }
