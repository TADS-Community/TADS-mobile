part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();
}

class GenerateID extends RegistrationEvent {
  @override
  List<Object?> get props => [];
}

class ChangeStatusEvent extends RegistrationEvent {
  final FormzSubmissionStatus status;

  const ChangeStatusEvent(this.status);

  @override
  List<Object?> get props => [status];
}
