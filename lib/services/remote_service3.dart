// ignore_for_file: body_might_complete_normally_nullable

import 'dart:async';

import 'package:api_demo/models/comments.dart';
import 'package:http/http.dart' as http;

class RemoteService3 {
    Future<List<Comments>> getComments() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/comments');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return commentFromJson(json);
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
