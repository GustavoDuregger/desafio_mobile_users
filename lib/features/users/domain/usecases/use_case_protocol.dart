abstract class UseCaseProtocol<Type> {
  Future<Type> call(params);
}