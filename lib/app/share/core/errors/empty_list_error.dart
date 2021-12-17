import 'package:desafio_mobile/app/share/core/errors/app_exceptions_protocol.dart';
import 'package:flutter/material.dart';

class EmptyList extends AppExceptions {
  EmptyList() : super(icon: Icons.list, message: "Nenhum resultado encontrado");
}