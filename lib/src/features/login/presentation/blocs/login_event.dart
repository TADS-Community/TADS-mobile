part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {
  const LoginEvent();
}

class InitialEvent extends LoginEvent {}

class PostLoginEvent extends LoginEvent {
  final String? uid;
  final String password;
  final String? email;
  final String? phone;

  const PostLoginEvent({
    this.uid,
    required this.password,
    this.email,
    this.phone,
  });
}

class ChangeStatusEvent extends LoginEvent {
  final FormzSubmissionStatus status;

  const ChangeStatusEvent(this.status);
}
