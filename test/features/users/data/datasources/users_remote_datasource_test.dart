import 'package:desafio_mobile/features/users/data/datasources/users_remote_datasource.dart';
import 'package:desafio_mobile/features/users/data/models/user_response.dart';
import 'package:desafio_mobile/features/users/data/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main(){

  test('Should get a correct response (users) to a http request', () async {

    UserRemoteDataSource dataSource = UserRemoteDataSource();
    UsersResponse response = await dataSource.getUsers();
    RegExp expPicture = new RegExp(r"(http(s?):)([/|.|\w|\s|-])*\.(?:jpg|gif|png)");

    expect(response.users.length, greaterThan(1));

    response.users.forEach((user) {
      expect(user.name is String, true);
      expect(expPicture.hasMatch(user.picture), true);
      expect(user.picture is String, true);
      expect(["male", "female"].contains(user.gender), true);
    });

  });
}

class MockUserRepository extends Mock implements UserRepository{}