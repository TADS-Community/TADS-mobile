import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:tads_app/src/features/common/data/models/auth_post_model.dart';
import 'package:tads_app/src/features/registration/data/repos/register_repo_impl.dart';
import 'package:tads_app/src/features/registration/domain/repositories/register_repository.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final RegisterRepository repo = RegisterRepoImpl();

  RegistrationBloc() : super(const RegistrationState()) {
    on<ChangeStatusEvent>(_onChangeStatus);
    on<RegisterEvent>(_register);
  }

  Future _onChangeStatus(
      ChangeStatusEvent event, Emitter<RegistrationState> emit) async {
    emit(state.copWith(statusReg: event.status));
  }

  _register(RegisterEvent event, Emitter<RegistrationState> emit) async {
    add(const ChangeStatusEvent(FormzSubmissionStatus.inProgress));
    var res = await repo.register(AuthPostModel(password: event.password));
    if (res.isRight) {
      emit(state.copWith(
        id: res.right.uid,
        statusReg: FormzSubmissionStatus.success,
      ));
    } else {
      emit(state.copWith(
        statusReg: FormzSubmissionStatus.failure,
        errorMessage: res.left.errorMessage,
      ));
    }
  }

  void dispose() {
    repo.dispose();
  }
}
