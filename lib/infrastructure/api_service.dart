import 'dart:typed_data';

abstract class ApiService {
  Future<Uint8List?> downloadImage(String imageUrl);
}
