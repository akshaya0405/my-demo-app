import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'crud_event.dart';
import 'crud_state.dart';
import '../../models/user.dart';
import '../../service/notification_service.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CrudBloc() : super(CrudInitial()) {
    on<LoadUsers>(_onLoadUsers);
    on<CreateUser>(_onCreateUser);
    on<UpdateUser>(_onUpdateUser);
    on<DeleteUser>(_onDeleteUser);
  }

  Future<void> _onLoadUsers(LoadUsers event, Emitter<CrudState> emit) async {
    emit(UserLoading());
    try {
      QuerySnapshot snapshot = await _firestore.collection('users').get();
      List<User> users =
          snapshot.docs.map((doc) => User.fromFirestore(doc)).toList();
      emit(UsersLoaded(users));
    } catch (e) {
      emit(UserError('Failed to load users: ${e.toString()}'));
    }
  }

  Future<void> _onCreateUser(CreateUser event, Emitter<CrudState> emit) async {
    try {
      await _firestore.collection('users').add(event.user.toMap());
      emit(UserCreated());
      add(LoadUsers()); // Reload users after adding

      // Show a notification
      await NotificationService.showNotification(
        'User Created',
        '${event.user.name} has been added successfully!',
      );
    } catch (e) {
      emit(UserError('Failed to create user: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateUser(UpdateUser event, Emitter<CrudState> emit) async {
    try {
      await _firestore
          .collection('users')
          .doc(event.user.id)
          .update(event.user.toMap());
      emit(UserUpdated());
      add(LoadUsers()); // Reload users
    } catch (e) {
      emit(UserError('Failed to update user: ${e.toString()}'));
    }
  }

  Future<void> _onDeleteUser(DeleteUser event, Emitter<CrudState> emit) async {
    try {
      await _firestore
          .collection('users')
          .doc(event.userId.toString())
          .delete();
      emit(UserDeleted());
      add(LoadUsers()); // Reload users
    } catch (e) {
      emit(UserError('Failed to delete user: ${e.toString()}'));
    }
  }
}
