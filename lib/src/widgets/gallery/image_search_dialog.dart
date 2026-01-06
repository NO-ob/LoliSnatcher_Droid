import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher_string.dart';

import 'package:lolisnatcher/src/data/booru_item.dart';

// TODO change to bottom sheet
// TODO add more engines? ability to add custom ones?

class ImageSearchEngine {
  const ImageSearchEngine({
    required this.name,
    required this.favicon,
    required this.url,
  });

  final String name;
  final String favicon;
  final String url;
}

const List<ImageSearchEngine> imageSearchEngines = [
  ImageSearchEngine(
    name: 'Google Lens',
    favicon: 'https://www.google.com/s2/favicons?domain=lens.google.com',
    url: 'https://lens.google.com/uploadbyurl?url=<image_url>',
  ),
  ImageSearchEngine(
    name: 'Google',
    favicon: 'https://www.google.com/s2/favicons?domain=www.google.com',
    url: 'https://www.google.com/searchbyimage?client=app&image_url=<image_url>',
  ),
  ImageSearchEngine(
    name: 'Yandex',
    favicon: 'https://yandex.com/favicon.ico',
    url: 'https://yandex.com/images/search?rpt=imageview&url=<image_url>',
  ),
  ImageSearchEngine(
    name: 'SauceNAO',
    favicon: 'https://saucenao.com/favicon.ico',
    url: 'https://saucenao.com/search.php?db=999&url=<image_url>',
  ),
  ImageSearchEngine(
    name: 'ImgOps',
    favicon: 'https://imgops.com/favicon.ico',
    url: 'https://imgops.com/<image_url>',
  ),
];

Future<void> showImageSearchDialog(
  BuildContext context,
  BooruItem item,
) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Image search'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: imageSearchEngines
                .map(
                  (e) => ListTile(
                    title: Text(e.name),
                    leading: SizedBox.square(
                      dimension: 24,
                      child: Image.network(
                        e.favicon,
                        fit: BoxFit.cover,
                      ),
                    ),
                    onTap: () {
                      launchUrlString(
                        e.url.replaceAll('<image_url>', item.fileURL),
                        mode: LaunchMode.externalApplication,
                      );
                      Navigator.of(context).pop();
                    },
                  ),
                )
                .toList(),
          ),
        ),
      );
    },
  );
}
