import 'package:equatable/equatable.dart';
import '../../models/user.dart';

abstract class CrudEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadUsers extends CrudEvent {}

class CreateUser extends CrudEvent {
  final User user;

  CreateUser(this.user);

  @override
  List<Object> get props => [user];
}

class UpdateUser extends CrudEvent {
  final User user;

  UpdateUser(this.user);

  @override
  List<Object> get props => [user];
}

class DeleteUser extends CrudEvent {
  final String userId;

  DeleteUser(this.userId);

  @override
  List<Object> get props => [userId];
}
