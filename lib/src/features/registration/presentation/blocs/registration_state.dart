part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  final int id;
  final String errorMessage;
  final FormzSubmissionStatus statusReg;

  const RegistrationState({
    this.id = -1,
    this.errorMessage = '',
    this.statusReg = FormzSubmissionStatus.initial,
  });

  RegistrationState copWith({
    int? id,
    String? errorMessage,
    FormzSubmissionStatus? statusReg,
  }) =>
      RegistrationState(
        id: id ?? this.id,
        errorMessage: errorMessage ?? this.errorMessage,
        statusReg: statusReg ?? this.statusReg,
      );

  @override
  List<Object?> get props => [errorMessage, statusReg, id];
}
