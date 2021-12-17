import 'package:desafio_mobile/app/share/core/entities/user_entity.dart';

class FriendModel extends UserEntity{
  final String name;
  final String picture;

  FriendModel({required this.name, required this.picture}) : super(name: name, picture: picture);

  factory FriendModel.fromJson(Map<String, dynamic> json) {
    return FriendModel(
        name: json['name']['first'] + ' ' + json['name']['last'], picture: json['picture']['large']);
  }

}
