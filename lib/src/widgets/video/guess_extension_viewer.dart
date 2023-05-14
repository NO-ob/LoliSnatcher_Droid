import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';
import 'package:lolisnatcher/src/utils/dio_network.dart';

class GuessExtensionViewer extends StatefulWidget {
  const GuessExtensionViewer({
    required this.item,
    required this.index,
    required this.itemKey,
    required this.onMediaTypeGuessed,
    super.key,
  });

  final BooruItem item;
  final int index;
  final Key itemKey;
  final Function(MediaType) onMediaTypeGuessed;

  @override
  State<GuessExtensionViewer> createState() => _GuessExtensionViewerState();
}

class _GuessExtensionViewerState extends State<GuessExtensionViewer> {
  late Dio client;
  CancelToken? cancelToken;
  bool failed = false;
  String currentExtension = '';

  @override
  void initState() {
    super.initState();
    client = DioNetwork.getClient();
    cancelToken = CancelToken();

    startGuessing();
  }

  @override
  void dispose() {
    cancelToken?.cancel();
    super.dispose();
  }

  Future<void> startGuessing() async {
    final videoExtensions = ['webm', 'mp4'];
    final gifExtensions = ['gif'];
    final imageExtensions = ['jpg', 'png', 'jpeg'];
    List<String> possibleExtensions = [];

    if (widget.item.possibleExt.value == 'animation') {
      possibleExtensions = [...gifExtensions, ...videoExtensions, ...imageExtensions];
    } else if (widget.item.possibleExt.value == 'video') {
      possibleExtensions = [...videoExtensions, ...imageExtensions, ...gifExtensions];
    } else {
      possibleExtensions = [...videoExtensions, ...imageExtensions, ...gifExtensions];
    }

    for (String extension in possibleExtensions) {
      try {
        currentExtension = extension;
        setState(() {});

        final res = await client.head(
          '${widget.item.fileURL.replaceAll(RegExp(r'\.\w+$'), '')}.$extension',
          cancelToken: cancelToken,
          options: Options(
            responseType: ResponseType.bytes,
          ),
        );

        if (res.statusCode == 200) {
          widget.item.fileURL = '${widget.item.fileURL.replaceAll(RegExp(r'\.\w+$'), '')}.$extension';
          widget.onMediaTypeGuessed(MediaType.fromExtension(extension));
          setState(() {});
          return;
        }

        await Future.delayed(const Duration(milliseconds: 100));
      } catch (e) {
        continue;
      }
    }
    failed = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Text(failed ? '[Could not guess the file extension]' : '[Guessing file extension...$currentExtension...?]'),
      ),
    );
  }
}
