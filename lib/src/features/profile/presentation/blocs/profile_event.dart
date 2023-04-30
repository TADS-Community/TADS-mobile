part of 'profile_bloc.dart';

abstract class ProfileEvent {
  const ProfileEvent();
}

class GetUserEvent extends ProfileEvent {}

class ChangeStatusEvent extends ProfileEvent {
  final FormzSubmissionStatus status;

  const ChangeStatusEvent(this.status);
}

class UpdateUserEvent extends ProfileEvent {
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? email;

  const UpdateUserEvent({
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
  });
}
