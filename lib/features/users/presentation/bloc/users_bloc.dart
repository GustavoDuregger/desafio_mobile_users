import 'package:desafio_mobile/features/users/data/models/user_response.dart';
import 'package:desafio_mobile/features/users/domain/usecases/get_users_by_gender_usecase.dart';
import 'package:desafio_mobile/features/users/domain/usecases/get_users_offline_from_cache.dart';
import 'package:desafio_mobile/features/users/domain/usecases/get_users_usecase.dart';
import 'package:desafio_mobile/features/users/presentation/bloc/users_event.dart';
import 'package:desafio_mobile/features/users/presentation/bloc/users_state.dart';
import 'package:desafio_mobile/share/core/exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UsersBloc extends Bloc<UsersListEvent, UsersListState>{
  final GetUsers getUsersUseCase;
  final GetUsersOffline getUsersOffline;
  final GetUsersByGender getUsersByGenderUseCase;
  final String params;

   UsersBloc({
     required GetUsers getUsers,
     required GetUsersByGender getUsersByGender,
     required GetUsersOffline getUsersOffline,
     required this.params})
      : assert(getUsers != null),
         getUsersUseCase = getUsers,
         getUsersByGenderUseCase = getUsersByGender,
         getUsersOffline = getUsersOffline,
         super(Empty());

  @override
  UsersListState get initialState => Empty();

  @override
  Stream<UsersListState> mapEventToState(
      UsersListEvent event,
      ) async* {
    if (event is GetDefaultUsersListEvent) {
      yield Loading();
      try {
        final UsersResponse result = await getUsersUseCase(params);
        if (result.users.length == 0) {
          throw EmptyList();
        }
        yield Loaded(users: result.users);
      } catch (err) {
        yield* _errorHandler(err);
      }
    } else if (event is GetDefaultUsersListEventOffline) {
      yield Loading();
      try {
        final UsersResponse result = await getUsersOffline(params);
        if (result.users.length == 0) {
          throw EmptyList();
        }
        yield Loaded(users: result.users);
      } catch (err) {
        yield* _errorHandler(err);
      }
    } else if (event is GetUsersListByGenderFemaleEvent){
      yield Loading();
      try {
        final UsersResponse result = await getUsersByGenderUseCase("female");
        if (result.users.length == 0) {
          throw EmptyList();
        }
        yield Loaded(users: result.users);
      } catch (err) {
        yield* _errorHandler(err);
      }
    } else if (event is GetUsersListByGenderMaleEvent){
      yield Loading();
      try {
        final UsersResponse result = await getUsersByGenderUseCase("male");
        if (result.users.length == 0) {
          throw EmptyList();
        }
        yield Loaded(users: result.users);
      } catch (err) {
        yield* _errorHandler(err);
      }
    }
  }

  Stream<UsersListState> _errorHandler(dynamic response) async* {
    if (response is AppExceptions) {
      yield Error(message: response.message);
    } else {
      yield Error(message: response.toString());
    }
  }

}