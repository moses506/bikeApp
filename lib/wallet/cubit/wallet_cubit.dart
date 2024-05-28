import 'dart:async';

import 'package:app_repo/app_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit(
    this.repo,
  ) : super(const WalletState());

  final AppRepo repo;

  Future<void> fertchData(int id) async {
    await fertchPlaces();
  }

  Future<void> fertchPlaces() async {
    emit(state.copyWith(status: WalletStatus.loading));
    final response = repo.fertchplaces();

    
    emit(
      state.copyWith(
        status: WalletStatus.success,
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
