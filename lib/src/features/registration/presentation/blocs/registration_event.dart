part of 'registration_bloc.dart';

abstract class RegistrationEvent {
  const RegistrationEvent();
}

class RegisterEvent extends RegistrationEvent {
  final String password;

  const RegisterEvent(this.password);
}

class ChangeStatusEvent extends RegistrationEvent {
  final FormzSubmissionStatus status;

  const ChangeStatusEvent(this.status);
}
