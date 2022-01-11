

import 'package:desafio_mobile/features/users/data/datasources/users_remote_datasource.dart';
import 'package:desafio_mobile/features/users/data/models/user_response.dart';
import 'package:desafio_mobile/features/users/domain/repositories/users_repository_protocol.dart';

class UserRepository implements UserRepositoryProtocol{
  final UserRemoteDataSource remoteDataSource;
  final UserRemoteDataSource localDataSource;

  UserRepository(this.remoteDataSource, this.localDataSource);

  @override
  Future<UsersResponse> getUsers() async {
    UsersResponse response = await remoteDataSource.getUsers();
    return UsersResponse(response.users, response.error);
  }

  Future<UsersResponse> getUsersByGender(String gender) async {
    UsersResponse response = await remoteDataSource.getUsersByGender(gender);
    return UsersResponse(response.users, response.error);
  }

  Future<UsersResponse> getUsersOffline() async {
    UsersResponse response = await localDataSource.getUsers();
    return UsersResponse(response.users, response.error);
  }
}