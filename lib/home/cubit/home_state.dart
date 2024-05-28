part of 'home_cubit.dart';

/// {@template home}
/// HomeState description
/// {@endtemplate}
class HomeState extends Equatable {
  /// {@macro home}
  const HomeState(this.index);

  final int index;

  @override
  List<Object> get props => [index];

  HomeState copyWith(int? index) {
    return HomeState(index ?? this.index);
  }
}
