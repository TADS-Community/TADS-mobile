part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final FormzSubmissionStatus statusGetUser;
  final String errorMessage;

  const ProfileState({
    this.statusGetUser = FormzSubmissionStatus.initial,
    this.errorMessage = '',
  });

  ProfileState copWith({
    FormzSubmissionStatus? statusGetUser,
    String? errorMessage,
  }) =>
      ProfileState(
        statusGetUser: statusGetUser ?? this.statusGetUser,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        statusGetUser,
        errorMessage,
      ];
}
