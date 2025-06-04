// lib/blocs/crud/crud_state.dart
import 'package:equatable/equatable.dart';
import '../../models/user.dart';

abstract class CrudState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserCreated extends CrudState {}

class UserUpdated extends CrudState {}

class UserDeleted extends CrudState {}

class CrudInitial extends CrudState {}

class UserLoading extends CrudState {}

class UsersLoaded extends CrudState {
  final List<User> users;

  UsersLoaded(this.users);

  @override
  List<Object> get props => [users];
}

class UserError extends CrudState {
  final String message;

  UserError(this.message);

  @override
  List<Object> get props => [message];
}
