import 'package:desafio_mobile/app/share/core/entities/user_entity.dart';

class UserProfileModel extends UserEntity {
  final String name;
  final String picture;
  final String email;
  final String location;

  UserProfileModel(
      {required this.name,
      required this.picture,
      required this.email,
      required this.location})
      : super(name: name, picture: picture);

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
        name: json['name']['first'] + ' ' + json['name']['last'],
        picture: json['picture']['large'],
        email: json['email'],
        location: json['location']['city'] +
            ', ' +
            json['location']['state'] +
            ', ' +
            json['location']['country']);
  }
}
