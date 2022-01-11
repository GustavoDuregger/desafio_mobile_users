import 'package:desafio_mobile/features/users/data/models/user_model.dart';
import 'package:flutter/material.dart';

Widget buildFriendsList(List<UserModel>? users) {
  return ListView.builder(
      itemCount: users?.length,
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
                    backgroundImage: NetworkImage(users![index].picture),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(width: 15),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(users[index].name, style: const TextStyle(fontSize: 16),),
                      Text(users[index].gender, style: const TextStyle(fontSize: 12),),
                    ],
                  )
                ],
              )),
        );
      });
}