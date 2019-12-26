// To parse this JSON data, do
//
//     final JsonParse1 = JsonParse1FromJson(jsonString);

import 'dart:convert';

List<JsonParse1> JsonParse1FromJson(String str) => List<JsonParse1>.from(json.decode(str).map((x) => JsonParse1.fromJson(x)));

String JsonParse1ToJson(List<JsonParse1> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JsonParse1 {
  int userId;
  int id;
  String title;
  String body;

  JsonParse1({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory JsonParse1.fromJson(Map<String, dynamic> json) => JsonParse1(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
