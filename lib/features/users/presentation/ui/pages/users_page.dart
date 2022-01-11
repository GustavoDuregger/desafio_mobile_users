
import 'package:desafio_mobile/features/users/data/datasources/users_remote_datasource.dart';
import 'package:desafio_mobile/features/users/data/repositories/user_repository.dart';
import 'package:desafio_mobile/features/users/domain/usecases/get_users_by_gender_usecase.dart';
import 'package:desafio_mobile/features/users/domain/usecases/get_users_offline_from_cache.dart';
import 'package:desafio_mobile/features/users/domain/usecases/get_users_usecase.dart';
import 'package:desafio_mobile/features/users/presentation/bloc/users_bloc.dart';
import 'package:desafio_mobile/features/users/presentation/bloc/users_event.dart';
import 'package:desafio_mobile/features/users/presentation/bloc/users_state.dart';
import 'package:desafio_mobile/features/users/presentation/ui/widgets/users_list_widget.dart';
import 'package:desafio_mobile/share/theme/colors.dart';
import 'package:desafio_mobile/share/widgets/chip_select_platforms_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatelessWidget {
  late GetUsers usersUseCase;
  late GetUsersByGender usersByGender;
  late UserRepository repo;
  late GetUsersOffline getUsersOffline;
  UserRemoteDataSource dataSource = UserRemoteDataSource();
  bool _allSelect = true, _femaleSelect = false, _maleSelect = false;

  UsersPage() {
    repo = UserRepository(dataSource,dataSource);
    usersUseCase = GetUsers(repo);
    usersByGender = GetUsersByGender(repo);
    getUsersOffline = GetUsersOffline(repo);
  }

  @override
  Widget build(BuildContext context) {

    void callDefaultList(BuildContext ctx) {
      BlocProvider.of<UsersBloc>(ctx).add(GetDefaultUsersListEvent());
    }
    void callUsersListByGenderFemale(BuildContext ctx) {
      BlocProvider.of<UsersBloc>(ctx).add(GetUsersListByGenderFemaleEvent());
    }
    void callUsersListByGenderMale(BuildContext ctx) {
      BlocProvider.of<UsersBloc>(ctx).add(GetUsersListByGenderMaleEvent());
    }

    return BlocProvider(
      create: (_) => UsersBloc(
          getUsers: usersUseCase,
          getUsersByGender: usersByGender,
          params: "", getUsersOffline: getUsersOffline),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          title: const Text(
            "Users",
            style: TextStyle(color: textColorDark),
          ),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<UsersBloc, UsersListState>(
            builder: (context, state) {

              if (state is Empty || state == null) {
                callDefaultList(context);
                return CircularProgressIndicator();
              } else if (state is Loading) {
                return CircularProgressIndicator();
              } else if (state is Loaded) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(onTap: (){
                            _allSelect = true; _maleSelect = false; _femaleSelect =false;
                            callDefaultList(context);
                          },child: chipSelectPlatform("All", _allSelect == true? primaryColor: secondaryColor)),
                          GestureDetector(onTap: (){
                            _allSelect = false; _maleSelect = false; _femaleSelect =true;
                            callUsersListByGenderFemale(context);
                          },child: chipSelectPlatform("Female",  _femaleSelect == true? primaryColor: secondaryColor)),
                          GestureDetector(onTap: (){
                            _allSelect = false; _maleSelect = true; _femaleSelect =false;
                            callUsersListByGenderMale(context);
                          },child: chipSelectPlatform("Male",  _maleSelect == true? primaryColor: secondaryColor)),
                        ],
                      ),
                      Expanded(child: buildFriendsList(state.users)),
                    ],
                  )
                );
              } else if (state is Error) {
                return Text(state.message);//pode ser substituido por um widget
              } else {
                return Text("Deu ruim");
              }
            },
          ),
        ),
      ),
    );
  }
}