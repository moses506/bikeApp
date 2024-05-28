import 'dart:async';

import 'package:app_repo/app_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repo) : super(const AuthState()) {
    on<AuthStatusChanged>(
      _onAuthStatusChanged,
    );
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
    _authStatusSub = _repo.status.listen(
      (status) => add(
        AuthStatusChanged(status),
      ),
    );
  }

  final AppRepo _repo;
  late StreamSubscription<AuthStatus> _authStatusSub;

  @override
  Future<void> close() {
    _authStatusSub.cancel();
    _repo.dispose();
    return super.close();
  }

  Future<void> _onAuthStatusChanged(
    AuthStatusChanged event,
    Emitter<AuthState> emit,
  ) async {
    final user = await _tryGetUser();
    return emit(
      state.copyWith(
        status: event.status,
        user: user,
      ),
    );
  }

  void _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) =>
      _repo.logOut();

  Future<User?> _tryGetUser() async {
    try {
      final user = await _repo.getUser();
      return user;
    } catch (_) {
      return null;
    }
  }
}
