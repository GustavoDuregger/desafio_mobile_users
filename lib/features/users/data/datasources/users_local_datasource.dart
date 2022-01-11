

import 'package:desafio_mobile/features/users/data/datasources/users_datasource_protocol.dart';
import 'package:desafio_mobile/features/users/data/models/user_response.dart';

import 'database/db_provider.dart';
/*
class UserLocalDataSource implements UsersDataSourceProtocol{

  @override
  Future<UsersResponse> getUsers() async {
    try {
     var response = DatabaseProvider.instance.listAll();
      return UsersResponse.fromJson(response);
    }catch (error, stacktrace){
      return UsersResponse.withError("$error");
    }
  }
}*/