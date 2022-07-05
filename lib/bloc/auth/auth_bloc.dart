import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';

import '../../models/model.dart';
import '../../repositories/repositories.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  StreamSubscription<auth.User?>? _authStreamSubscription;
  StreamSubscription<User?>? _userStreamSubscription;

  AuthBloc({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  })  : _authRepository = authRepository,
        _userRepository = userRepository,
        super(const AuthState.unknown()) {
    on<AuthUserChanged>(_onAuthUserChanged);

    _authStreamSubscription = _authRepository.user.listen((authUser) {
      debugPrint('auth user: $authUser');
      if (authUser != null) {
        _userRepository.getUser(authUser.uid).listen((user) {
          add(AuthUserChanged(authUser: authUser, user: user));
        });
      } else {
        add(AuthUserChanged(authUser: authUser));
      }
    });
  }

  void _onAuthUserChanged(
    AuthUserChanged event,
    Emitter<AuthState> emit,
  ) {
    event.authUser != null
        ? emit(
            AuthState.authenticate(
              authUser: event.authUser!,
              user: event.user!,
            ),
          )
        : emit(
            const AuthState.unauthenticated(),
          );
  }

  @override
  Future<void> close() {
    _authStreamSubscription?.cancel();
    _userStreamSubscription?.cancel();
    return super.close();
  }
}
