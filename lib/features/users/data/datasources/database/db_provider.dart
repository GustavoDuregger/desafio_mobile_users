
import 'package:moor_flutter/moor_flutter.dart';

import 'dao/userDAO.dart';
//flutter packages pub run build_runner build
part 'db_provider.g.dart';

@DataClassName("User")
class UserDataClass extends Table {
  TextColumn get name => text().nullable()();
  TextColumn get picture => text().nullable()();
  TextColumn get gender => text().nullable()();
}

@UseMoor(tables: [UserDataClass])
class DatabaseProvider extends _$DatabaseProvider {

  static DatabaseProvider instance = DatabaseProvider._internal();

  UserDAO userDAO = UserDAO(instance);
  DatabaseProvider._internal():super(FlutterQueryExecutor.inDatabaseFolder(path: "db.sqlite"));

  Stream<List<User>> listAll(){
    return (select(userDataClass)).watch();
  }

  Future addUserToDatabase(User user){
    return into(userDataClass).insert(user);
  }

  @override
  int get schemaVersion => 1;

}

