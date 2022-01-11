
import 'package:desafio_mobile/features/users/data/datasources/users_datasource_protocol.dart';
import 'package:desafio_mobile/features/users/data/models/user_response.dart';
import 'package:dio/dio.dart';

class UserRemoteDataSource implements UsersDataSourceProtocol{
  final String apiKey = "";
  static String mainUrl = "https://randomuser.me/api";
  final Dio _dio = Dio();
  var getUsersUrl = "$mainUrl/?results=15";

  @override
  Future<UsersResponse> getUsers() async {
    try {
      Response response = await _dio.get(getUsersUrl);
      return UsersResponse.fromJson(response.data);
    }catch (error, stacktrace){
      return UsersResponse.withError("$error");
    }
  }

  Future<UsersResponse> getUsersByGender(String gender) async {
    try {
      Response response = await _dio.get("$getUsersUrl&gender=$gender");
      return UsersResponse.fromJson(response.data);
    }catch (error, stacktrace){
      return UsersResponse.withError("$error");
    }
  }

  // Future<List<UserModel>> saveLocalUsers() async {
  //   Response response = await _dio.get(getUsersUrl);
  //
  //   Future<List<UserModel>> result = (response.data as List).map((user) {
  //     DBProvider.db.createUser(UserModel.fromJson(user));
  //   }).toList() as Future<List<UserModel>>;
  //
  //   return result;
  // }
}