import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(0));

  FutureOr<void> navigate(int index) {
    emit(state.copyWith(index));
  }
}
