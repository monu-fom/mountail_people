// To parse this JSON data, do
//
//     final postProfileModel = postProfileModelFromJson(jsonString);

import 'dart:convert';

PostProfileModel postProfileModelFromJson(String str) => PostProfileModel.fromJson(json.decode(str));

String postProfileModelToJson(PostProfileModel data) => json.encode(data.toJson());

class PostProfileModel {
  String name;
  String email;
  String mobile;
  int gender;
  String dob;
  String address;
  int city;
  int state;
  int country;
  String zipcode;
  String mobileCountryCode;
  String gst;
  String profileImage;
  String profileCover;

  PostProfileModel({
    required this.name,
    required this.email,
    required this.mobile,
    required this.gender,
    required this.dob,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.zipcode,
    required this.mobileCountryCode,
    required this.gst,
    required this.profileImage,
    required this.profileCover,
  });

  factory PostProfileModel.fromJson(Map<String, dynamic> json) => PostProfileModel(
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    gender: json["gender"],
    dob: json["dob"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    zipcode: json["zipcode"],
    mobileCountryCode: json["mobile_country_code"],
    gst: json["gst"],
    profileImage: json["profile_image"],
    profileCover: json["profile_cover"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "mobile": mobile,
    "gender": gender,
    "dob": dob,
    "address": address,
    "city": city,
    "state": state,
    "country": country,
    "zipcode": zipcode,
    "mobile_country_code": mobileCountryCode,
    "gst": gst,
    "profile_image": profileImage,
    "profile_cover": profileCover,
  };
}
