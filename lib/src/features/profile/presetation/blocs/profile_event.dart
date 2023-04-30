part of 'profile_bloc.dart';

abstract class ProfileEvent {
  const ProfileEvent();
}

class GetUserEvent extends ProfileEvent {}

class ChangeStatusEvent extends ProfileEvent {
  final FormzSubmissionStatus status;

  const ChangeStatusEvent(this.status);
}
