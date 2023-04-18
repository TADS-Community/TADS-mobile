part of 'login_bloc.dart';

class LoginState extends Equatable {
  final FormzSubmissionStatus statusLogin;
  final String errorMessage;

  const LoginState({
    this.statusLogin = FormzSubmissionStatus.initial,
    this.errorMessage = '',
  });

  LoginState copWith({
    FormzSubmissionStatus? statusLogin,
    String? errorMessage,
  }) =>
      LoginState(
        statusLogin: statusLogin ?? this.statusLogin,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        statusLogin,
        errorMessage,
      ];
}
