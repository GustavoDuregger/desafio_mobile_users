
import 'package:desafio_mobile/app/modules/user_profile/bloc/user_profile_bloc.dart';
import 'package:desafio_mobile/app/modules/user_profile/models/user_profile_response.dart';
import 'package:desafio_mobile/app/modules/user_profile/ui/widgets/user_profile_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  void initState() {
    super.initState();
    getUserProfileBloc.getUserProfile();
  }

  @override
  void dispose() {
    getUserProfileBloc.getUserProfile();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: getUserProfileBloc.subject.stream,
              builder: (context, AsyncSnapshot<UserProfileResponse> snapshot) {
                if (snapshot.hasData) {
                  return buildUserProfileCard(snapshot);
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
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
