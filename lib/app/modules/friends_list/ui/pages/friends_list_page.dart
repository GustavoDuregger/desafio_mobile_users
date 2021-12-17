import 'package:desafio_mobile/app/modules/friends_list/bloc/friends_list_bloc.dart';
import 'package:desafio_mobile/app/modules/friends_list/models/friends_list_response.dart';
import 'package:desafio_mobile/app/modules/friends_list/ui/widgets/friends_item_widget.dart';
import 'package:desafio_mobile/app/modules/friends_list/ui/widgets/header_friends_list_widget.dart';
import 'package:desafio_mobile/app/share/ui/widgets/error_message_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendsListPage extends StatefulWidget {
  const FriendsListPage({Key? key}) : super(key: key);

  @override
  _FriendsListPageState createState() => _FriendsListPageState();
}

class _FriendsListPageState extends State<FriendsListPage> {
  @override
  void initState() {
    super.initState();
    getFriendsListBloc.getFriendsList();
  }

  @override
  void dispose() {
    getFriendsListBloc.getFriendsList();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
        children: [
          buildHeaderFriendsListPage(),
          Expanded(
            child: StreamBuilder(
              stream: getFriendsListBloc.subject.stream,
              builder: (context, AsyncSnapshot<FriendsListResponse> snapshot) {
                if (snapshot.hasData) {
                  return buildFriendsList(snapshot);
                } else if (snapshot.hasError) {
                  return MessageErrorWidget(icon: Icons.error_outline, text: "Ocorreu um erro inesperado",);
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
