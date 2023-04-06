import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tads_app/src/data/repos/login_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final repo = LoginRepository();

  LoginBloc() : super(LoginInitial()) {
    on<InitialEvent>(_init);
  }

  Future _init(InitialEvent event, Emitter<LoginState> emit) async {
    var res = await repo.getDonationList(10, 1);
    if(res.isRight) {

    } else {

    }
  }
}
