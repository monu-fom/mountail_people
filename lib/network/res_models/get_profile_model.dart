// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) => GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) => json.encode(data.toJson());

class GetProfileModel {
  int id;
  String name;
  String username;
  String userType;
  String loginType;
  int gender;
  DateTime dob;
  String designation;
  int reportedSpam;
  int archived;
  String albumCount;
  DateTime dateActive;
  DateTime dateLastActive;
  String email;
  String mobile;
  String profileImage;
  String companyName;
  int industryType;
  String address;
  int city;
  int state;
  int country;
  String zipcode;
  String mobileCountryCode;
  String gst;
  String website;
  String logo;
  String role;

  GetProfileModel({
    required this.id,
    required this.name,
    required this.username,
    required this.userType,
    required this.loginType,
    required this.gender,
    required this.dob,
    required this.designation,
    required this.reportedSpam,
    required this.archived,
    required this.albumCount,
    required this.dateActive,
    required this.dateLastActive,
    required this.email,
    required this.mobile,
    required this.profileImage,
    required this.companyName,
    required this.industryType,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.zipcode,
    required this.mobileCountryCode,
    required this.gst,
    required this.website,
    required this.logo,
    required this.role,
  });

  factory GetProfileModel.fromJson(Map<String, dynamic> json) => GetProfileModel(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    userType: json["user_type"],
    loginType: json["login_type"],
    gender: json["gender"],
    dob: DateTime.parse(json["dob"]),
    designation: json["designation"],
    reportedSpam: json["reported_spam"],
    archived: json["archived"],
    albumCount: json["album_count"],
    dateActive: DateTime.parse(json["date_active"]),
    dateLastActive: DateTime.parse(json["date_last_active"]),
    email: json["email"],
    mobile: json["mobile"],
    profileImage: json["profile_image"],
    companyName: json["company_name"],
    industryType: json["industry_type"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    zipcode: json["zipcode"],
    mobileCountryCode: json["mobile_country_code"],
    gst: json["gst"],
    website: json["website"],
    logo: json["logo"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "user_type": userType,
    "login_type": loginType,
    "gender": gender,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "designation": designation,
    "reported_spam": reportedSpam,
    "archived": archived,
    "album_count": albumCount,
    "date_active": "${dateActive.year.toString().padLeft(4, '0')}-${dateActive.month.toString().padLeft(2, '0')}-${dateActive.day.toString().padLeft(2, '0')}",
    "date_last_active": "${dateLastActive.year.toString().padLeft(4, '0')}-${dateLastActive.month.toString().padLeft(2, '0')}-${dateLastActive.day.toString().padLeft(2, '0')}",
    "email": email,
    "mobile": mobile,
    "profile_image": profileImage,
    "company_name": companyName,
    "industry_type": industryType,
    "address": address,
    "city": city,
    "state": state,
    "country": country,
    "zipcode": zipcode,
    "mobile_country_code": mobileCountryCode,
    "gst": gst,
    "website": website,
    "logo": logo,
    "role": role,
  };
}
//18001801290  18601801290 5001290 39020202