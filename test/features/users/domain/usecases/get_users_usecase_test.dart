import 'package:desafio_mobile/features/users/data/models/user_response.dart';
import 'package:desafio_mobile/features/users/domain/repositories/users_repository_protocol.dart';
import 'package:desafio_mobile/features/users/domain/usecases/get_users_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/users_mock.dart';

void main(){
  late GetUsers usecase;
  late UserRepositoryProtocol repository;

  setUp((){
    repository = MockUserRepository();
    usecase = GetUsers(repository);
  });

  final String errorMock = "";
  final userResponseMock = UsersResponse(userMaleListMock, errorMock);
  
  test('Should get user entity for a given date from repository',
      () async {
        when(() => repository.getUsers()).thenAnswer((_) async => (userResponseMock));
        final result = await usecase.call("");
        expect(result, userResponseMock);
      });
}

class MockUserRepository extends Mock implements UserRepositoryProtocol{}