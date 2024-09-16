// To parse this JSON data, do
//
//     final getPostModel = getPostModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
part 'get_post_model.g.dart';

GetPostModel getPostModelFromJson(String str) => GetPostModel.fromJson(json.decode(str));

String getPostModelToJson(GetPostModel data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class GetPostModel {
  @HiveField(0)
  int currentPage;

  @HiveField(1)
  List<PostSingle> data;

  @HiveField(3)
  String firstPageUrl;

  @HiveField(4)
  int from;

  @HiveField(5)
  int lastPage;

  @HiveField(6)
  String lastPageUrl;

  @HiveField(7)
  List<Link> links;

  @HiveField(8)
  dynamic nextPageUrl;

  @HiveField(9)
  String path;

  @HiveField(10)
  String perPage;

  @HiveField(11)
  dynamic prevPageUrl;

  @HiveField(12)
  int to;

  @HiveField(13)
  int total;

  GetPostModel({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory GetPostModel.fromJson(Map<String, dynamic> json) => GetPostModel(
    currentPage: json["current_page"],
    data: List<PostSingle>.from(json["data"].map((x) => PostSingle.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };

  @override
  String toString() {
    return '$currentPage: $from';
  }
}


@HiveType(typeId: 2)
class PostSingle {
  @HiveField(0)
  int id;

  @HiveField(1)
  int userId;

  @HiveField(2)
  String description;

  @HiveField(3)
  dynamic likeCount;

  @HiveField(4)
  dynamic commentCount;

  @HiveField(5)
  dynamic rePostCount;

  @HiveField(6)
  DateTime postDate;

  @HiveField(7)
  String imagePath;

  @HiveField(8)
  List<String> likeList;

  @HiveField(9)
  dynamic bookMark;

  @HiveField(10)
  String tags;

  @HiveField(11)
  dynamic replyPostKeyList;

  @HiveField(12)
  dynamic parentKey;

  @HiveField(13)
  dynamic lanCode;

  @HiveField(14)
  dynamic childRePostKey;

  @HiveField(15)
  String isActive;

  @HiveField(16)
  dynamic itemDeletedDate;

  // @HiveField(17)
  // DateTime createdAt;
  //
  // @HiveField(18)
  // DateTime updatedAt;

  @HiveField(19)
  String userName;

  @HiveField(20)
  String email;

  PostSingle({
    required this.id,
    required this.userId,
    required this.description,
    required this.likeCount,
    required this.commentCount,
    required this.rePostCount,
    required this.postDate,
    required this.imagePath,
    required this.likeList,
    required this.bookMark,
    required this.tags,
    required this.replyPostKeyList,
    required this.parentKey,
    required this.lanCode,
    required this.childRePostKey,
    required this.isActive,
    required this.itemDeletedDate,
    // required this.createdAt,
    // required this.updatedAt,
    required this.userName,
    required this.email,
  });

  factory PostSingle.fromJson(Map<String, dynamic> json) => PostSingle(
    id: json["id"],
    userId: json["user_id"],
    description: json["description"]??'',
    likeCount: json["like_count"]??'0',
    commentCount: json["comment_count"]??'0',
    rePostCount: json["re_post_count"]??'',
    postDate: DateTime.parse(json["post_date"]??'2024-09-06 11:53:14'),
    imagePath: json["image_path"]??'',
    likeList: json["like_list"]??[],
    bookMark: json["book_mark"]??'',
    tags: json["tags"]??'',
    replyPostKeyList: json["reply_post_key_list"]??'',
    parentKey: json["parent_key"]??'',
    lanCode: json["lan_code"]??'',
    childRePostKey: json["child_re_post_key"]??'',
    isActive: json["is_active"]??'',
    itemDeletedDate: json["item_deleted_date"],
    // createdAt: DateTime.parse(json["created_at"]??'2024-09-06 11:53:14'),
    // updatedAt: DateTime.parse(json["updated_at"]??'2024-09-06 11:53:14'),
    userName: json["user_name"]??'',
    email: json["email"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "description": description,
    "like_count": likeCount,
    "comment_count": commentCount,
    "re_post_count": rePostCount,
    "post_date": postDate.toIso8601String(),
    "image_path": imagePath,
    "like_list": likeList,
    "book_mark": bookMark,
    "tags": tags,
    "reply_post_key_list": replyPostKeyList,
    "parent_key": parentKey,
    "lan_code": lanCode,
    "child_re_post_key": childRePostKey,
    "is_active": isActive,
    "item_deleted_date": itemDeletedDate,
    // "created_at": createdAt.toIso8601String(),
    // "updated_at": updatedAt.toIso8601String(),
    "user_name": userName,
    "email": email,
  };
}

class Link {
  String? url;
  String label;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
