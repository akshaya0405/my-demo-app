import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginBloc() : super(LoginState()) {
    on<UsernameChanged>((event, emit) {
      final isValid = _validate(event.username, state.password);
      emit(state.copyWith(username: event.username, isValid: isValid));
    });

    on<PasswordChanged>((event, emit) {
      final isValid = _validate(state.username, event.password);
      emit(state.copyWith(password: event.password, isValid: isValid));
    });

    on<SubmitLogin>((event, emit) {
      if (state.isValid) {
        emit(state.copyWith(isSubmitted: true, errorMessage: null));
      } else {
        emit(state.copyWith(errorMessage: 'Invalid username or password'));
      }
    });

    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
    });
  }

  bool _validate(String username, String password) {
    final isUsernameValid = username.length >= 4 &&
        username.length <= 20 &&
        RegExp(r'^[a-zA-Z0-9]+$').hasMatch(username);
    final isPasswordValid = password.length >= 6 &&
        RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password);
    return isUsernameValid && isPasswordValid;
  }
}
