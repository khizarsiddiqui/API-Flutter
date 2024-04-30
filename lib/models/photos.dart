// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

import 'dart:convert';

List<Photos> photoFromJson(String str) => List<Photos>.from(json.decode(str).map((x) => Photos.fromJson(x)));

String photoToJson(List<Photos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Photos {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Photos({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  Photos.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}