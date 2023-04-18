import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(ThemeMode themeMode) : super(AppState(themeMode: themeMode)) {
    on<ChangeThemeModeEvent>((event, emit) {
      emit(state.copWith(themeMode: event.mode));
    });
  }
}
