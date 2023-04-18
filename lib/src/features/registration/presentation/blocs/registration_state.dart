part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  final String? id;
  final FormzSubmissionStatus statusReg;

  const RegistrationState({
    this.id,
    this.statusReg = FormzSubmissionStatus.initial,
  });

  RegistrationState copWith({
    String? id,
    FormzSubmissionStatus? statusReg,
  }) =>
      RegistrationState(
        id: id ?? this.id,
        statusReg: statusReg ?? this.statusReg,
      );

  @override
  List<Object?> get props => [id, statusReg];
}
