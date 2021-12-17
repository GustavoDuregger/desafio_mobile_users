import 'package:desafio_mobile/app/modules/friends_list/models/friends_list_response.dart';
import 'package:desafio_mobile/app/modules/friends_list/models/friend_model.dart';
import 'package:flutter/material.dart';

Widget buildFriendsList(AsyncSnapshot<FriendsListResponse> snapshot) {
  List<FriendModel> friends = snapshot.data!.friends;
  return ListView.builder(
      itemCount: friends.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black12)),
          ),
          child: Padding(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, bottom: 10, top: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(friends[index].picture),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(width: 15),
                  Text(friends[index].name, style: const TextStyle(fontSize: 16),)
                ],
              )),
        );
      });
}
