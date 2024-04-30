// ignore_for_file: body_might_complete_normally_nullable

import 'dart:async';

import 'package:api_demo/models/photos.dart';
import 'package:http/http.dart' as http;

class RemoteService2 {
    Future<List<Photos>> getPhotos() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return photoFromJson(json);
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
