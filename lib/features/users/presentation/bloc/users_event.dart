
import 'package:flutter/material.dart';

@immutable
abstract class UsersListEvent {}

class GetDefaultUsersListEvent extends UsersListEvent {}
class GetUsersListByGenderFemaleEvent extends UsersListEvent {}
class GetUsersListByGenderMaleEvent extends UsersListEvent {}
class GetDefaultUsersListEventOffline extends UsersListEvent {}