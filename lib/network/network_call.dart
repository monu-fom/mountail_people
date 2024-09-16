import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mountain_people/network/res_models/parent_model.dart';
import 'package:mountain_people/network/res_models/register_model.dart';

import '../utils/constant.dart';
import '../utils/utility.dart';

class NetworkCall{

  static Future<ParentModel> postJsonCall(String url,Map<String,dynamic> postData) async {
    Uri uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(postData),
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      return ParentModel.fromJson(
        jsonResponse,
        (data) => RegisterModel.fromJson(data),
      );
    }
    else {
      final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      return ParentModel.fromJson(
        jsonResponse,
            (data) => RegisterModel.fromJson(data),
      );
    }
  }

  static Future<ParentModel> postJsonCallAuth(String url,Map<String,dynamic> postData) async {
    String userToken = await Utility.getStringPref(Constants.userToken);
    Uri uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(postData),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $userToken'
      },
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      return ParentModel.fromJson(
        jsonResponse,
            (data) => RegisterModel.fromJson(data),
      );
    }
    else {
      final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      return ParentModel.fromJson(
        jsonResponse,
            (data) => RegisterModel.fromJson(data),
      );
    }
  }

  static Future<ParentModel> postFormCallAuth(String url,Map<String,dynamic> postData) async {
    String userToken = await Utility.getStringPref(Constants.userToken);
    Uri uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: postData,
      headers: {
        'Authorization': 'Bearer $userToken'
      },
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      return ParentModel.fromJson(
        jsonResponse,
            (data) => RegisterModel.fromJson(data),
      );
    }
    else {
      final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      return ParentModel.fromJson(
        jsonResponse,
            (data) => RegisterModel.fromJson(data),
      );
    }
  }


  // static Future<http.StreamedResponse> makeMultipartRequest(String post_url, var body, List<http.MultipartFile> files) async {
  //   String userToken = await Utility.getStringPref(Constants.userToken);
  //   if (!EasyLoading.isShow) EasyLoading.show(status: 'Please Wait...');
  //   var request = http.MultipartRequest("POST", Uri.parse(post_url));
  //   request.files.addAll(files);
  //   request.fields.addAll(body);
  //   request.headers.addAll({
  //     'Authorization': 'Bearer $userToken'
  //   });
  //   final res = await request.send().timeout(
  //     const Duration(minutes: 5),
  //     onTimeout: () {
  //       if (EasyLoading.isShow) EasyLoading.dismiss();
  //       return timeOutResponse(
  //         httpMethod: 'MULTIPART POST',
  //         error: 'Request Time Out',
  //         url: post_url,
  //       ); // Request Timeout response status code
  //     },
  //   );
  //
  //   if (EasyLoading.isShow) EasyLoading.dismiss();
  //   // return await http.Response.fromStream(res);
  //   if (res.statusCode == 200) {
  //     return res;
  //     // final jsonResponse = json.decode(res.body) as Map<String, dynamic>;
  //     // return ParentModel.fromJson(
  //     //   jsonResponse,
  //     //       (data) => RegisterModel.fromJson(data),
  //     // );
  //   }
  //   else {
  //     return res;
  //     // final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
  //     // return ParentModel.fromJson(
  //     //   jsonResponse,
  //     //       (data) => RegisterModel.fromJson(data),
  //     // );
  //   }
  // }


  static Future<ParentModel> getResponse(String url) async {
    Uri uri = Uri.parse(url);
    String userToken = await Utility.getStringPref(Constants.userToken);
    final response = await http.get(uri,headers: {'Authorization': 'Bearer $userToken'},);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      return ParentModel.fromJson(
        jsonResponse,
            (data) => RegisterModel.fromJson(data),
      );
    }
    else {
      final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      return ParentModel.fromJson(
        jsonResponse,
            (data) => RegisterModel.fromJson(data),
      );
    }
  }

  static http.StreamedResponse timeOutResponse({
    required String httpMethod,
    dynamic error,
    required String url,
  }) {
    Map<String, dynamic> body = {
      'timeout': '5 Minute',
      'error': 'File may heavy then $error',
    };

    int statusCode = 404;
    Uri destination = Uri.parse(url);
    String json = jsonEncode(body);

    return http.StreamedResponse(
      Stream.value(json.codeUnits),
      statusCode,
      request: http.Request(httpMethod, destination),
    );
  }

}