part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  final String? id;
  final FormzSubmissionStatus statusID;

  const RegistrationState({
    this.id,
    this.statusID = FormzSubmissionStatus.initial,
  });

  RegistrationState copWith({
    String? id,
    FormzSubmissionStatus? statusID,
  }) =>
      RegistrationState(
        id: id ?? this.id,
        statusID: statusID ?? this.statusID,
      );

  @override
  List<Object?> get props => [id, statusID];
}
