// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

import 'dart:convert';

List<Comments> commentFromJson(String str) => List<Comments>.from(json.decode(str).map((x) => Comments.fromJson(x)));

String commentToJson(List<Comments> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comments {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  Comments({this.postId, this.id, this.name, this.email, this.body});

  Comments.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['body'] = this.body;
    return data;
  }
}