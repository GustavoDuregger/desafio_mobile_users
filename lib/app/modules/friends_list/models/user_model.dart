
import 'package:desafio_mobile/app/share/core/entities/user_entity.dart';

import 'name_model.dart';
import 'location_model.dart';
import 'login_model.dart';
import 'picture_model.dart';

class UserModel extends UserEntity {
  final String gender;
  final NameModel name;
  final LocationModel location;
  final String email;
  final LoginModel login;
  final String phone;
  final String cell;
  final PictureModel picture;

  const UserModel({required this.gender, required this.name, required this.location, required this.email, required this.login,
      required this.phone, required this.cell, required this.picture})
      : super(
            gender: gender,
            name: name,
            location: location,
            email: email,
            login: login,
            phone: phone,
            cell: cell,
            picture: picture);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      gender: json["gender"],
      name: json["name"],
      location: json["location"],
      email: json["email"],
      login: json["login"],
      phone: json["phone"],
      cell: json["cell"],
      picture: json["picture"],
    );
  }

  Map<String, dynamic> toJson() =>
      {"gender": gender, "name": name, "location": location,
        "email": email, "login": login, "phone": phone,
        "cell": cell, "picture": picture,};
}
