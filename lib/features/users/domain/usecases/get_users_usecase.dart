
import 'package:desafio_mobile/features/users/data/models/user_response.dart';
import 'package:desafio_mobile/features/users/domain/repositories/users_repository_protocol.dart';
import 'package:desafio_mobile/features/users/domain/usecases/use_case_protocol.dart';

class GetUsers implements UseCaseProtocol<UsersResponse> {
  GetUsers(this.userRepository);

  final UserRepositoryProtocol userRepository;

  @override
  Future<UsersResponse> call(params) async {
    return await userRepository.getUsers();
  }
}
