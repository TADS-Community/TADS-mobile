import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(const RegistrationState()) {
    on<GenerateID>(_generateID);
    on<ChangeStatusEvent>(_onChangeStatus);
  }

  Future _onChangeStatus(
      ChangeStatusEvent event, Emitter<RegistrationState> emit) async {
    emit(state.copWith(statusReg: event.status));
  }

  _generateID(GenerateID event, Emitter<RegistrationState> emit) async {
    add(const ChangeStatusEvent(FormzSubmissionStatus.inProgress));
    final result = await Future.delayed(const Duration(seconds: 2));
    if (false) {
      emit(state.copWith(statusReg: FormzSubmissionStatus.success));
    } else {
      emit(state.copWith(statusReg: FormzSubmissionStatus.failure));
    }
  }
}
