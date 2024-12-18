import 'dart:typed_data';

class ImageCacheManager {
  // GLOBAL VARIABLE
  static final Map<String, Uint8List> _cache = {};

  // GETTER
  static Uint8List? get(String key) => _cache[key];

  // SETTER
  static void set(String key, Uint8List bytes) {
    _cache[key] = bytes;
  }
}
