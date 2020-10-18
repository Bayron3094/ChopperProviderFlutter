import 'dart:convert';

List<ListPost> listPostFromJson(String str) => List<ListPost>.from(json.decode(str).map((x) => ListPost.fromJson(x)));

String listPostToJson(List<ListPost> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListPost {
  ListPost({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory ListPost.fromJson(Map<String, dynamic> json) => ListPost(
    userId: json["userId"] == null ? null : json["userId"],
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    body: json["body"] == null ? null : json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId == null ? null : userId,
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "body": body == null ? null : body,
  };
}