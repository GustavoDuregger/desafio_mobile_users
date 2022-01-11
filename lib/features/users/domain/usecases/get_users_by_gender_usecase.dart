import 'package:desafio_mobile/features/users/data/models/user_response.dart';
import 'package:desafio_mobile/features/users/data/repositories/user_repository.dart';
import 'package:desafio_mobile/features/users/domain/usecases/use_case_protocol.dart';

class GetUsersByGender implements UseCaseProtocol<UsersResponse> {
  GetUsersByGender(this.userRepository);

  final UserRepository userRepository;

  @override
  Future<UsersResponse> call(gender) async {
    return await userRepository.getUsersByGender(gender);
  }
}