part of 'app_bloc.dart';

class AppState extends Equatable {
  final ThemeMode themeMode;

  const AppState({required this.themeMode});

  AppState copWith({
    ThemeMode? themeMode,
  }) =>
      AppState(
        themeMode: themeMode ?? this.themeMode,
      );

  @override
  List<Object?> get props => [themeMode];
}