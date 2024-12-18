import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppUtils {
  static CachedNetworkImage fetchAndCacheImage(String imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
