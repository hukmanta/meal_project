import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:template_project/domain/auth/i_auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _repository;

  AuthBloc(this._repository) : super(const AuthState.initial()) {
    on<Started>(_loginLogic);
  }

  FutureOr<void> _loginLogic(Started event, Emitter<AuthState> emit) {
    bool isAuthenticated = _repository.isLogin();
    isAuthenticated
        ? emit(const AuthState.authenticated())
        : emit(const AuthState.unAuthenticated());
  }
}
