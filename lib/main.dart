import 'package:desafio_mobile/app/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_widget.dart';

void main() {
  runApp(ModularApp(module: AppModule(),
    child: const AppWidget(),));
}
