part of 'app_bloc.dart';

abstract class AppEvent {
  const AppEvent();
}

class ChangeThemeModeEvent extends AppEvent {
  final ThemeMode mode;

  const ChangeThemeModeEvent(this.mode);
}
