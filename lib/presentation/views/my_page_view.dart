import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:testaventique/infrastructure/api_service_wrapper.dart';
import 'package:testaventique/utils/constants.dart';
import 'package:testaventique/utils/utils.dart';

// FIRST SOLUTION MANUAL CACHE
class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Viewer'),
      ),
      body: FutureBuilder<Uint8List?>(
        future: ApiServiceWrapper().downloadImage(AppConstants.imageUrl),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading image.'));
          } else {
            if (snapshot.data == null) {
              return const Center(child: Text('Error loading image.'));
            }
            return Center(child: Image.memory(snapshot.data!));
          }
        },
      ),
    );
  }
}

// SECOND SOLUTION USING PACKAGE
class MyPage2 extends StatelessWidget {
  const MyPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Viewer'),
      ),
      body: AppUtils.fetchAndCacheImage(AppConstants.imageUrl),
    );
  }
}
