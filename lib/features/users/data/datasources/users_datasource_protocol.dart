import 'package:desafio_mobile/features/users/data/models/user_response.dart';

abstract class UsersDataSourceProtocol {
  Future<UsersResponse> getUsers();
}