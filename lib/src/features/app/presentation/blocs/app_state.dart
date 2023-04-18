part of 'app_bloc.dart';

class AppState extends Equatable {
  final String themeMode;
  final bool unlocked;

  const AppState({
    required this.themeMode,
    this.unlocked = false,
  });

  AppState copWith({
    String? themeMode,
    bool? unlocked,
  }) =>
      AppState(
        themeMode: themeMode ?? this.themeMode,
        unlocked: unlocked ?? this.unlocked,
      );

  @override
  List<Object?> get props => [themeMode, unlocked];
}
