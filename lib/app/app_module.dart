import 'package:flutter_modular/flutter_modular.dart';

import 'modules/friends_list/ui/pages/friends_list_page.dart';

class AppModule extends Module{

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const FriendsListPage()),
    //ChildRoute('/user_profile', child: (_, __) => const UserProfilePage()),
  ];
}