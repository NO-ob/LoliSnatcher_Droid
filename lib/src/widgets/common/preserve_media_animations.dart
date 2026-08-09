import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Keeps animated media running in viewers when Android requests reduced
/// animations.
///
/// The override is intentionally scoped to the viewer subtree so the rest of
/// the app still follows the system accessibility preference.
class PreserveMediaAnimations extends StatelessWidget {
  const PreserveMediaAnimations({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.maybeOf(context);
    if (defaultTargetPlatform != TargetPlatform.android ||
        mediaQueryData == null ||
        !mediaQueryData.disableAnimations) {
      return child;
    }

    return MediaQuery(
      data: mediaQueryData.copyWith(disableAnimations: false),
      child: child,
    );
  }
}
