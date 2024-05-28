part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  const ThemeState({
    this.mode = ThemeMode.system,
    this.description = 'System Default',
    this.icon = Icons.brightness_auto_outlined,
  });

  final ThemeMode mode;
  final String description;
  final IconData icon;

  @override
  List<Object> get props => [mode, description, icon];

  /// Creates a copy of the current [ThemeState] with property changes
  ThemeState copyWith({
    String? description,
    ThemeMode? mode,
    IconData? icon,
  }) {
    return ThemeState(
      description: description ?? this.description,
      mode: mode ?? this.mode,
      icon: icon ?? this.icon,
    );
  }
}
