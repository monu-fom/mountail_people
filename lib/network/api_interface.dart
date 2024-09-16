class ApiInterface{
  static String baseUrl = 'https://azusol.com';
  static String apiUrlAuth = '$baseUrl/projects/themountainpeople/backend/api/sa/auth';
  static String apiUrlUser = '$baseUrl/projects/themountainpeople/backend/api';
  /// USER API's ////
  static String register = '$apiUrlAuth/user_register';
  static String login = '$apiUrlAuth/login';
  static String getProfile = '$apiUrlUser/sa/user/profile/';
  static String updateProfile = '$apiUrlUser/sa/user/profile/';
  static String postSave = '$apiUrlUser/post_save';
  static String postList = '$apiUrlUser/post_list';
}

//https://azusol.com/projects/themountainpeople/backend/api/post_list