import 'package:desafio_mobile/features/users/data/models/user_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UsersListState {}

class Empty extends UsersListState {}

class Loading extends UsersListState {}

class Loaded extends UsersListState {
  final List<UserModel>? users;
  Loaded({required this.users});
}

class Error extends UsersListState {
  final String message;
  Error({required this.message});
}