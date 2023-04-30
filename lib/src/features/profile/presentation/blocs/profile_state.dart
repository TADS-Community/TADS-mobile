part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final FormzSubmissionStatus statusGetUser;
  final String errorMessage;
  final UserEntity user;

  const ProfileState({
    this.statusGetUser = FormzSubmissionStatus.initial,
    this.errorMessage = '',
    this.user = const UserEntity(),
  });

  ProfileState copWith({
    FormzSubmissionStatus? statusGetUser,
    String? errorMessage,
    UserEntity? user,
  }) =>
      ProfileState(
        statusGetUser: statusGetUser ?? this.statusGetUser,
        errorMessage: errorMessage ?? this.errorMessage,
        user: user ?? this.user,
      );

  @override
  List<Object?> get props => [
        statusGetUser,
        errorMessage,
        user,
      ];
}
