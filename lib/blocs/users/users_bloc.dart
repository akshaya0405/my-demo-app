import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/models/user.dart';
import '/service/user_info_service.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UserInfoService _userInfoService;

  UsersBloc(this._userInfoService) : super(UsersInitial()) {
    on<FetchUsersEvent>(_onFetchUsers);
  }

  Future<void> _onFetchUsers(
      FetchUsersEvent event, Emitter<UsersState> emit) async {
    try {
      emit(UsersLoadingState());
      final response = await _userInfoService.fetchUsers();
      final users = response.map((json) => User.fromJson(json)).toList();
      emit(UsersLoadedState(users: users));
    } catch (e) {
      emit(UsersErrorState(error: e.toString()));
    }
  }
}
