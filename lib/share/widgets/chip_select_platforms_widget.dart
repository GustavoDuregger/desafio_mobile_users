import 'package:desafio_mobile/share/theme/colors.dart';
import 'package:flutter/material.dart';

Widget chipSelectPlatform(String label, Color color) {
  return Padding(
    padding: const EdgeInsets.only(left: 5),
    child: Chip(
      labelPadding: const EdgeInsets.all(1.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.white70,
        child: Text(label[0].toUpperCase(),
          style: const TextStyle(color: secondaryColor),),
      ),
      label: Text(
        " $label",
        style: const TextStyle(
          color: textColorLight,
        ),
      ),
      backgroundColor: color,
      padding: const EdgeInsets.all(8.0),
    ),
  );
}