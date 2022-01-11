import 'package:desafio_mobile/features/users/data/models/user_response.dart';

abstract class UserRepositoryProtocol{
  Future<UsersResponse> getUsers();
}