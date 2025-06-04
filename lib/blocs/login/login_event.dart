import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UsernameChanged extends LoginEvent {
  final String username;

  UsernameChanged(this.username);

  @override
  List<Object?> get props => [username];
}

class PasswordChanged extends LoginEvent {
  final String password;

  PasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class SubmitLogin extends LoginEvent {}

class TogglePasswordVisibility extends LoginEvent {}
