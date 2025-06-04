part of 'users_bloc.dart';

sealed class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

final class FetchUsersEvent extends UsersEvent {}

final class FetchUserDetailEvent extends UsersEvent {
  final String userId;

  FetchUserDetailEvent({required this.userId});

  @override
  List<Object> get props => [userId];
}
