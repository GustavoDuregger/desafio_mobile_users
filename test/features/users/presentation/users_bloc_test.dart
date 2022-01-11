
import 'package:desafio_mobile/features/users/data/models/user_response.dart';
import 'package:desafio_mobile/features/users/domain/repositories/users_repository_protocol.dart';
import 'package:desafio_mobile/features/users/domain/usecases/get_users_by_gender_usecase.dart';
import 'package:desafio_mobile/features/users/domain/usecases/get_users_offline_from_cache.dart';
import 'package:desafio_mobile/features/users/domain/usecases/get_users_usecase.dart';
import 'package:desafio_mobile/features/users/presentation/bloc/users_bloc.dart';
import 'package:desafio_mobile/features/users/presentation/bloc/users_event.dart';
import 'package:desafio_mobile/features/users/presentation/bloc/users_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/users_mock.dart';

void main(){
  final getAllUsers = MockGetUserUsecase();
  final getUsersByGender = MockGetUserByGenderUsecase();
  final getUsersOffline = MockGetUserOfflineUsecase();
  final bloc = UsersBloc(getUsers: getAllUsers, getUsersByGender: getUsersByGender, params: "", getUsersOffline: getUsersOffline);
  late GetUsers usecase;
  late UserRepositoryProtocol repository;

  setUp((){
    repository = MockUserRepository();
    usecase = GetUsers(repository);
  });

  test("Should return a list of users", () async{
    when(() => repository.getUsers()).thenAnswer((_) async => UsersResponse([userMale], ""));
    bloc.add(GetDefaultUsersListEvent());

    await expectLater(bloc, emitsInOrder([
      isA<Loading>(),
      isA<Loaded>(),
    ]));
  });
}

class MockGetUserUsecase extends Mock implements GetUsers{}
class MockGetUserByGenderUsecase extends Mock implements GetUsersByGender{}
class MockGetUserOfflineUsecase extends Mock implements GetUsersOffline{}
class MockUserRepository extends Mock implements UserRepositoryProtocol{}