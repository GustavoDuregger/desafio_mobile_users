import 'dart:convert';
import 'package:desafio_mobile/app/modules/friends_list/models/friends_list_response.dart';
import 'package:http/http.dart' as http;

class FriendsListRepository {
  static String url = 'https://randomuser.me/api/?results=15';

  Future<FriendsListResponse> getFriendsList() async {
    var response = await http.get(Uri.parse(url));

    Map<String, dynamic> map = json.decode(response.body);
    return FriendsListResponse.fromJson(map);
  }
}