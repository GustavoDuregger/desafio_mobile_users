import 'package:flutter/material.dart';

abstract class AppExceptions implements Exception {
  AppExceptions({required this.message});

  final String message;
}

class EmptyList extends AppExceptions {
  EmptyList() : super(message: "No Results Found");
}

class ConnectionError extends AppExceptions {
  ConnectionError()
      : super(
      message: "Not Connection");
}

class ApiError extends AppExceptions {
  ApiError()
      : super(
      message: "Our servers returned an error, please try again later");
}

class ConversionError extends AppExceptions {
  ConversionError()
      : super(
      message: "Data could not be shown, please try again later");
}
