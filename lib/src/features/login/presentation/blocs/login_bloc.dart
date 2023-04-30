import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:tads_app/src/core/local_source/local_storage.dart';
import 'package:tads_app/src/features/common/data/models/auth_post_model.dart';
import 'package:tads_app/src/features/login/data/repositories/login_repo_impl.dart';
import 'package:tads_app/src/features/login/domain/repositories/login_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository repo = LoginRepoImpl();

  LoginBloc() : super(const LoginState()) {
    on<InitialEvent>(_init);
    on<PostLoginEvent>(_login);
    on<ChangeStatusEvent>(_onChangeStatus);
  }

  Future _onChangeStatus(
      ChangeStatusEvent event, Emitter<LoginState> emit) async {
    emit(state.copWith(statusLogin: event.status));
  }

  Future _init(InitialEvent event, Emitter<LoginState> emit) async {}

  Future _login(PostLoginEvent event, Emitter<LoginState> emit) async {
    add(const ChangeStatusEvent(FormzSubmissionStatus.inProgress));
    var res = await repo.login(AuthPostModel(
      uid: event.uid,
      password: event.password,
      email: event.email,
      phone: event.phone,
    ));
    if (res.isRight) {
      LocalStorage.setAccessToken(res.right.access);
      LocalStorage.setRefreshToken(res.right.refresh);
      emit(state.copWith(statusLogin: FormzSubmissionStatus.success));
    } else {
      emit(state.copWith(
        statusLogin: FormzSubmissionStatus.failure,
        errorMessage: res.left.errorMessage,
      ));
    }
  }

  void dispose() {
    repo.dispose();
  }

  void newRepo() {
    repo = LoginRepoImpl();
  }
}
