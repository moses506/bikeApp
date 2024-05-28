part of 'nofications_cubit.dart';

enum NotificationsStatus {
  initial,
  loading,
  success,
  error,
  loadingPending,
  loadingActive,
  loadingBoard,
  loadingDisabled,
  loadingRejected,
  loadingPlaces
}

/// {@template history}
/// HistoryState description
/// {@endtemplate}
class NotificationsState extends Equatable {
  /// {@macro history}
  const NotificationsState({
    this.status = NotificationsStatus.initial,
    this.message = '',
    this.places=const[],
 
  });

  final NotificationsStatus status;
 
  final String message;
final List<Places>places;

  bool get isLoading => status == NotificationsStatus.loading;
  bool get loadingPending => status == NotificationsStatus.loadingPending;
  bool get loadingActive => status == NotificationsStatus.loadingActive;
  bool get loadingBorad => status == NotificationsStatus.loadingBoard;
  bool get loadingDisabled => status == NotificationsStatus.loadingDisabled;
  bool get loadingRejected => status == NotificationsStatus.loadingRejected;
  bool get loadingPlaces => status == NotificationsStatus.loadingPlaces;


  @override
  List<Object> get props => [
        status,
        message,
        places,
       
      ];

  /// Creates a copy of the current HistoryState with property changes
  NotificationsState copyWith({
    NotificationsStatus? status,
    String? message,
    List<Places>?places,
   
  }) {
    return NotificationsState(
      status: status ?? this.status,
      message: message ?? this.message,
      places: places?? this.places,
     
    );
  }
}
