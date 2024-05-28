import 'dart:async';

import 'package:app_repo/app_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(
    this.repo,
  ) : super(const NotificationsState());

  final AppRepo repo;

  Future<void> fertchData(int id) async {
    await fertchPlaces();
  }

  Future<void> fertchPlaces() async {
    emit(state.copyWith(status: NotificationsStatus.loading));
    final response = repo.fertchplaces();

    
    emit(
      state.copyWith(
        status: NotificationsStatus.success,
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
