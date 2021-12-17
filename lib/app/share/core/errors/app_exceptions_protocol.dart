import 'package:flutter/material.dart';

abstract class AppExceptions implements Exception {
  AppExceptions({required this.icon, required this.message});

  final String message;
  final IconData icon;
}