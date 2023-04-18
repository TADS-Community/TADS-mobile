part of 'app_bloc.dart';

class AppState extends Equatable {
  final String themeMode;

  const AppState({required this.themeMode});

  AppState copWith({
    String? themeMode,
  }) =>
      AppState(
        themeMode: themeMode ?? this.themeMode,
      );

  @override
  List<Object?> get props => [themeMode];
}