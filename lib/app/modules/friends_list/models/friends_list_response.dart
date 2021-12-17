import 'package:desafio_mobile/app/modules/friends_list/models/friend_model.dart';

class FriendsListResponse {
  final List<FriendModel> friends;
  FriendsListResponse(this.friends);

  factory FriendsListResponse.fromJson(Map<String, dynamic> json) {
    var friendsListFromJson = json['results'];

    List<FriendModel> friends =
    List<FriendModel>.from(friendsListFromJson.map((element) {
      return FriendModel.fromJson(element);
    }).toList());

    FriendsListResponse result =
    FriendsListResponse(friends);

    return result;
  }
}