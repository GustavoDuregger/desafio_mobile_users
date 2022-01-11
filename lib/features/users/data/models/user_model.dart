
import 'package:desafio_mobile/features/users/domain/entities/user_entity.dart';

class UserModel extends UserEntity{
  final String name;
  final String picture;
  final String gender;

  UserModel({required this.name, required this.picture, required this.gender}) : super(name: name, picture: picture);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name']['first'] + ' ' + json['name']['last'],
        picture: json['picture']['large'],
        gender: json['gender']
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "picture": picture,
  };

}