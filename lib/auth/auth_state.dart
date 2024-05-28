part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.unknown,
    this.user = User.empty,
    this.bio = Bio.empty,
    this.role = Role.empty,
  });

  final AuthStatus status;
  final User user;
  final Bio bio;
  final Role role;

  bool get authenticated => status == AuthStatus.authenticated;

  AuthState copyWith({
    AuthStatus? status,
    User? user,
    Bio? bio,
    Role? role,
  }) {
    return AuthState(
      user: user ?? this.user,
      bio: bio ?? this.bio,
      role: role ?? this.role,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status, user, bio, role];
}
