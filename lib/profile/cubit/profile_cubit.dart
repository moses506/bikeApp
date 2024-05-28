import 'dart:async';

import 'package:app_repo/app_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this.repo,
  ) : super(const ProfileState());

  final AppRepo repo;

  Future<void> fertchData(int id) async {
    await fertchPlaces();
  }

  Future<void> fertchPlaces() async {
    emit(state.copyWith(status: ProfileStatus.loading));
    final response = repo.fertchplaces();

    
    emit(
      state.copyWith(
      
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
