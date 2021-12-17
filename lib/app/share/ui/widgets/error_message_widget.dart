import 'package:desafio_mobile/app/share/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class MessageErrorWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  MessageErrorWidget({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(color: ColorsPalette.textColorLight),
          ),
          icon == null
              ? const SizedBox()
              : Icon(
            icon,
            color: ColorsPalette.textColorLight
          ),
        ],
      ),
    );
  }
}