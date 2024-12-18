import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:testaventique/infrastructure/api_service.dart';
import 'package:testaventique/utils/cach_manager.dart';
import 'package:testaventique/utils/constants.dart';

class ApiServiceWrapper extends ApiService {
  // SEPARATE UI FROM LOGIC
  @override
  Future<Uint8List?> downloadImage(String imageUrl) async {
    // CHECK IF THERE IS CACHED IMAGE IN LOCAL BEFORE FETCHING
    // THIS will help us to cache our downloaded photo
    // so we dont need to fetch once again next time we visit the page
    Uint8List? cachedImage = ImageCacheManager.get(imageUrl);
    if (cachedImage != null) {
      return cachedImage;
    }

    try {
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        // CACHE WHEN SUCCESS
        ImageCacheManager.set(AppConstants.imageUrl, response.bodyBytes);
        return response.bodyBytes;
      } else {
        // RETURN NULL WHEN STATUS CODE ISNT OK
        print(response.statusCode);
        return null;
      }
    } catch (e) {
      // PRINT EXCEPTION IF THERE ANY PROGRAMMING MISTAKE OR SOCKET EXCEPTION OR ANY EXCEPTION
      print(e);
      return null;
    }
  }
}
