import 'package:flutter/material.dart';

Widget buildHeaderFriendsListPage() {
  return Container(
    height: 150,
    decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.lightBlueAccent,
            Colors.blueAccent,
          ],
        ),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
    child: Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
      child: Row(
        children: [
          const Text(
            "Lista de amigos",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: const CircleAvatar(radius: 25, child: Icon(Icons.person)),
          ),
        ],
      ),
    ),
  );
}
