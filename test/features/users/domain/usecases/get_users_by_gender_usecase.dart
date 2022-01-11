import 'package:desafio_mobile/features/users/data/models/user_response.dart';
import 'package:desafio_mobile/features/users/data/repositories/user_repository.dart';
import 'package:desafio_mobile/features/users/domain/usecases/get_users_by_gender_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/users_mock.dart';

void main(){
  late GetUsersByGender usecase;
  late UserRepository repository;

  setUp((){
    repository = MockUserRepository();
    usecase = GetUsersByGender(repository);
  });

  final String errorMock = "";
  final userResponseMaleMock = UsersResponse(userMaleListMock, errorMock);
  final userResponseFemaleMock = UsersResponse(userFemaleListMock, errorMock);

  test('Should get a male user', () async{
    when(() => repository.getUsersByGender('male')).thenAnswer((_) async => (userResponseMaleMock));
    final result = await usecase.call("male");
    result.users.forEach((user) {
      expect(user.gender, "male");
    });
  });

  test('Should get a female user', () async{
    when(() => repository.getUsersByGender('female')).thenAnswer((_) async => (userResponseFemaleMock));
    final result = await usecase.call("female");
    result.users.forEach((user) {
      expect(user.gender, "female");
    });
  });
}

class MockUserRepository extends Mock implements UserRepository{}