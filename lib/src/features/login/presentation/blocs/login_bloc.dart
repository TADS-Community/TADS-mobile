import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tads_app/src/features/login/data/repos/login_repo_impl.dart';
import 'package:tads_app/src/features/login/domain/repositories/login_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repo = LoginRepoImpl();

  LoginBloc() : super(LoginInitial()) {
    on<InitialEvent>(_init);
  }

  Future _init(InitialEvent event, Emitter<LoginState> emit) async {
    var res = await repo.getDonationList(10, 1);
    if(res.isRight) {

    } else {

    }
  }

  void dispose() {
    repo.dispose();
  }
}
