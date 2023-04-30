import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:tads_app/src/features/profile/data/repositories/profile_repo_impl.dart';
import 'package:tads_app/src/features/profile/domain/repositories/profile_repository.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileRepository repo = ProfileRepoImpl();

  ProfileBloc() : super(const ProfileState()) {
    on<GetUserEvent>(_onGetUser);
  }

  FutureOr<void> _onGetUser(
      GetUserEvent event, Emitter<ProfileState> emit) async {
    emit(state.copWith(statusGetUser: FormzSubmissionStatus.inProgress));
    var res = await repo.getUser();
    if (res.isRight) {
      emit(state.copWith(statusGetUser: FormzSubmissionStatus.success));
    } else {
      emit(state.copWith(
        statusGetUser: FormzSubmissionStatus.failure,
        errorMessage: res.left.errorMessage,
      ));
    }
  }


  void dispose() {
    repo.dispose();
  }

  void newRepo() {
    repo = ProfileRepoImpl();
  }
}
