import 'dart:async';

import 'package:app_repo/app_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_state.dart';

class DashoardCubit extends Cubit<DashoardState> {
  DashoardCubit(
    this.repo,
  ) : super(const DashoardState());

  final AppRepo repo;

  Future<void> fertchData(int id) async {
    await fertchPlaces();
  }

  Future<void> fertchPlaces() async {
    emit(state.copyWith(status: DashoardStatus.loading));
    final response = repo.fertchplaces();

    print(response);
    emit(
      state.copyWith(
        status: DashoardStatus.success,
        places: response,
      ),
    );
  }

  // late StreamSubscription<List<Billboard>> _recordsSub;

  @override
  Future<void> close() {
    // _recordsSub.cancel();
    return super.close();
  }
}
