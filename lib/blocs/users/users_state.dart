part of 'users_bloc.dart';


sealed class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

final class UsersInitial extends UsersState {}

final class UsersLoadingState extends UsersState {}

final class UsersLoadedState extends UsersState {
  final List<User> users;

  UsersLoadedState({required this.users});

  @override
  List<Object> get props => [users];
}

final class UsersErrorState extends UsersState {
  final String error;

  UsersErrorState({required this.error});

  @override
  List<Object> get props => [error];
}

final class UserDetailLoadedState extends UsersState {
  final User user;

  UserDetailLoadedState({required this.user});

  @override
  List<Object> get props => [user];
}
