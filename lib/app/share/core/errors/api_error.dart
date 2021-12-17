import 'package:flutter/material.dart';

import 'app_exceptions_protocol.dart';

class ApiError extends AppExceptions {
  ApiError()
      : super(
      icon: Icons.error_outline,
      message: "Nossos servidores estão sofrendo com instabilidade, por favor volte mais tarde");
}