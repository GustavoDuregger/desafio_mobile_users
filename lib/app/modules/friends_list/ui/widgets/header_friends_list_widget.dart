import 'package:desafio_mobile/app/share/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

Widget buildHeaderFriendsListPage() {
  return Container(
    height: 150,
    decoration:  BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            ColorsPalette.primaryColorAux,
            ColorsPalette.primaryColor,
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
            onTap: () => Modular.to.navigate('/user_profile'),
            child: const CircleAvatar(radius: 25, child: Icon(Icons.person)),
          ),
        ],
      ),
    ),
  );
}
