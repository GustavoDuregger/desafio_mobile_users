
import 'package:desafio_mobile/features/users/data/models/user_model.dart';

class UsersResponse {
  final List<UserModel> users;
  final String error;

  UsersResponse(this.users, this.error);

  UsersResponse.fromJson(Map<String, dynamic> json)
      : users = (json['results'] as List)
      .map((i) => new UserModel.fromJson(i))
      .toList(),
      error = "";

  UsersResponse.withError(String errorValue)
      : users = [],
        error = errorValue;
}