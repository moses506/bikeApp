part of 'wallet_cubit.dart';

enum WalletStatus {
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
class WalletState extends Equatable {
  /// {@macro history}
  const WalletState({
    this.status = WalletStatus.initial,
    this.message = '',
    this.places=const[],
 
  });

  final WalletStatus status;
 
  final String message;
final List<Places>places;

  bool get isLoading => status == WalletStatus.loading;
  bool get loadingPending => status == WalletStatus.loadingPending;
  bool get loadingActive => status == WalletStatus.loadingActive;
  bool get loadingBorad => status == WalletStatus.loadingBoard;
  bool get loadingDisabled => status == WalletStatus.loadingDisabled;
  bool get loadingRejected => status == WalletStatus.loadingRejected;
  bool get loadingPlaces => status == WalletStatus.loadingPlaces;


  @override
  List<Object> get props => [
        status,
        message,
        places,
       
      ];

  /// Creates a copy of the current HistoryState with property changes
  WalletState copyWith({
    WalletStatus? status,
    String? message,
    List<Places>?places,
   
  }) {
    return WalletState(
      status: status ?? this.status,
      message: message ?? this.message,
      places: places?? this.places,
     
    );
  }
}
