import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:share_plus/share_plus.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:lolisnatcher/src/handlers/settings_handler.dart';
import 'package:lolisnatcher/src/utils/logger.dart';
import 'package:lolisnatcher/src/utils/tools.dart';
import 'package:lolisnatcher/src/widgets/common/cancel_button.dart';
import 'package:lolisnatcher/src/widgets/common/confirm_button.dart';
import 'package:lolisnatcher/src/widgets/common/delete_button.dart';
import 'package:lolisnatcher/src/widgets/common/settings_widgets.dart';

class LoggerViewPage extends StatelessWidget {
  const LoggerViewPage({
    required this.talker,
    this.appBarTitle,
    this.theme = const TalkerScreenTheme(),
    this.itemsBuilder,
    super.key,
  });

  final Talker talker;

  final TalkerScreenTheme theme;

  final String? appBarTitle;

  final TalkerDataBuilder? itemsBuilder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: Theme.of(context).colorScheme.copyWith(
            primaryContainer: Colors.blue[800],
          ),
        ),
        child: Stack(
          children: [
            TalkerView(
              controller: Logger.viewController,
              talker: talker,
              theme: theme,
              appBarTitle: appBarTitle ?? context.loc.settings.logging.logger,
            ),
            Positioned(
              right: 16,
              bottom: 16,
              child: FloatingActionButton(
                heroTag: 'logFiles',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const LogFilesPage(),
                    ),
                  );
                },
                child: const Icon(Icons.folder_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LogFilesPage extends StatefulWidget {
  const LogFilesPage({super.key});

  @override
  State<LogFilesPage> createState() => _LogFilesPageState();
}

class _LogFilesPageState extends State<LogFilesPage> {
  final settingsHandler = SettingsHandler.instance;
  late Future<List<File>> _files = Logger.getLogFiles();

  void _refresh() {
    setState(() {
      _files = Logger.getLogFiles();
    });
  }

  Future<void> _share(BuildContext context, File file) async {
    await Logger.flushLogFile();
    if (!context.mounted) {
      return;
    }

    final bool confirmation =
        await showDialog<bool?>(
          context: context,
          builder: (_) => SettingsDialog(
            title: Text(
              context.loc.settings.logs.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.loc.settings.logs.shareLogsWarningTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  context.loc.settings.logs.shareLogsWarningMsg,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            actionButtons: const [
              CancelButton(withIcon: true),
              ConfirmButton(withIcon: true, returnData: true),
            ],
          ),
        ) ??
        false;

    if (!confirmation) {
      return;
    }

    final box = context.findRenderObject() as RenderBox?;
    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(file.path, mimeType: 'text/plain')],
        subject: file.uri.pathSegments.last,
        sharePositionOrigin: box == null ? null : box.localToGlobal(Offset.zero) & box.size,
      ),
    );
  }

  Future<void> _setLogcatCapture(bool enabled) async {
    setState(() {
      settingsHandler.captureLogcat = enabled;
    });
    await Logger.setLogcatCaptureEnabled(enabled);
    await settingsHandler.saveSettings(restate: false);
  }

  Future<void> _delete(File file) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${context.loc.delete} ${file.uri.pathSegments.last}'),
        actions: const [
          CancelButton(withIcon: true),
          DeleteButton(withIcon: true, returnData: true),
        ],
      ),
    );
    if (shouldDelete != true) {
      return;
    }
    await Logger.deleteLogFile(file);
    if (mounted) {
      _refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.settings.logging.logger),
        actions: [
          IconButton(
            onPressed: _refresh,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          if (Platform.isAndroid)
            SettingsToggle(
              value: settingsHandler.captureLogcat,
              onChanged: _setLogcatCapture,
              title: context.loc.settings.logging.captureLogcat,
              subtitle: Text(context.loc.settings.logging.captureLogcatDescription),
              leadingIcon: const Icon(Icons.android),
            ),
          Expanded(
            child: FutureBuilder<List<File>>(
              future: _files,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: SelectableText(snapshot.error.toString()));
                }
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final files = snapshot.data!;
                if (files.isEmpty) {
                  return Center(child: Text(context.loc.nothingFound));
                }
                return Material(
                  color: Colors.transparent,
                  child: ListView.separated(
                    itemCount: files.length,
                    separatorBuilder: (_, _) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final file = files[index];
                      final name = file.uri.pathSegments.last;
                      final isLatest = index == 0;
                      return FutureBuilder<FileStat>(
                        future: file.stat(),
                        builder: (context, statSnapshot) {
                          final stat = statSnapshot.data;
                          final details = stat == null
                              ? null
                              : '${DateFormat.yMMMd().add_Hm().format(stat.modified)} - ${Tools.formatBytes(stat.size, 1)}';
                          return Material(
                            color: Colors.transparent,
                            child: ListTile(
                              tileColor: isLatest
                                  ? Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.35)
                                  : null,
                              leading: Icon(
                                isLatest ? Icons.description : Icons.description_outlined,
                                color: isLatest ? Theme.of(context).colorScheme.primary : null,
                              ),
                              title: Text(name),
                              subtitle: details == null ? null : Text(details),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                    builder: (_) => LogFileViewPage(file: file),
                                  ),
                                );
                              },
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.share_outlined),
                                    onPressed: () => _share(context, file),
                                  ),
                                  IconButton(
                                    color: Theme.of(context).colorScheme.error,
                                    icon: const Icon(Icons.delete_outline),
                                    onPressed: () => _delete(file),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LogFileViewPage extends StatefulWidget {
  const LogFileViewPage({required this.file, super.key});

  final File file;

  @override
  State<LogFileViewPage> createState() => _LogFileViewPageState();
}

class _LogFileViewPageState extends State<LogFileViewPage> {
  static const _textStyle = TextStyle(fontFamily: 'monospace', fontSize: 12);

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _scrollViewportKey = GlobalKey();
  final GlobalKey _selectableTextKey = GlobalKey();
  late final Future<String> _content = Logger.readLogFile(widget.file);

  String _text = '';
  List<_LogMatch> _matches = const [];
  int _activeMatch = -1;
  int _scrollRequestId = 0;
  bool _showSearch = false;

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _share(BuildContext context) async {
    await Logger.flushLogFile();
    if (!context.mounted) {
      return;
    }
    final box = context.findRenderObject() as RenderBox?;
    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(widget.file.path, mimeType: 'text/plain')],
        subject: widget.file.uri.pathSegments.last,
        sharePositionOrigin: box == null ? null : box.localToGlobal(Offset.zero) & box.size,
      ),
    );
  }

  void _openSearch() {
    setState(() {
      _showSearch = true;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
      _searchController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: _searchController.text.length,
      );
    });
  }

  void _closeSearch() {
    _searchController.clear();
    _scrollRequestId++;
    setState(() {
      _showSearch = false;
      _matches = const [];
      _activeMatch = -1;
    });
  }

  void _search(String query) {
    final matches = query.isEmpty
        ? <_LogMatch>[]
        : RegExp(
            RegExp.escape(query),
            caseSensitive: false,
            unicode: true,
          ).allMatches(_text).map((match) => _LogMatch(match.start, match.end)).toList();

    setState(() {
      _matches = matches;
      _activeMatch = matches.isEmpty ? -1 : 0;
    });
    if (matches.isEmpty) {
      _scrollRequestId++;
    } else {
      _scrollToActiveMatch();
    }
  }

  void _moveMatch(int delta) {
    if (_matches.isEmpty) {
      return;
    }
    setState(() {
      _activeMatch = (_activeMatch + delta) % _matches.length;
      if (_activeMatch < 0) {
        _activeMatch += _matches.length;
      }
    });
    _scrollToActiveMatch();
  }

  void _scrollToActiveMatch() {
    if (_activeMatch < 0) {
      return;
    }
    final requestId = ++_scrollRequestId;
    final activeMatch = _matches[_activeMatch];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scrollController.hasClients || requestId != _scrollRequestId) {
        return;
      }
      final renderEditable = _findRenderEditable(_selectableTextKey.currentContext);
      final viewport = _scrollViewportKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderEditable == null || viewport == null) {
        return;
      }
      final boxes = renderEditable.getBoxesForSelection(
        TextSelection(
          baseOffset: activeMatch.start,
          extentOffset: activeMatch.end,
        ),
      );
      if (boxes.isEmpty) {
        return;
      }
      final globalOffset = renderEditable.localToGlobal(
        Offset(boxes.first.left, boxes.first.top),
      );
      final viewportOffset = viewport.globalToLocal(globalOffset);
      final target = (_scrollController.offset + viewportOffset.dy - _scrollController.position.viewportDimension / 3)
          .clamp(
            0.0,
            _scrollController.position.maxScrollExtent,
          );
      _scrollController.jumpTo(target);
    });
  }

  RenderEditable? _findRenderEditable(BuildContext? context) {
    if (context is! Element) {
      return null;
    }
    RenderEditable? result;
    void find(Element element) {
      if (result != null) {
        return;
      }
      final renderObject = element.renderObject;
      if (renderObject is RenderEditable) {
        result = renderObject;
        return;
      }
      element.visitChildElements(find);
    }

    context.visitChildElements(find);
    return result;
  }

  TextSpan _buildHighlightedText(ColorScheme colors) {
    if (_matches.isEmpty) {
      return TextSpan(text: _text);
    }

    final spans = <TextSpan>[];
    var offset = 0;
    for (var index = 0; index < _matches.length; index++) {
      final match = _matches[index];
      if (match.start > offset) {
        spans.add(TextSpan(text: _text.substring(offset, match.start)));
      }
      spans.add(
        TextSpan(
          text: _text.substring(match.start, match.end),
          style: TextStyle(
            color: Colors.black,
            backgroundColor: index == _activeMatch ? Colors.orange : Colors.yellow,
          ),
        ),
      );
      offset = match.end;
    }
    if (offset < _text.length) {
      spans.add(TextSpan(text: _text.substring(offset)));
    }
    return TextSpan(
      style: TextStyle(color: colors.onSurface),
      children: spans,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.keyF, control: true): _openSearch,
        const SingleActivator(LogicalKeyboardKey.keyF, meta: true): _openSearch,
        const SingleActivator(LogicalKeyboardKey.escape): _closeSearch,
        const SingleActivator(LogicalKeyboardKey.enter): () => _moveMatch(1),
        const SingleActivator(LogicalKeyboardKey.enter, shift: true): () => _moveMatch(-1),
      },
      child: Focus(
        autofocus: true,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.file.uri.pathSegments.last),
            actions: [
              IconButton(
                onPressed: _openSearch,
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () => _share(context),
                icon: const Icon(Icons.share_outlined),
              ),
            ],
          ),
          body: FutureBuilder<String>(
            future: _content,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: SelectableText(snapshot.error.toString()));
              }
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              _text = snapshot.data!;
              return Stack(
                children: [
                  Scrollbar(
                    controller: _scrollController,
                    interactive: true,
                    child: SingleChildScrollView(
                      key: _scrollViewportKey,
                      controller: _scrollController,
                      padding: const EdgeInsets.all(12),
                      child: SelectableText.rich(
                        _buildHighlightedText(Theme.of(context).colorScheme),
                        key: _selectableTextKey,
                        style: _textStyle,
                      ),
                    ),
                  ),
                  if (_showSearch)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.surfaceContainerHigh,
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width.clamp(280, 440).toDouble() - 16,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _searchController,
                                  focusNode: _searchFocusNode,
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                                    hintText: context.loc.search,
                                  ),
                                  textInputAction: TextInputAction.search,
                                  onChanged: _search,
                                  onSubmitted: (_) => _moveMatch(1),
                                ),
                              ),
                              SizedBox(
                                width: 56,
                                child: Text(
                                  _matches.isEmpty ? '0/0' : '${_activeMatch + 1}/${_matches.length}',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                              IconButton(
                                onPressed: _matches.isEmpty ? null : () => _moveMatch(-1),
                                icon: const Icon(Icons.keyboard_arrow_up),
                              ),
                              IconButton(
                                onPressed: _matches.isEmpty ? null : () => _moveMatch(1),
                                icon: const Icon(Icons.keyboard_arrow_down),
                              ),
                              IconButton(
                                onPressed: _closeSearch,
                                icon: const Icon(Icons.close),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _LogMatch {
  const _LogMatch(this.start, this.end);

  final int start;
  final int end;
}
