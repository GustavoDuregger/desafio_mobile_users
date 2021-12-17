import 'dart:convert';
import 'package:desafio_mobile/app/modules/user_profile/models/user_profile_response.dart';
import 'package:desafio_mobile/app/share/core/errors/api_error.dart';
import 'package:http/http.dart' as http;

class UserProfileRepository {
  static String url = 'https://randomuser.me/api/';

  Future<UserProfileResponse> getUserProfile() async {
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {
      try {
        Map<String, dynamic> map = json.decode(response.body);
        return UserProfileResponse.fromJson(map);
      } catch (e){
        throw ApiError();
      }
    } else {
      throw ApiError();
    }
  }
}