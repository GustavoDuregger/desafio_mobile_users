import 'package:moor_flutter/moor_flutter.dart';

import '../db_provider.dart';
//flutter packages pub run build_runner build
part 'userDAO.g.dart';

@UseDao(tables: [UserDataClass])
class UserDAO extends DatabaseAccessor<DatabaseProvider> with _$UserDAOMixin{
  UserDAO(DatabaseProvider db) : super(db);
}