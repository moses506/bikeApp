part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  error,
  authenticated,
  loadingclient,
  loadingBank,
  SuccessBank,
  
}

/// {@template login}
/// LoginState description
/// {@endtemplate}
class LoginState extends Equatable {
  /// {@macro login}
  const LoginState({
    this.status = LoginStatus.initial,
    this.message = '',
    this.role='',
    this.banks=const[],
  });

  final LoginStatus status;
  final String message;
  final String role;
  final List<Bank>banks;
  

  bool get isLoading => status == LoginStatus.loading;
  bool get clientLoading => status == LoginStatus.loadingclient;
  bool get bankLoading => status == LoginStatus.loadingBank;

  @override
  List<Object> get props => [status, message,role, banks];

  /// Creates a copy of the current LoginState with property changes
  LoginState copyWith({
    LoginStatus? status,
    String? message,
    String? role,
    List<Bank>?banks,

    
  }) {
    return LoginState(
      status: status ?? this.status,
      message: message ?? this.message,
      role:  role ?? this. role,
      banks: banks ?? this.banks,
    );
  }
}
