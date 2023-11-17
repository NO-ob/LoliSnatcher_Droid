import 'package:flutter/material.dart';

import 'package:lolisnatcher/src/widgets/image/custom_network_image.dart' as custom_network_image;

abstract class CustomNetworkImage extends ImageProvider<CustomNetworkImage> {
  const factory CustomNetworkImage(String url, {double scale, Map<String, String>? headers}) = custom_network_image.CustomNetworkImage;

  String get url;

  double get scale;

  Map<String, String>? get headers;

  @override
  ImageStreamCompleter loadImage(CustomNetworkImage key, ImageDecoderCallback decode);
}
