import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A compact error widget that replaces Flutter's default ErrorWidget.
///
/// The default ErrorWidget has an intrinsic size of ~10000x10000 which breaks
/// layouts. This compact version is constrained and gracefully indicates an error.
class CompactErrorWidget extends StatelessWidget {
  const CompactErrorWidget({
    required this.details,
    super.key,
  });

  final FlutterErrorDetails details;

  static Widget builder(FlutterErrorDetails details) {
    return CompactErrorWidget(details: details);
  }

  String _getErrorText() {
    final buffer = StringBuffer();
    buffer.writeln('Exception: ${details.exceptionAsString()}');
    if (details.stack != null) {
      buffer.writeln('\nStack trace:');
      buffer.writeln(details.stack.toString());
    }
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    Color errorColor;
    Color onErrorColor;
    try {
      errorColor = Theme.of(context).colorScheme.error;
      onErrorColor = Theme.of(context).colorScheme.onError;
    } catch (_) {
      errorColor = Colors.red;
      onErrorColor = Colors.white;
    }

    final Widget content = Container(
      constraints: const BoxConstraints(maxWidth: 200, maxHeight: 100),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: errorColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: errorColor.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                color: errorColor,
                size: 16,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  'WIDGET ERROR',
                  style: TextStyle(
                    color: errorColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 24,
            child: TextButton.icon(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: _getErrorText()));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Error copied to clipboard'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              icon: Icon(Icons.copy, size: 12, color: onErrorColor),
              label: Text(
                'Copy details',
                style: TextStyle(fontSize: 10, color: onErrorColor),
              ),
              style: TextButton.styleFrom(
                backgroundColor: errorColor,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ),
        ],
      ),
    );

    if (kDebugMode) {
      return Tooltip(
        message: details.exceptionAsString().length > 200
            ? '${details.exceptionAsString().substring(0, 200)}...'
            : details.exceptionAsString(),
        child: content,
      );
    }

    return content;
  }
}
