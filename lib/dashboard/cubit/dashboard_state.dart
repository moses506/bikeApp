part of 'dashboard_cubit.dart';

enum DashoardStatus {
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
class DashoardState extends Equatable {
  /// {@macro history}
  const DashoardState({
    this.status = DashoardStatus.initial,
    this.message = '',
    this.places=const[],
 
  });

  final DashoardStatus status;
 
  final String message;
final List<Places>places;

  bool get isLoading => status == DashoardStatus.loading;
  bool get loadingPending => status == DashoardStatus.loadingPending;
  bool get loadingActive => status == DashoardStatus.loadingActive;
  bool get loadingBorad => status == DashoardStatus.loadingBoard;
  bool get loadingDisabled => status == DashoardStatus.loadingDisabled;
  bool get loadingRejected => status == DashoardStatus.loadingRejected;
  bool get loadingPlaces => status == DashoardStatus.loadingPlaces;


  @override
  List<Object> get props => [
        status,
        message,
        places,
       
      ];

  /// Creates a copy of the current HistoryState with property changes
  DashoardState copyWith({
    DashoardStatus? status,
    String? message,
    List<Places>?places,
   
  }) {
    return DashoardState(
      status: status ?? this.status,
      message: message ?? this.message,
      places: places?? this.places,
     
    );
  }
}
