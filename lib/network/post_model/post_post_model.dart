// To parse this JSON data, do
//
//     final postPostModel = postPostModelFromJson(jsonString);

import 'dart:convert';

PostPostModel postPostModelFromJson(String str) => PostPostModel.fromJson(json.decode(str));

String postPostModelToJson(PostPostModel data) => json.encode(data.toJson());

class PostPostModel {
  String id;
  String userId;
  String description;
  String postDate;
  String imagePath;
  String tags;

  PostPostModel({
    required this.id,
    required this.userId,
    required this.description,
    required this.postDate,
    required this.imagePath,
    required this.tags,
  });

  factory PostPostModel.fromJson(Map<String, dynamic> json) => PostPostModel(
    id: json["id"],
    userId: json["user_id"],
    description: json["description"],
    postDate: json["post_date"],
    imagePath: json["image_path"],
    tags: json["tags"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "description": description,
    "post_date": postDate,
    "image_path": imagePath,
    "tags": tags,
  };
}
