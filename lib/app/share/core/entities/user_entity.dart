import 'location_entity.dart';
import 'login_entity.dart';
import 'name_entity.dart';
import 'picture_entity.dart';

class UserEntity{
  final String gender;
  final NameEntity name;
  final LocationEntity location;
  final String email;
  final LoginEntity  login;
  final String phone;
  final String cell;
  final PictureEntity picture;

  const UserEntity({required this.gender, required this.name, required this.location, required this.email, required this.login,
      required this.phone, required this.cell, required this.picture});
}