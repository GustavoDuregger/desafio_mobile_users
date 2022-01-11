//caso haver a possibilidade de users ser usado em outros modulos ela pode ser aplicado na camada share
class UserEntity {
  final String name;
  final String picture;

  const UserEntity({required this.name, required this.picture});
}